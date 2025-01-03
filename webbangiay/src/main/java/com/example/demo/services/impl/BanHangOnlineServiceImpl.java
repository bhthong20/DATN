package com.example.demo.services.impl;

import com.example.demo.models.*;
import com.example.demo.models.dto.BanHangRequest;
import com.example.demo.models.dto.HoaDonRequest;
import com.example.demo.models.dto.SanPhamAddHoaDon;
import com.example.demo.repositories.*;
import com.example.demo.services.BanHangOnlineService;
import com.example.demo.util.UserLoginCommon;
import jakarta.transaction.Transactional;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.UUID;

@Service
public class BanHangOnlineServiceImpl implements BanHangOnlineService {

    @Autowired
    private GioHangChiTietRepository gioHangChiTietRepository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;

    @Autowired
    private VNPayService vnPayService;

    @Autowired
    private UserLoginCommon common;

    @Autowired
    private LichSuTrangThaiRepository lichSuTrangThaiRepository;

    @Override
    public Long countGioHang() {
        return gioHangChiTietRepository.countByKhachHang((KhachHang) common.getUserLogin());
    }

    @Override
    public List<GioHangChiTiet> getListGioHang() {
        return gioHangChiTietRepository.findAllByKhachHang((KhachHang) common.getUserLogin());
    }

    @Override
    @Transactional
    public Boolean themVaoGioHang(BanHangRequest banHangRequest) throws BadRequestException {
        try {
            ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(UUID.fromString(banHangRequest.getChiTietSanPham())).get();
            Optional<GioHangChiTiet> gioHangChiTiet = gioHangChiTietRepository.
                    findByKhachHangAndChiTietSanPham((KhachHang) common.getUserLogin(), chiTietSanPham);

            if (gioHangChiTiet.isEmpty()) {
                GioHangChiTiet gioHangChiTietNew = new GioHangChiTiet();
                gioHangChiTietNew.setChiTietSanPham(chiTietSanPham);
                gioHangChiTietNew.setKhachHang((KhachHang) common.getUserLogin());
                gioHangChiTietNew.setSoLuong(banHangRequest.getSoLuong());
                gioHangChiTietRepository.save(gioHangChiTietNew);
            } else {
                if (gioHangChiTiet.get().getSoLuong() + banHangRequest.getSoLuong() > chiTietSanPham.getSoLuongTon()) {
                    throw new BadRequestException("Số lượng sản phẩm không đủ");
                }
                gioHangChiTiet.get().setSoLuong(gioHangChiTiet.get().getSoLuong() + banHangRequest.getSoLuong());
                gioHangChiTietRepository.save(gioHangChiTiet.get());
            }
        } catch (Exception e) {
            throw e;
        }
        return true;
    }

    @Override
    @Transactional
    public Boolean updateGioHang(List<BanHangRequest> list) throws BadRequestException {
        try {
            for (BanHangRequest el : list) {
                ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(UUID.fromString(el.getChiTietSanPham())).get();
                Optional<GioHangChiTiet> gioHangChiTiet = gioHangChiTietRepository.
                        findByKhachHangAndChiTietSanPham((KhachHang) common.getUserLogin(), chiTietSanPham);

                if (el.getSoLuong() > chiTietSanPham.getSoLuongTon()) {
                    throw new BadRequestException("Sản phẩm " + chiTietSanPham.getSanPham().getTenSP() +
                            ". Có màu " + chiTietSanPham.getMauSac().getTen() +
                            ". Có kích cớ: " + chiTietSanPham.getKichThuoc().getSize() +
                            ". Có chất liệu: " + chiTietSanPham.getChatLieu().getTenChatLieu() +
                            ". Chỉ còn lại " + chiTietSanPham.getSoLuongTon());
                }

                gioHangChiTiet.get().setSoLuong(el.getSoLuong());
                gioHangChiTietRepository.save(gioHangChiTiet.get());
            }
        } catch (Exception e) {
            throw e;
        }
        return true;
    }

    @Override
    public Boolean deleteGioHang(List<UUID> listId) {
        gioHangChiTietRepository.deleteAllById(listId);
        return true;
    }

    private static final int MAX_RETRY_ATTEMPTS = 1000; // Số lần thử tạo mã mới tối đa

