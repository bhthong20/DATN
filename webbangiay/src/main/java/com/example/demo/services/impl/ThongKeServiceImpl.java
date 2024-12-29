package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.KhuyenMai;
import com.example.demo.models.dto.LineChartDto;
import com.example.demo.models.dto.SanPhamThongKeDetailDto;
import com.example.demo.models.dto.SanPhamThongKeDto;
import com.example.demo.models.dto.ThongKeAllDto;
import com.example.demo.models.dto.ThongKeDetailDto;
import com.example.demo.models.dto.ThongKeTongDto;
import com.example.demo.repositories.ChiTietSanPhamRepository;
import com.example.demo.repositories.SanPhamRepository;
import com.example.demo.repositories.ThongKeRepository;
import com.example.demo.services.BanHangTaiQuayService;
import com.example.demo.services.ThongKeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Year;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

@Service
public class ThongKeServiceImpl implements ThongKeService {

    public enum ReturnType {
        LOCAL_DATE,
        YEAR_MONTH,
        YEAR
    }

    @Autowired
    private ThongKeRepository repository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Override
    public ThongKeAllDto getTongThongKe(int type) {
        List<HoaDonChiTiet> list = repository.getAllHoaDonChiTiet();

        Set<HoaDon> set = new HashSet<>(list.stream().map(el -> el.getHoaDon()).collect(Collectors.toList()));
        ReturnType returnType = ReturnType.LOCAL_DATE;

        switch (type) {
            case 1:
                returnType = ReturnType.LOCAL_DATE;
                break;
            case 2:
                returnType = ReturnType.YEAR_MONTH;
                break;
            case 3:
                returnType = ReturnType.YEAR;
                break;
            default:
                throw new IllegalArgumentException("Invalid return type");
        }

        List<Object> listNgayTao = (List<Object>) listNgayTao(set, returnType);

        List<Long> taiQuayTongTien = new ArrayList<>();
        List<Long> onlineTongTien = new ArrayList<>();
        List<LineChartDto> getLineChartTong = new ArrayList<>();

        ReturnType finalReturnType = returnType;

        listNgayTao.forEach(el -> {
            taiQuayTongTien.add(countTongTienTheoThangByLoai(el, set, 0, finalReturnType));
            onlineTongTien.add(countTongTienTheoThangByLoai(el, set, 1, finalReturnType));
        });

        getLineChartTong.add(new LineChartDto(null, "Bán tại quầy", taiQuayTongTien));
        getLineChartTong.add(new LineChartDto(null, "Bán online", onlineTongTien));

        ThongKeTongDto thongKeTongDto = getTongQuatThongKe(set, list);
        List<SanPhamThongKeDto> getAllSanPham = getAllSanPhamThongKe(list);
        List<LineChartDto> getLineChartSanPham = getLineChartSanPham(list, listNgayTao, finalReturnType);

        return new ThongKeAllDto(thongKeTongDto, getAllSanPham, getLineChartSanPham, getLineChartTong, listNgayTao);
    }

    @Override
    public ThongKeDetailDto getTongThongKeDetail(UUID uuid, int type) {
        List<HoaDonChiTiet> list = repository.getAllHoaDonChiTiet();

        Set<HoaDon> set = new HashSet<>(list.stream().map(el -> el.getHoaDon()).collect(Collectors.toList()));

        ReturnType returnType = ReturnType.LOCAL_DATE;

        switch (type) {
            case 1:
                returnType = ReturnType.LOCAL_DATE;
                break;
            case 2:
                returnType = ReturnType.YEAR_MONTH;
                break;
            case 3:
                returnType = ReturnType.YEAR;
                break;
            default:
                throw new IllegalArgumentException("Invalid return type");
        }

        List<Object> listNgayTao = (List<Object>) listNgayTao(set, returnType);

        return new ThongKeDetailDto(listNgayTao, getLineChartSanPhamDetail(list, listNgayTao, uuid), sanPhamThongKeDetailDtos(list, uuid));
    }


