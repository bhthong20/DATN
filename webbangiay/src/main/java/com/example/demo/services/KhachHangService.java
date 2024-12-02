package com.example.demo.services;

import com.example.demo.models.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface KhachHangService {
    public Page<KhachHang> FindAll(Pageable pageable);

    public List<KhachHang> findAll();

    public List<KhachHang> search(String search);
    
    List<KhachHang> loc(Integer locTT, Boolean locGT);

    public KhachHang findById(UUID id);

    public KhachHang add(KhachHang khachHang);

    public KhachHang update(UUID id, KhachHang khachHang);

    public void deleteKhachHang(UUID id);
}