    // Hàm tạo mã hóa đơn ngẫu nhiên độ dài 4 chữ số
    private String generateRandomCode() {
        Random random = new Random();
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            stringBuilder.append(random.nextInt(10)); // Random số từ 0 đến 9
        }
        return stringBuilder.toString();
    }

    // Hàm kiểm tra xem mã đã tồn tại trong danh sách hóa đơn hay chưa
    private boolean isCodeExists(String code, List<HoaDon> hoaDons) {
        for (HoaDon hoaDon : hoaDons) {
            if (hoaDon.getMa().equals(code)) {
                return true; // Mã đã tồn tại
            }
        }
        return false; // Mã chưa tồn tại
    }

    @Override
    @Transactional
    public UUID taoHoaDon(List<BanHangRequest> list) throws BadRequestException {
        try {
            List<HoaDon> hoaDonss = hoaDonRepository.findAllByLoaiAndTrangThai(1, 9);
            List<HoaDon> hoaDons = hoaDonRepository.findAll(); // Lấy danh sách hóa đơn từ cơ sở dữ liệu
            if (hoaDonss.size() >= 10) {
                throw new BadRequestException("Xin lỗi! Nhưng bạn chỉ được tạo tối đa 10 hóa đơn chờ!Vui lòng vào vào đơn mua hủy đơn hàng để tiếp tục mua sắm ");
            }
            int attempts = 0;
            String newCode;
            do {
                newCode = "HĐ0" + generateRandomCode(); // Tạo mã mới
                attempts++;
                if (attempts > MAX_RETRY_ATTEMPTS) {
                    throw new BadRequestException("Không thể tạo mã hóa đơn mới sau " + MAX_RETRY_ATTEMPTS + " lần thử.");
                }
            } while (isCodeExists(newCode, hoaDons)); // Kiểm tra mã mới có tồn tại không

            HoaDon hoaDon = new HoaDon();
            hoaDon.setKhachHang((KhachHang) common.getUserLogin());
            hoaDon.setLoai(1);
            hoaDon.setTrangThai(9);
            hoaDon.setMa(newCode);
            hoaDon.setId(hoaDonRepository.save(hoaDon).getId());

            LichSuTrangThai lichSuTrangThai = new LichSuTrangThai();
            lichSuTrangThai.setTrangThai(hoaDon.getTrangThai());
            lichSuTrangThai.setHoaDon(hoaDon);
            lichSuTrangThai.setIsDelete(1);
            lichSuTrangThaiRepository.save(lichSuTrangThai);

            for (BanHangRequest el : list) {
                ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(UUID.fromString(el.getChiTietSanPham())).get();
                Optional<GioHangChiTiet> gioHangChiTiet = gioHangChiTietRepository.
                        findByKhachHangAndChiTietSanPham((KhachHang) common.getUserLogin(), chiTietSanPham);

                if (el.getSoLuong() > chiTietSanPham.getSoLuongTon()) {
                    throw new BadRequestException("Sản phẩm " + chiTietSanPham.getSanPham().getTenSP() +
                            ". Có màu " + chiTietSanPham.getMauSac().getTen() +
                            ". Có kích cớ: " + chiTietSanPham.getKichThuoc().getSize() +
                            ". Có chất liệu: " + chiTietSanPham.getChatLieu().getTenChatLieu() +
                            ". Chỉ còn lại " + chiTietSanPham.getSoLuongTon());
                }

                if (!gioHangChiTiet.isEmpty()) {
                    gioHangChiTietRepository.deleteById(gioHangChiTiet.get().getId());
                }

                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setHoaDon(hoaDon);
                hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
                hoaDonChiTiet.setSoLuong(el.getSoLuong());
                hoaDonChiTiet.setDonGia(el.getDonGia());
                hoaDonChiTiet.setTrangThai(0);

                hoaDonChiTietRepository.save(hoaDonChiTiet);
            }
            return hoaDon.getId();
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public HoaDon findHoaDonById(UUID id) {
        return hoaDonRepository.findById(id).orElse(null);
    }

    @Override
    public List<HoaDonChiTiet> listHoaDonChiTiet(UUID id) {
        return hoaDonChiTietRepository.findHoaDonChiTietByHoaDonAndTrangThai(hoaDonRepository.findById(id).orElse(null), 0);
    }

    @Override
    public List<HoaDon> listHoaDon(int trangThai) {
        if (trangThai == -1) {
            return hoaDonRepository.findAllByLoaiAndKhachHang(1, (KhachHang) common.getUserLogin());
        }
        return hoaDonRepository.findAllByLoaiAndTrangThaiAndKhachHang(1, trangThai, (KhachHang) common.getUserLogin());
    }

    @Override
    public int countHoaDonByTrangThai(int trangThai) {
        return hoaDonRepository.findAllByTrangThaiAndKhachHang(trangThai, (KhachHang) common.getUserLogin()).size();
    }

    @Override
    @Transactional
    public Boolean updateHoaDon(List<BanHangRequest> banHangRequests, UUID idHoaDon) throws BadRequestException {
        try {
            HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
            for (BanHangRequest el : banHangRequests) {
                ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(UUID.fromString(el.getChiTietSanPham())).get();
                Optional<HoaDonChiTiet> hoaDonChiTiet = hoaDonChiTietRepository.
                        findHoaDonChiTietByHoaDonAndChiTietSanPham(hoaDon, chiTietSanPham);

                if (el.getSoLuong() > chiTietSanPham.getSoLuongTon()) {
                    throw new BadRequestException("Sản phẩm " + chiTietSanPham.getSanPham().getTenSP() +
                            ". Có màu " + chiTietSanPham.getMauSac().getTen() +
                            ". Có kích cớ: " + chiTietSanPham.getKichThuoc().getSize() +
                            ". Có chất liệu: " + chiTietSanPham.getChatLieu().getTenChatLieu() +
                            ". Chỉ còn lại " + chiTietSanPham.getSoLuongTon());
                }
                hoaDonChiTiet.get().setDonGia(el.getDonGia());
                hoaDonChiTiet.get().setSoLuong(el.getSoLuong());
                hoaDonChiTietRepository.save(hoaDonChiTiet.get());
            }
        } catch (Exception e) {
            throw e;
        }
        return true;
    }

    @Override
    @Transactional
    public Boolean deleteHoaDon(List<UUID> listId, UUID idHoaDon) {
        try {
            HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
            for (UUID el : listId) {
                hoaDonChiTietRepository.deleteById(el);
            }
            if (hoaDonChiTietRepository.countByHoaDon(hoaDon) == 0) {
                hoaDonRepository.delete(hoaDon);
                return false;
            }
        } catch (Exception e) {
            throw e;
        }
        return true;
    }

    @Override
    @Transactional
    public String thanhToan(HoaDonRequest hoaDonRequest) throws BadRequestException {
        try {
            for (SanPhamAddHoaDon el : hoaDonRequest.getSanPhamAddHoaDons()) {
                ChiTietSanPham chiTietSanPham = chiTietSanPhamRepository.findById(el.getSanPhamId()).get();
                Optional<HoaDonChiTiet> hoaDonChiTiet = hoaDonChiTietRepository.
                        findById(el.getHoaDonId());

                if (el.getQuantity() > chiTietSanPham.getSoLuongTon()) {
                    throw new BadRequestException("Sản phẩm " + chiTietSanPham.getSanPham().getTenSP() +
                            ". Có màu " + chiTietSanPham.getMauSac().getTen() +
                            ". Có kích cớ: " + chiTietSanPham.getKichThuoc().getSize() +
                            ". Có chất liệu: " + chiTietSanPham.getChatLieu().getTenChatLieu() +
                            ". Chỉ còn lại " + chiTietSanPham.getSoLuongTon());
                }

                hoaDonChiTiet.get().setDonGia(el.getDonGia());
                hoaDonChiTiet.get().setSoLuong(el.getQuantity());
                hoaDonChiTietRepository.save(hoaDonChiTiet.get());
            }
            if (hoaDonRequest.getIdKhuyenMai() != null) {
                hoaDonRequest.getHoaDon().setKhuyenMai(khuyenMaiRepository.findById(hoaDonRequest.getIdKhuyenMai()).get());
            }

            String returnUrl = "";

            if (hoaDonRequest.getHoaDon().getPhuongThucThanhToan() == 1) {
                hoaDonRequest.getHoaDon().setTrangThai(3);
                returnUrl = vnPayService.createOrder(hoaDonRequest.getHoaDon().getTongTien().intValue(), hoaDonRequest.getHoaDon().getId().toString());
            } else {
                hoaDonRequest.getHoaDon().setTrangThai(0);
                returnUrl = "/ban-hang-online/hoa-don-detail?id=" + hoaDonRequest.getHoaDon().getId().toString();
            }

            hoaDonRepository.save(hoaDonRequest.getHoaDon());

            LichSuTrangThai lichSuTrangThai = new LichSuTrangThai();
            lichSuTrangThai.setTrangThai(hoaDonRequest.getHoaDon().getTrangThai());
            lichSuTrangThai.setHoaDon(hoaDonRequest.getHoaDon());
            lichSuTrangThai.setIsDelete(1);
            lichSuTrangThaiRepository.save(lichSuTrangThai);
            return returnUrl;
        } catch (Exception e) {
            throw e;
        }
    }


    @Override
    @Transactional
    public Boolean thayDoiTrangThaiHoaDon(UUID idHoaDon, int trangThai) throws BadRequestException {
        // Lấy hóa đơn từ database
        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon)
                .orElseThrow(() -> new BadRequestException("Không tìm thấy hóa đơn với ID: " + idHoaDon));

        // Xác định vai trò và người dùng hiện tại
        Object userLogin = common.getUserLogin();
        String userLoginType = common.getUserLoginType();

        // Phân quyền theo vai trò
        if ("ADMIN".equals(userLoginType) || "STAFF".equals(userLoginType)) {
            // ADMIN hoặc STAFF có toàn quyền
            if (userLogin instanceof NhanVien) {
                hoaDon.setNhanVien((NhanVien) userLogin); // Nhân viên thực hiện thay đổi trạng thái
            } else {
                throw new BadRequestException("Người dùng hiện tại không có quyền thay đổi trạng thái hóa đơn.");
            }

            // Logic cập nhật trạng thái khi xác nhận đơn hàng (trạng thái = 1)
            if (trangThai == 1) {
                List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);
                List<ChiTietSanPham> listChiTiet = new ArrayList<>();

                for (HoaDonChiTiet el : list) {
                    ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
                    if (chiTietSanPham != null) {
                        // Kiểm tra tồn kho
                        if (chiTietSanPham.getSoLuongTon() < el.getSoLuong()) {
                            throw new BadRequestException("Sản phẩm " + chiTietSanPham.getSanPham().getTenSP() +
                                    " không còn đủ số lượng. Tồn kho hiện tại: " + chiTietSanPham.getSoLuongTon());
                        }
                        // Cập nhật tồn kho
                        chiTietSanPham.setSoLuongTon(chiTietSanPham.getSoLuongTon() - el.getSoLuong());
                        listChiTiet.add(chiTietSanPham);
                    }
                }
                // Lưu cập nhật tồn kho
                chiTietSanPhamRepository.saveAll(listChiTiet);
            }

        } else if ("USER".equals(userLoginType)) {
            // USER chỉ có thể cập nhật trạng thái "Đã nhận được hàng" (trangThai = 2)
//            if (!(userLogin instanceof KhachHang) || !hoaDon.getKhachHang().equals(userLogin)) {
//                throw new BadRequestException("Bạn không có quyền thay đổi trạng thái hóa đơn này.");
//            }

//            if (trangThai != 6) {
//                throw new BadRequestException("Bạn chỉ có thể xác nhận trạng thái 'Đã nhận được hàng'.");
//            }
            hoaDon.setKhachHang((KhachHang) userLogin); // Ghi nhận khách hàng đã nhận hàng
        } else {
            throw new BadRequestException("Bạn không có quyền thực hiện thao tác này.");
        }

        // Logic xử lý trạng thái hủy đơn (trạng thái = 8)
        if (trangThai == 8 && hoaDon.getTrangThai() == 1) {
            List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);
            List<ChiTietSanPham> listChiTiet = new ArrayList<>();

            for (HoaDonChiTiet el : list) {
                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
                if (chiTietSanPham != null) {
                    // Hoàn lại số lượng vào kho
                    chiTietSanPham.setSoLuongTon(chiTietSanPham.getSoLuongTon() + el.getSoLuong());
                    listChiTiet.add(chiTietSanPham);
                }
            }
            chiTietSanPhamRepository.saveAll(listChiTiet);
        }

        // Cập nhật trạng thái hóa đơn
        hoaDon.setTrangThai(trangThai);
        hoaDon.setNgayCapNhat(LocalDateTime.now());

        // Lưu lịch sử trạng thái
        LichSuTrangThai lichSuTrangThai = new LichSuTrangThai();
        lichSuTrangThai.setTrangThai(trangThai);
        lichSuTrangThai.setHoaDon(hoaDon);
        lichSuTrangThai.setIsDelete(1);
        lichSuTrangThaiRepository.save(lichSuTrangThai);

        // Lưu hóa đơn
        hoaDonRepository.save(hoaDon);

        return true;
    }