    public static List<?> listNgayTao(Set<HoaDon> hoaDons, ReturnType returnType) {
        Optional<HoaDon> minHoaDon = hoaDons.stream().min(Comparator.comparing(HoaDon::getNgayTao));
        Optional<HoaDon> maxHoaDon = hoaDons.stream().max(Comparator.comparing(HoaDon::getNgayTao));

        if (minHoaDon.isEmpty() || maxHoaDon.isEmpty()) {
            return new ArrayList<>();
        }

        LocalDate minDate = minHoaDon.get().getNgayTao().toLocalDate();
        LocalDate maxDate = maxHoaDon.get().getNgayTao().toLocalDate();

        List<Object> dateList = new ArrayList<>();
        LocalDate currentDate = minDate;

        switch (returnType) {
            case LOCAL_DATE:
                while (!currentDate.isAfter(maxDate)) {
                    dateList.add(currentDate);
                    currentDate = currentDate.plusDays(1);
                }
                break;
            case YEAR_MONTH:
                YearMonth currentYearMonth = YearMonth.from(minDate);
                while (!currentYearMonth.isAfter(YearMonth.from(maxDate))) {
                    dateList.add(currentYearMonth);
                    currentYearMonth = currentYearMonth.plusMonths(1);
                }
                break;
            case YEAR:
                Year currentYear = Year.from(minDate);
                while (!currentYear.isAfter(Year.from(maxDate))) {
                    dateList.add(currentYear);
                    currentYear = currentYear.plusYears(1);
                }
                break;
            default:
                throw new IllegalArgumentException("Invalid return type");
        }

        return dateList;
    }

    public ThongKeTongDto getTongQuatThongKe(Set<HoaDon> set, List<HoaDonChiTiet> list) {
        Long tongSoLuongBan = 0L;
        BigDecimal tongDoanhSo = BigDecimal.ZERO;
        BigDecimal tongTaiQuay = BigDecimal.ZERO;
        BigDecimal tongOnline = BigDecimal.ZERO;

        for (HoaDon el : set) {
            tongDoanhSo = tongDoanhSo.add(el.getTongTien().subtract((el.getTienShip() != null ? el.getTienShip() : BigDecimal.ZERO)));
            if (el.getLoai() == 0) {
                tongTaiQuay = tongTaiQuay.add(el.getTongTien().subtract((el.getTienShip() != null ? el.getTienShip() : BigDecimal.ZERO)));
            } else {
                tongOnline = tongOnline.add(el.getTongTien().subtract((el.getTienShip() != null ? el.getTienShip() : BigDecimal.ZERO)));
            }
        }

        for (HoaDonChiTiet el : list) {
            tongSoLuongBan += el.getSoLuong();
        }
        return new ThongKeTongDto(tongSoLuongBan, tongDoanhSo.longValue(), tongTaiQuay.longValue(), tongOnline.longValue());
    }

    public Long countTongTienTheoThangByLoai(Object thangTrongKhoang, Set<HoaDon> set, int loai, ReturnType returnType) {
        Long tongTien = 0l;
        for (HoaDon el : set) {
            Object hoaDonLocalDate = switchTypeDate(LocalDate.from(el.getNgayTao().toLocalDate()), returnType);

            if (thangTrongKhoang.equals(hoaDonLocalDate) && el.getLoai() == loai) {
                tongTien += el.getTongTien().longValue() - (el.getTienShip() != null ? el.getTienShip().longValue() : 0L);
            }
        }
        return tongTien;
    }

