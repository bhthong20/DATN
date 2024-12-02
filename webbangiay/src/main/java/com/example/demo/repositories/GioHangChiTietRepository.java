package com.example.demo.repositories;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.GioHangChiTiet;
import com.example.demo.models.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface GioHangChiTietRepository extends JpaRepository<GioHangChiTiet, UUID> {
//    @Query("select ghct from GioHangChiTiet ghct where ghct.gioHang.ma like %:search%")
//    List<GioHangChiTiet> search(String search);

    public Page<GioHangChiTiet> findAll(Pageable pageable);

    Long countByKhachHang(KhachHang khachHang);

    List<GioHangChiTiet> findAllByKhachHang(KhachHang khachHang);

    Optional<GioHangChiTiet> findByKhachHangAndChiTietSanPham(KhachHang khachHang, ChiTietSanPham chiTietSanPham);
}
