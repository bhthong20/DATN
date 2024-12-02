package com.example.demo.services;

import com.example.demo.models.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface HoaDonService {
    public Page<HoaDon> getAll(Pageable pageable);

    public Page<HoaDon> getAllAdmin(Pageable pageable);

    public List<HoaDon> findAll();

    public HoaDon findById(UUID id);

    public HoaDon findByMa(String ma);

    public HoaDon add(HoaDon hoaDon);

    public HoaDon update(UUID id, HoaDon hoaDon);

    public Boolean delete(UUID id);

    public List<HoaDon> loc(Integer locTT, Integer locPTTT, Integer locLoai, LocalDateTime startOfDay, LocalDateTime endOfDay);


    List<HoaDon> searchMa(String ma);

    List<HoaDon> loc1(Integer locTT, Integer locPTTT, Integer locLoai);
}