    public List<SanPhamThongKeDto> getAllSanPhamThongKe(List<HoaDonChiTiet> hoaDonChiTiets) {
        List<SanPhamThongKeDto> sanPhamThongKeDtos = new ArrayList<>();

        hoaDonChiTiets.forEach(el -> {
            SanPhamThongKeDto sanPhamThongKeDto = new SanPhamThongKeDto();

            sanPhamThongKeDto.setTenSanPham(el.getChiTietSanPham().getSanPham().getTenSP());
            sanPhamThongKeDto.setId(el.getChiTietSanPham().getSanPham().getId());
            sanPhamThongKeDto.setUrl(el.getChiTietSanPham().getSanPham().getHinhAnh().getAnh1());
            sanPhamThongKeDto.setSoLuongTon(el.getChiTietSanPham().getSoLuongTon());
            sanPhamThongKeDto.setSoLuongBan(el.getSoLuong());
            BigDecimal doanhThu = BigDecimal.ZERO;
            if (el.getHoaDon().getKhuyenMai() == null) {
                doanhThu = BigDecimal.valueOf(el.getSoLuong()).multiply(el.getDonGia());
            } else {
                KhuyenMai khuyenMai = el.getHoaDon().getKhuyenMai();
                if (khuyenMai.getHinhThucGiamGia() == 1) {
                    doanhThu = BigDecimal.valueOf(el.getSoLuong()).multiply(el.getDonGia()).multiply(BigDecimal.valueOf(100 - khuyenMai.getGiaTriGiam().intValue())).divide(BigDecimal.valueOf(100));
                } else {
                    doanhThu = BigDecimal.valueOf(el.getSoLuong()).multiply(el.getDonGia()).subtract(BigDecimal.valueOf(khuyenMai.getGiaTriGiam().intValue()));
                }
            }
            sanPhamThongKeDto.setDoanhThu(doanhThu.longValue());

            Optional<SanPhamThongKeDto> existingItem = sanPhamThongKeDtos.stream()
                    .filter(data -> data.getId().equals(el.getChiTietSanPham().getSanPham().getId()))
                    .findFirst();

            if (existingItem.isPresent()) {
                int index = sanPhamThongKeDtos.indexOf(existingItem.get());

//                sanPhamThongKeDto.setSoLuongTon(sanPhamThongKeDto.getSoLuongTon() + existingItem.get().getSoLuongTon());
                sanPhamThongKeDto.setSoLuongBan(sanPhamThongKeDto.getSoLuongBan() + existingItem.get().getSoLuongBan());
                sanPhamThongKeDto.setDoanhThu(sanPhamThongKeDto.getDoanhThu() + existingItem.get().getDoanhThu());

                sanPhamThongKeDtos.set(index, sanPhamThongKeDto);
            } else {
                sanPhamThongKeDtos.add(sanPhamThongKeDto);
            }
        });
        sanPhamThongKeDtos.forEach(el -> {
            List<SanPhamThongKeDetailDto> list = sanPhamThongKeDetailDtos(hoaDonChiTiets, el.getId());
            int tongTien = 0;
            for (SanPhamThongKeDetailDto detail : list) {
                tongTien = +detail.getSoLuongTon();
            }
            el.setSoLuongTon(tongTien);
        });
        return sanPhamThongKeDtos;
    }

