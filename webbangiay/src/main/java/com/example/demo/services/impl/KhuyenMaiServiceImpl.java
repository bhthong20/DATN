package com.example.demo.services.impl;

import com.example.demo.models.KhuyenMai;
import com.example.demo.repositories.KhuyenMaiRepository;
import com.example.demo.services.KhuyenMaiService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class KhuyenMaiServiceImpl implements KhuyenMaiService {
    @Autowired
    KhuyenMaiRepository khuyenMaiRepository;


    @Override
    public Page<KhuyenMai> getAll(Pageable pageable) {
        return khuyenMaiRepository.findAll(pageable);
    }

    @Override
    public List<KhuyenMai> findAll() {
        return khuyenMaiRepository.findAll();
    }

    @Override
    public List<KhuyenMai> search(String search) {
        return khuyenMaiRepository.search(search);
    }

    @Override
    public KhuyenMai findById(UUID id) {
        return khuyenMaiRepository.findById(id).orElse(null);
    }

    @Override
    public KhuyenMai add(KhuyenMai hangSanPham) {
        return khuyenMaiRepository.save(hangSanPham);
    }

    @Override
    public KhuyenMai update(UUID id, KhuyenMai hangSanPham) {
        if (id != null) {
            KhuyenMai hangSanPhamUpadte = khuyenMaiRepository.findById(id).orElse(null);
            if (hangSanPham != null) {
                hangSanPham.setId(hangSanPhamUpadte.getId());
                hangSanPham.setNgayTao(hangSanPhamUpadte.getNgayTao());
                hangSanPham.setNgayCapNhat(Date.valueOf(LocalDate.now()));
                khuyenMaiRepository.save(hangSanPham);
            }

        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            KhuyenMai khuyenMai = khuyenMaiRepository.findById(id).orElse(null);
            if (khuyenMai != null) {
                khuyenMai.setTrangThai(0);
                khuyenMaiRepository.save(khuyenMai);
                return true;
            }
        }
        return false;
    }

    @Override
    public List<KhuyenMai> getComboboxKhuyenMai() {
        Long ngayHienTai = System.currentTimeMillis();
        return khuyenMaiRepository.findByNgayBatDauLessThanEqualAndNgayKetThucGreaterThanEqualAndTrangThaiAndNgayBatDauIsNotNullAndNgayKetThucIsNotNullOrderByNgayTaoDesc(ngayHienTai, ngayHienTai, 1);
    }

    public List<KhuyenMai> loc(Integer locTT, Integer locHTG, LocalDate ngayKiemTra) {
        List<KhuyenMai> allKhuyenMai = khuyenMaiRepository.findAll();

        return allKhuyenMai.stream()
                .filter(km -> (locTT == null || km.getTrangThai() == locTT) &&
                        (locHTG == null || km.getHinhThucGiamGia() == locHTG) &&
                        (ngayKiemTra == null || isWithinRange(km, ngayKiemTra)))
                .collect(Collectors.toList());
    }

    private boolean isWithinRange(KhuyenMai khuyenMai, LocalDate ngayKiemTra) {
        LocalDate ngayBatDau = Instant.ofEpochMilli(khuyenMai.getNgayBatDau())
                .atZone(ZoneOffset.UTC)
                .toLocalDate();
        LocalDate ngayKetThuc = Instant.ofEpochMilli(khuyenMai.getNgayKetThuc())
                .atZone(ZoneOffset.UTC)
                .toLocalDate();

        return (ngayKiemTra.isEqual(ngayBatDau) || ngayKiemTra.isAfter(ngayBatDau)) &&
                (ngayKiemTra.isEqual(ngayKetThuc) || ngayKiemTra.isBefore(ngayKetThuc));
    }


}