//    @Override
//    @Transactional
//    public Boolean thayDoiTrangThaiHoaDon(UUID idHoaDon, int trangThai) throws BadRequestException {
//        // Lấy hóa đơn từ database
//        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon)
//                .orElseThrow(() -> new BadRequestException("Không tìm thấy hóa đơn với ID: " + idHoaDon));
//
//        // Xác định vai trò của người đăng nhập
//        Object userLogin = common.getUserLogin();
//        if ("ADMIN".equals(common.getUserLoginType()) || "STAFF".equals(common.getUserLoginType())) {
//            if (userLogin instanceof NhanVien) {
//                hoaDon.setNhanVien((NhanVien) userLogin); // Nhân viên thực hiện thay đổi trạng thái
//            } else {
//                throw new BadRequestException("Người dùng hiện tại không có quyền thay đổi trạng thái hóa đơn.");
//            }
//        } else {
//            throw new BadRequestException("Chỉ ADMIN hoặc STAFF mới có thể thực hiện xác nhận đơn hàng.");
//        }
//
//        // Logic xác nhận trạng thái "Xác nhận đơn hàng"
//        if (trangThai == 1) { // Trạng thái xác nhận đơn hàng
//            List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);
//            List<ChiTietSanPham> listChiTiet = new ArrayList<>();
//
//            for (HoaDonChiTiet el : list) {
//                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
//                if (chiTietSanPham != null) {
//                    // Kiểm tra tồn kho
//                    if (chiTietSanPham.getSoLuongTon() < el.getSoLuong()) {
//                        throw new BadRequestException("Sản phẩm " + chiTietSanPham.getSanPham().getTenSP() +
//                                " không còn đủ số lượng. Tồn kho hiện tại: " + chiTietSanPham.getSoLuongTon());
//                    }
//                    // Cập nhật tồn kho
//                    chiTietSanPham.setSoLuongTon(chiTietSanPham.getSoLuongTon() - el.getSoLuong());
//                    listChiTiet.add(chiTietSanPham);
//                }
//            }
//            // Lưu cập nhật tồn kho
//            chiTietSanPhamRepository.saveAll(listChiTiet);
//        }
//
//        // Cập nhật trạng thái hóa đơn
//        hoaDon.setTrangThai(trangThai);
//        hoaDon.setNgayCapNhat(LocalDateTime.now());
//
//        // Lưu lịch sử thay đổi trạng thái
//        LichSuTrangThai lichSuTrangThai = new LichSuTrangThai();
//        lichSuTrangThai.setTrangThai(trangThai);
//        lichSuTrangThai.setHoaDon(hoaDon);
//        lichSuTrangThai.setIsDelete(1);
//        lichSuTrangThaiRepository.save(lichSuTrangThai);
//
//        // Lưu hóa đơn
//        hoaDonRepository.save(hoaDon);
//
//        return true;
//    }
//
//    @Override
//    @Transactional
//    public Boolean thayDoiTrangThaiHoaDon(UUID idHoaDon, int trangThai) throws BadRequestException {
//        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
//        if (common.getUserLoginType().equals("ADMIN")) {
//            hoaDon.setNhanVien((NhanVien) common.getUserLogin());
//        } else {
//            hoaDon.setKhachHang((KhachHang) common.getUserLogin());
//        }
//        if (trangThai == 8 && hoaDon.getTrangThai() == 1) {
//            List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);
//
//            List<ChiTietSanPham> listChiTiet = new ArrayList<>();
//
//            for (HoaDonChiTiet el : list) {
//                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
//                if (chiTietSanPham != null) {
//                    el.getChiTietSanPham().setSoLuongTon(el.getChiTietSanPham().getSoLuongTon() + el.getSoLuong());
//                    listChiTiet.add(el.getChiTietSanPham());
//                }
//            }
//
//            chiTietSanPhamRepository.saveAll(listChiTiet);
//        }
//        hoaDon.setTrangThai(trangThai);
//        hoaDon.setNgayCapNhat(LocalDateTime.now());
//        if (trangThai == 1) {
//            List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);
//
//            List<ChiTietSanPham> listChiTiet = new ArrayList<>();
//
//            for (HoaDonChiTiet el : list) {
//                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
//                if (chiTietSanPham != null) {
//                    if (el.getChiTietSanPham().getSoLuongTon() - el.getSoLuong() < 0) {
//                        throw new BadRequestException("Sản phẩm " + chiTietSanPham.getSanPham().getTenSP() +
//                                ". Có màu " + chiTietSanPham.getMauSac().getTen() +
//                                ". Có kích cớ: " + chiTietSanPham.getKichThuoc().getSize() +
//                                ". Có chất liệu: " + chiTietSanPham.getChatLieu().getTenChatLieu() +
//                                ". Không còn đủ số lượng");
//                    }
//                    el.getChiTietSanPham().setSoLuongTon(el.getChiTietSanPham().getSoLuongTon() - el.getSoLuong());
//                    listChiTiet.add(el.getChiTietSanPham());
//                }
//            }
//
//            chiTietSanPhamRepository.saveAll(listChiTiet);
//        }
//
//        // lưu lại lịch sử trạng thái
//        LichSuTrangThai lichSuTrangThai = new LichSuTrangThai();
//        lichSuTrangThai.setTrangThai(trangThai);
//        lichSuTrangThai.setHoaDon(hoaDon);
//        lichSuTrangThai.setIsDelete(1);
//        lichSuTrangThaiRepository.save(lichSuTrangThai);
//
//        return true;
//    }

    @Override
    public Boolean quayLaiTrangThai(UUID idHoaDon) throws BadRequestException {
        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
        List<LichSuTrangThai> list = lichSuTrangThaiRepository.getAllByHoaDon(hoaDon);

        int trangThai = 0;

        if (list.size() <= 1) {
            trangThai = 9;
        } else {
            trangThai = list.get(1).getTrangThai();
        }

        if (trangThai == 1 && hoaDon.getTrangThai() == 8) {
            List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);

            List<ChiTietSanPham> listChiTiet = new ArrayList<>();

            for (HoaDonChiTiet el : hoaDonChiTietList) {
                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
                if (chiTietSanPham != null) {
                    el.getChiTietSanPham().setSoLuongTon(el.getChiTietSanPham().getSoLuongTon() - el.getSoLuong());
                    listChiTiet.add(el.getChiTietSanPham());
                }
            }

            chiTietSanPhamRepository.saveAll(listChiTiet);
        }

        if (hoaDon.getTrangThai() == 1) {
            List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);

            List<ChiTietSanPham> listChiTiet = new ArrayList<>();

            for (HoaDonChiTiet el : hoaDonChiTietList) {
                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
                if (chiTietSanPham != null) {
                    el.getChiTietSanPham().setSoLuongTon(el.getChiTietSanPham().getSoLuongTon() + el.getSoLuong());
                    listChiTiet.add(el.getChiTietSanPham());
                }
            }

            chiTietSanPhamRepository.saveAll(listChiTiet);
        }

        if (list.size() != 0) {
            LichSuTrangThai lichSuTrangThaiDelete0 = list.get(0);
            lichSuTrangThaiDelete0.setIsDelete(0);
            LichSuTrangThai lichSuTrangThaiDelete1 = list.get(1);
            lichSuTrangThaiDelete1.setIsDelete(0);
            lichSuTrangThaiRepository.save(lichSuTrangThaiDelete0);
            lichSuTrangThaiRepository.save(lichSuTrangThaiDelete1);
        }

        LichSuTrangThai lichSuTrangThai = new LichSuTrangThai();
        lichSuTrangThai.setTrangThai(trangThai);
        lichSuTrangThai.setHoaDon(hoaDon);
        lichSuTrangThai.setIsDelete(1);
        lichSuTrangThaiRepository.save(lichSuTrangThai);

        hoaDon.setTrangThai(trangThai);
        hoaDonRepository.save(hoaDon);
        return null;
    }

}