    // Thống kê sản phẩm theo tháng
    public List<LineChartDto> getLineChartSanPham(List<HoaDonChiTiet> hoaDonChiTiets, List<Object> thangTrongKhoang, ReturnType returnType) {
        List<LineChartDto> listReturn = new ArrayList<>();

        hoaDonChiTiets.forEach(el -> {
            if (listReturn.stream().filter(sp -> sp.getId().equals(el.getChiTietSanPham().getSanPham().getId())).count() == 0) {
                LineChartDto lineChartDto = new LineChartDto();
                lineChartDto.setId(el.getChiTietSanPham().getSanPham().getId());
                lineChartDto.setName(el.getChiTietSanPham().getSanPham().getTenSP());
                listReturn.add(lineChartDto);
            }
        });

        // Tạo một Map để lưu trữ số lượng của từng sản phẩm dựa trên ID của sản phẩm
        Map<UUID, Map<Object, Long>> soLuongTheoThang = new HashMap<>();

        // Lặp qua danh sách chi tiết hóa đơn để tính số lượng của từng sản phẩm theo tháng
        hoaDonChiTiets.forEach(el -> {
            UUID sanPhamId = el.getChiTietSanPham().getSanPham().getId();
            long soLuong = el.getSoLuong();
            Object thangHoaDon = switchTypeDate(LocalDate.from(el.getHoaDon().getNgayTao().toLocalDate()), returnType);

            // Kiểm tra xem sản phẩm đã tồn tại trong Map chưa
            if (soLuongTheoThang.containsKey(sanPhamId)) {
                // Nếu sản phẩm đã tồn tại, kiểm tra xem số lượng theo tháng đã được cập nhật chưa
                Map<Object, Long> soLuongTheoThangCuaSanPham = soLuongTheoThang.get(sanPhamId);
                // Nếu số lượng theo tháng đã được cập nhật, cộng thêm số lượng mới vào
                if (soLuongTheoThangCuaSanPham.containsKey(thangHoaDon)) {
                    long tongSoLuongHienTai = soLuongTheoThangCuaSanPham.get(thangHoaDon);
                    long tongSoLuongMoi = tongSoLuongHienTai + soLuong;
                    soLuongTheoThangCuaSanPham.put(thangHoaDon, tongSoLuongMoi);
                } else {
                    // Nếu số lượng theo tháng chưa được cập nhật, thêm số lượng mới vào
                    soLuongTheoThangCuaSanPham.put(thangHoaDon, soLuong);
                }
            } else {
                // Nếu sản phẩm chưa tồn tại trong Map, thêm sản phẩm vào Map và thêm số lượng theo tháng
                Map<Object, Long> soLuongTheoThangMoi = new HashMap<>();
                soLuongTheoThangMoi.put(thangHoaDon, soLuong);
                soLuongTheoThang.put(sanPhamId, soLuongTheoThangMoi);
            }
        });

        soLuongTheoThang.forEach((key, value) -> {
            Optional<LineChartDto> lineChartDto = listReturn
                    .stream()
                    .filter(sp -> sp.getId().equals(key)).findFirst();

            if (lineChartDto.isPresent()) {
                List<Long> getSoLuongSp = new ArrayList<>();
                thangTrongKhoang.forEach(yearMonth -> {
                    AtomicReference<Long> check = new AtomicReference<>(0L);
                    value.forEach((data, dataValue) -> {
                        if (data.equals(yearMonth)) {
                            check.set(dataValue);
                        }
                    });
                    getSoLuongSp.add(check.get());
                });
                lineChartDto.get().setData(getSoLuongSp);
            }
        });

        return listReturn;
    }

