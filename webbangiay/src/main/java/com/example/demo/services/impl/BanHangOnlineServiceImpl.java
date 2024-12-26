package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.GioHangChiTiet;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.KhachHang;
import com.example.demo.models.LichSuTrangThai;
import com.example.demo.models.NhanVien;
import com.example.demo.models.dto.BanHangRequest;
import com.example.demo.models.dto.HoaDonRequest;
import com.example.demo.models.dto.SanPhamAddHoaDon;
import com.example.demo.repositories.ChiTietSanPhamRepository;
import com.example.demo.repositories.GioHangChiTietRepository;
import com.example.demo.repositories.HoaDonChiTietRepository;
import com.example.demo.repositories.HoaDonRepository;
import com.example.demo.repositories.KhuyenMaiRepository;
import com.example.demo.repositories.LichSuTrangThaiRepository;
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
        HoaDon hoaDon = hoaDonRepository.findById(idHoaDon).get();
        if (common.getUserLoginType().equals("ADMIN")) {
            hoaDon.setNhanVien((NhanVien) common.getUserLogin());
        } else {
            hoaDon.setKhachHang((KhachHang) common.getUserLogin());
        }
        if (trangThai == 8 && hoaDon.getTrangThai() == 1) {
            List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);

            List<ChiTietSanPham> listChiTiet = new ArrayList<>();

            for (HoaDonChiTiet el : list) {
                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
                if (chiTietSanPham != null) {
                    el.getChiTietSanPham().setSoLuongTon(el.getChiTietSanPham().getSoLuongTon() + el.getSoLuong());
                    listChiTiet.add(el.getChiTietSanPham());
                }
            }

            chiTietSanPhamRepository.saveAll(listChiTiet);
        }
        hoaDon.setTrangThai(trangThai);
        hoaDon.setNgayCapNhat(LocalDateTime.now());
        if (trangThai == 1) {
            List<HoaDonChiTiet> list = hoaDonChiTietRepository.findHoaDonChiTietByHoaDon(hoaDon);

            List<ChiTietSanPham> listChiTiet = new ArrayList<>();

            for (HoaDonChiTiet el : list) {
                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
                if (chiTietSanPham != null) {
                    if (el.getChiTietSanPham().getSoLuongTon() - el.getSoLuong() < 0) {
                        throw new BadRequestException("Sản phẩm " + chiTietSanPham.getSanPham().getTenSP() +
                                ". Có màu " + chiTietSanPham.getMauSac().getTen() +
                                ". Có kích cớ: " + chiTietSanPham.getKichThuoc().getSize() +
                                ". Có chất liệu: " + chiTietSanPham.getChatLieu().getTenChatLieu() +
                                ". Không còn đủ số lượng");
                    }
                    el.getChiTietSanPham().setSoLuongTon(el.getChiTietSanPham().getSoLuongTon() - el.getSoLuong());
                    listChiTiet.add(el.getChiTietSanPham());
                }
            }

            chiTietSanPhamRepository.saveAll(listChiTiet);
        }

        // lưu lại lịch sử trạng thái
        LichSuTrangThai lichSuTrangThai = new LichSuTrangThai();
        lichSuTrangThai.setTrangThai(trangThai);
        lichSuTrangThai.setHoaDon(hoaDon);
        lichSuTrangThai.setIsDelete(1);
        lichSuTrangThaiRepository.save(lichSuTrangThai);

        return true;
    }

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
