package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import com.example.demo.models.dto.HoaDonRequest;
import com.example.demo.models.dto.SanPhamAddHoaDon;
import com.example.demo.repositories.ChiTietSanPhamRepository;
import com.example.demo.repositories.HoaDonChiTietRepository;
import com.example.demo.repositories.HoaDonRepository;
import com.example.demo.repositories.KhuyenMaiRepository;
import com.example.demo.services.BanHangTaiQuayService;
import com.example.demo.services.HoaDonService;
import com.example.demo.services.KhachHangService;
import com.example.demo.util.UserLoginCommon;
import jakarta.transaction.Transactional;
import org.apache.coyote.BadRequestException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class BanHangTaiQuayServiceImpl implements BanHangTaiQuayService {

    @Autowired
    private HoaDonService hoaDonService;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamService;

    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private KhuyenMaiRepository khuyenMaiRepository;

    @Autowired
    private UserLoginCommon common;

    @Override
    public List<HoaDon> getAllHoaDon() {
        return hoaDonRepository.findAllByLoai(0);
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

    // Hàm tạo hóa đơn mới với mã hóa đơn không trùng lặp
    public List<HoaDon> createHoaDon() throws BadRequestException {
        List<HoaDon> hoaDons = hoaDonRepository.findAll(); // Lấy danh sách hóa đơn từ cơ sở dữ liệu
        List<HoaDon> hoaDonss = hoaDonRepository.findAllByLoaiAndTrangThai(0, 9);
        if (hoaDonss.size() >= 10) {
            throw new BadRequestException("Bạn chỉ được tạo tối đa 10 hóa đơn chờ");
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

        // Tạo hóa đơn mới với mã hóa đơn không trùng lặp
        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa(newCode);
        hoaDon.setLoai(0);
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setTrangThai(9);
        hoaDonService.add(hoaDon);

        return hoaDonService.findAll();
    }

    @Override
    public List<HoaDonChiTiet> findHoaDonDto(UUID id) {
        return hoaDonChiTietRepository.findHoaDonChiTietByHoaDonAndTrangThai(hoaDonService.findById(id), 0);
    }

    @Override
    public List<ChiTietSanPham> getChiTietSanPham(List<UUID> listId) {
        if (listId.size() == 0) {
            return chiTietSanPhamService.findAllByIsDeleteAndTrangThai(1, 1);
        }
        return chiTietSanPhamService.findAllByIsDeleteAndIdNotInAndTrangThai(1, listId, 1);
    }

    @Override
    public ChiTietSanPham getDetailSanPham(UUID id) {
        return chiTietSanPhamService.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public List<HoaDonChiTiet> shoppingProduct(List<SanPhamAddHoaDon> sanPhamAddHoaDons) {
        if (sanPhamAddHoaDons.size() != 0) {
            sanPhamAddHoaDons.get(0);
            HoaDon hoaDon = hoaDonService.findById(sanPhamAddHoaDons.get(0).getHoaDonId());
            Map<UUID, HoaDonChiTiet> hoaDonChiTietMap = getMapHoaDonChiTietById(hoaDon.getId());

            List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();
            List<ChiTietSanPham> chiTietSanPhams = new ArrayList<>();

            sanPhamAddHoaDons.forEach(el -> {
                ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(el.getSanPhamId()).orElseGet(null);

                if (chiTietSanPham != null) {
                    if (hoaDonChiTietMap.containsKey(chiTietSanPham.getId())) {
                        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietMap.get(chiTietSanPham.getId());
                        chiTietSanPham.setSoLuongTon(hoaDonChiTiet.getSoLuong() + hoaDonChiTiet.getChiTietSanPham().getSoLuongTon() - el.getQuantity());
                        if (chiTietSanPham.getSoLuongTon() <= 0) {
                            chiTietSanPham.setIsDelete(0);
                        } else {
                            chiTietSanPham.setIsDelete(1);
                        }
                        hoaDonChiTiet.setDonGia(el.getDonGia());
                        hoaDonChiTiet.setSoLuong(el.getQuantity());
                        hoaDonChiTietList.add(hoaDonChiTiet);
                        chiTietSanPhams.add(chiTietSanPham);
                    } else {
                        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                        hoaDonChiTiet.setHoaDon(hoaDon);
                        hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
                        hoaDonChiTiet.setDonGia(el.getDonGia());
                        hoaDonChiTiet.setTrangThai(0);
                        hoaDonChiTiet.setSoLuong(el.getQuantity());
                        hoaDonChiTietList.add(hoaDonChiTiet);
                        chiTietSanPham.setSoLuongTon(chiTietSanPham.getSoLuongTon() - el.getQuantity());
                        if (chiTietSanPham.getSoLuongTon() <= 0) {
                            chiTietSanPham.setIsDelete(0);
                        } else {
                            chiTietSanPham.setIsDelete(1);
                        }

                        chiTietSanPhams.add(chiTietSanPham);
                    }
                }
            });
            hoaDonChiTietRepository.saveAll(hoaDonChiTietList);
            chiTietSanPhamService.saveAll(chiTietSanPhams);
            return hoaDonChiTietList;
        }
        return null;
    }

    @Override
    @Transactional
    public Boolean deleteProduct(List<UUID> listId) {
        try {
            List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findHoaDonChiTietByIdIn(listId).stream().map(el -> {
                el.setTrangThai(1);
                return el;
            }).collect(Collectors.toList());
            List<ChiTietSanPham> chiTietSanPhams = hoaDonChiTietList.stream().map(el -> {
                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
                chiTietSanPham.setSoLuongTon(chiTietSanPham.getSoLuongTon() + el.getSoLuong());

                if (chiTietSanPham.getSoLuongTon() <= 0) {
                    chiTietSanPham.setIsDelete(0);
                } else {
                    chiTietSanPham.setIsDelete(1);
                }

                return chiTietSanPham;
            }).collect(Collectors.toList());
            hoaDonChiTietRepository.saveAll(hoaDonChiTietList);
            chiTietSanPhamService.saveAll(chiTietSanPhams);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public List<KhachHang> getAllKhachHang() {
        return khachHangService.findAll();
    }

    @Override
    public Boolean changeStatusHoaDon(HoaDonRequest request) {
        List<SanPhamAddHoaDon> sanPhamAddHoaDons = request.getSanPhamAddHoaDons();
        if (sanPhamAddHoaDons.size() != 0) {
            sanPhamAddHoaDons.get(0);
            HoaDon hoaDon = request.getHoaDon();
            Map<UUID, HoaDonChiTiet> hoaDonChiTietMap = getMapHoaDonChiTietById(hoaDon.getId());

            List<HoaDonChiTiet> hoaDonChiTietList = new ArrayList<>();
            List<ChiTietSanPham> chiTietSanPhams = new ArrayList<>();

            sanPhamAddHoaDons.forEach(el -> {
                ChiTietSanPham chiTietSanPham = chiTietSanPhamService.findById(el.getSanPhamId()).orElseGet(null);

                if (chiTietSanPham != null) {
                    if (hoaDonChiTietMap.containsKey(chiTietSanPham.getId())) {
                        HoaDonChiTiet hoaDonChiTiet = hoaDonChiTietMap.get(chiTietSanPham.getId());
                        chiTietSanPham.setSoLuongTon(hoaDonChiTiet.getSoLuong() +
                                hoaDonChiTiet.getChiTietSanPham().getSoLuongTon() - el.getQuantity());

                        if (chiTietSanPham.getSoLuongTon() <= 0) {
                            chiTietSanPham.setIsDelete(0);
                        } else {
                            chiTietSanPham.setIsDelete(1);
                        }

                        hoaDonChiTiet.setDonGia(el.getDonGia());
                        hoaDonChiTiet.setSoLuong(el.getQuantity());
                        hoaDonChiTietList.add(hoaDonChiTiet);
                        chiTietSanPhams.add(chiTietSanPham);
                    } else {
                        HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                        hoaDonChiTiet.setHoaDon(hoaDon);
                        hoaDonChiTiet.setChiTietSanPham(chiTietSanPham);
                        hoaDonChiTiet.setDonGia(el.getDonGia());
                        hoaDonChiTiet.setTrangThai(0);
                        hoaDonChiTiet.setSoLuong(el.getQuantity());
                        hoaDonChiTietList.add(hoaDonChiTiet);
                        chiTietSanPham.setSoLuongTon(chiTietSanPham.getSoLuongTon() - el.getQuantity());

                        if (chiTietSanPham.getSoLuongTon() <= 0) {
                            chiTietSanPham.setIsDelete(0);
                        } else {
                            chiTietSanPham.setIsDelete(1);
                        }

                        chiTietSanPhams.add(chiTietSanPham);
                    }
                }
            });
            hoaDonChiTietRepository.saveAll(hoaDonChiTietList);
            chiTietSanPhamService.saveAll(chiTietSanPhams);

            KhachHang khachHang = request.getKhachHang();
            if (khachHang.getId() == null) {
                String maKhachHang = "KH00" + (khachHangService.findAll().size() + 1);
                khachHang.setMa(maKhachHang);
                khachHang.setTaiKhoan(maKhachHang);
                khachHang.setMatKhau(maKhachHang);
                khachHang.setId(khachHangService.add(khachHang).getId());
            }

            if (request.getIdKhuyenMai() != null) {
                hoaDon.setKhuyenMai(khuyenMaiRepository.findById(request.getIdKhuyenMai()).orElse(null));
            }
            hoaDon.setKhachHang(khachHang);
            hoaDon.setNhanVien((NhanVien) common.getUserLogin());
            hoaDon.setNgayCapNhat(LocalDateTime.now());
            hoaDonService.update(hoaDon.getId(), hoaDon);
            return true;
        }
        return false;
    }

    @Override
    public Boolean rejectHoaDon(List<UUID> listId, UUID idHoaDon) {
        try {
            List<HoaDonChiTiet> hoaDonChiTietList = hoaDonChiTietRepository.findHoaDonChiTietByIdIn(listId).stream().map(el -> {
                el.setTrangThai(0);
                return el;
            }).collect(Collectors.toList());
            List<ChiTietSanPham> chiTietSanPhams = hoaDonChiTietList.stream().map(el -> {
                ChiTietSanPham chiTietSanPham = el.getChiTietSanPham();
                chiTietSanPham.setSoLuongTon(chiTietSanPham.getSoLuongTon() + el.getSoLuong());

                if (chiTietSanPham.getSoLuongTon() <= 0) {
                    chiTietSanPham.setIsDelete(0);
                } else {
                    chiTietSanPham.setIsDelete(1);
                }

                return chiTietSanPham;
            }).collect(Collectors.toList());
            chiTietSanPhamService.saveAll(chiTietSanPhams);

            HoaDon hoaDon = hoaDonService.findById(idHoaDon);
            hoaDon.setTrangThai(8);
            hoaDon.setNgayCapNhat(LocalDateTime.now());
            hoaDonService.update(idHoaDon, hoaDon);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return null;
    }
    private Map<UUID, HoaDonChiTiet> getMapHoaDonChiTietById(UUID idHoaDon) {
        Map<UUID, HoaDonChiTiet> map = new HashMap<>();
        findHoaDonDto(idHoaDon).forEach(el -> {
            map.put(el.getChiTietSanPham().getId(), el);
        });
        return map;
    }
}