    // Thông kê chi tiết sản phẩm
    public List<SanPhamThongKeDetailDto> sanPhamThongKeDetailDtos(List<HoaDonChiTiet> hoaDonChiTiets, UUID id) {
        List<SanPhamThongKeDetailDto> sanPhamThongKeDtos = new ArrayList<>();

        hoaDonChiTiets.forEach(el -> {
            if (el.getChiTietSanPham().getSanPham().getId().equals(id)) {
                SanPhamThongKeDetailDto sanPhamThongKeDto = new SanPhamThongKeDetailDto();

                sanPhamThongKeDto.setTenSanPham(el.getChiTietSanPham().getMa());
                sanPhamThongKeDto.setId(el.getChiTietSanPham().getId());
                sanPhamThongKeDto.setUrl(el.getChiTietSanPham().getHinhAnh() != null ? el.getChiTietSanPham().getHinhAnh().getAnh1() : "");
                sanPhamThongKeDto.setChatLieu(el.getChiTietSanPham().getChatLieu().getTenChatLieu());
                sanPhamThongKeDto.setKichThuoc(el.getChiTietSanPham().getKichThuoc().getSize());
                sanPhamThongKeDto.setMauSac(el.getChiTietSanPham().getMauSac().getTen());
                sanPhamThongKeDto.setSoLuongTon(el.getChiTietSanPham().getSoLuongTon());
                sanPhamThongKeDto.setSoLuongBan(el.getSoLuong());

                BigDecimal doanhThu = BigDecimal.ZERO;

                if (el.getHoaDon().getKhuyenMai() == null) {
                    doanhThu = BigDecimal.valueOf(el.getSoLuong()).multiply(el.getDonGia());
                } else {
                    KhuyenMai khuyenMai = el.getHoaDon().getKhuyenMai();
                    if (khuyenMai.getHinhThucGiamGia() == 1) {
                        doanhThu = BigDecimal.valueOf(el.getSoLuong()).multiply(el.getDonGia()).multiply(BigDecimal.valueOf(100 - khuyenMai.getGiaTriGiam().intValue())).divide(BigDecimal.valueOf(100));
                    } else {
                        doanhThu = BigDecimal.valueOf(el.getSoLuong()).multiply(el.getDonGia()).subtract(BigDecimal.valueOf(khuyenMai.getGiaTriGiam().intValue()));
                    }
                }

                sanPhamThongKeDto.setDoanhThu(doanhThu.longValue());

                Optional<SanPhamThongKeDetailDto> existingItem = sanPhamThongKeDtos.stream()
                        .filter(data -> data.getId().equals(el.getChiTietSanPham().getId()))
                        .findFirst();

                if (existingItem.isPresent()) {
                    int index = sanPhamThongKeDtos.indexOf(existingItem.get());

//                    sanPhamThongKeDto.setSoLuongTon(sanPhamThongKeDto.getSoLuongTon() + existingItem.get().getSoLuongTon());
                    sanPhamThongKeDto.setSoLuongBan(sanPhamThongKeDto.getSoLuongBan() + existingItem.get().getSoLuongBan());
                    sanPhamThongKeDto.setDoanhThu(sanPhamThongKeDto.getDoanhThu() + existingItem.get().getDoanhThu());

                    sanPhamThongKeDtos.set(index, sanPhamThongKeDto);
                } else {
                    sanPhamThongKeDtos.add(sanPhamThongKeDto);
                }
            }
        });

        List<ChiTietSanPham> chiTietSanPhamList = chiTietSanPhamRepository.findAllBySanPhamAndIsDelete(sanPhamRepository.findById(id).get(), 1);
        chiTietSanPhamList.forEach(el -> {

            Optional<SanPhamThongKeDetailDto> existingItem = sanPhamThongKeDtos.stream()
                    .filter(data -> data.getId().equals(el.getId()))
                    .findFirst();

            if (existingItem.isEmpty()) {
                SanPhamThongKeDetailDto sanPhamThongKeDto = new SanPhamThongKeDetailDto();

                sanPhamThongKeDto.setTenSanPham(el.getMa());
                sanPhamThongKeDto.setId(el.getId());
                sanPhamThongKeDto.setUrl(el.getHinhAnh() != null ? el.getHinhAnh().getAnh1() : "");
                sanPhamThongKeDto.setChatLieu(el.getChatLieu().getTenChatLieu());
                sanPhamThongKeDto.setKichThuoc(el.getKichThuoc().getSize());
                sanPhamThongKeDto.setMauSac(el.getMauSac().getTen());
                sanPhamThongKeDto.setSoLuongTon(el.getSoLuongTon());
                sanPhamThongKeDto.setSoLuongBan(0);
                sanPhamThongKeDto.setDoanhThu(0L);
                sanPhamThongKeDto.setSoLuongTon(el.getSoLuongTon());
                sanPhamThongKeDtos.add(sanPhamThongKeDto);
            }
        });

        return sanPhamThongKeDtos;
    }

