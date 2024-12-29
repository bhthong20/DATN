package com.example.demo.services;

import com.example.demo.models.KhuyenMai;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface KhuyenMaiService {
    Page<KhuyenMai> getAll(Pageable pageable);

    List<KhuyenMai> findAll();

    List<KhuyenMai> search(String search);

    KhuyenMai findById(UUID id);

    KhuyenMai add(KhuyenMai khuyenMai);

    KhuyenMai update(UUID id, KhuyenMai khuyenMai);

    Boolean delete(UUID id);

    List<KhuyenMai> getComboboxKhuyenMai();

    public List<KhuyenMai> loc(Integer locTT, Integer locHTG, LocalDate ngayKiemTra);

}