    // Thống kê chi tiết sản phẩm theo tháng
    public List<LineChartDto> getLineChartSanPhamDetail(List<HoaDonChiTiet> hoaDonChiTiets, List<Object> thangTrongKhoang, UUID id) {
        List<LineChartDto> listReturn = new ArrayList<>();

        hoaDonChiTiets.forEach(el -> {
            if (el.getChiTietSanPham().getSanPham().getId().equals(id)) {
                if (listReturn.stream().filter(sp -> sp.getId().equals(el.getChiTietSanPham().getId())).count() == 0) {
                    LineChartDto lineChartDto = new LineChartDto();
                    lineChartDto.setId(el.getChiTietSanPham().getId());
                    lineChartDto.setName(el.getChiTietSanPham().getMa());
                    listReturn.add(lineChartDto);
                }
            }
        });
        List<ChiTietSanPham> chiTietSanPhamList = chiTietSanPhamRepository.findAllBySanPhamAndIsDelete(sanPhamRepository.findById(id).get(), 1);
        chiTietSanPhamList.forEach(el -> {
            Optional<LineChartDto> existingItem = listReturn.stream()
                    .filter(data -> data.getId().equals(el.getId()))
                    .findFirst();

            if (existingItem.isEmpty()) {
                LineChartDto lineChartDto = new LineChartDto();
                lineChartDto.setId(el.getId());
                lineChartDto.setName(el.getMa());
                listReturn.add(lineChartDto);
            }
        });

        // Tạo một Map để lưu trữ số lượng của từng sản phẩm dựa trên ID của sản phẩm
        Map<UUID, Map<LocalDate, Long>> soLuongTheoThang = new HashMap<>();

        // Lặp qua danh sách chi tiết hóa đơn để tính số lượng của từng sản phẩm theo tháng
        hoaDonChiTiets.forEach(el -> {
            UUID sanPhamId = el.getChiTietSanPham().getId();
            long soLuong = el.getSoLuong();
            LocalDate thangHoaDon = LocalDate.from(el.getHoaDon().getNgayTao().toLocalDate());

            // Kiểm tra xem sản phẩm đã tồn tại trong Map chưa
            if (soLuongTheoThang.containsKey(sanPhamId)) {
                // Nếu sản phẩm đã tồn tại, kiểm tra xem số lượng theo tháng đã được cập nhật chưa
                Map<LocalDate, Long> soLuongTheoThangCuaSanPham = soLuongTheoThang.get(sanPhamId);
                // Nếu số lượng theo tháng đã được cập nhật, cộng thêm số lượng mới vào
                if (soLuongTheoThangCuaSanPham.containsKey(thangHoaDon)) {
                    long tongSoLuongHienTai = soLuongTheoThangCuaSanPham.get(thangHoaDon);
                    long tongSoLuongMoi = tongSoLuongHienTai + soLuong;
                    soLuongTheoThangCuaSanPham.put(thangHoaDon, tongSoLuongMoi);
                } else {
                    // Nếu số lượng theo tháng chưa được cập nhật, thêm số lượng mới vào
                    soLuongTheoThangCuaSanPham.put(thangHoaDon, soLuong);
                }
            } else {
                // Nếu sản phẩm chưa tồn tại trong Map, thêm sản phẩm vào Map và thêm số lượng theo tháng
                Map<LocalDate, Long> soLuongTheoThangMoi = new HashMap<>();
                soLuongTheoThangMoi.put(thangHoaDon, soLuong);
                soLuongTheoThang.put(sanPhamId, soLuongTheoThangMoi);
            }
        });

        soLuongTheoThang.forEach((key, value) -> {
            Optional<LineChartDto> lineChartDto = listReturn
                    .stream()
                    .filter(sp -> sp.getId().equals(key)).findFirst();

            if (lineChartDto.isPresent()) {
                List<Long> getSoLuongSp = new ArrayList<>();
                thangTrongKhoang.forEach(yearMonth -> {
                    AtomicReference<Long> check = new AtomicReference<>(0L);
                    value.forEach((data, dataValue) -> {
                        if (data.equals(yearMonth)) {
                            check.set(dataValue);
                        }
                    });
                    getSoLuongSp.add(check.get());
                });
                lineChartDto.get().setData(getSoLuongSp);
            }
        });

        return listReturn;
    }

    public Object switchTypeDate(LocalDate thangTrongKhoang, ReturnType returnType) {
        switch (returnType) {
            case LOCAL_DATE:
                return thangTrongKhoang;
            case YEAR_MONTH:
                return YearMonth.from(thangTrongKhoang);
            case YEAR:
                return Year.from(thangTrongKhoang);
            default:
                throw new IllegalArgumentException("Invalid return type");
        }
    }
}
