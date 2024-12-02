package com.example.demo.repositories;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, UUID> {

    List<HoaDonChiTiet> findHoaDonChiTietByHoaDonAndTrangThai(HoaDon hoaDon, int trangThai);

    List<HoaDonChiTiet> findHoaDonChiTietByIdIn(List<UUID> uuids);

    Optional<HoaDonChiTiet> findHoaDonChiTietByHoaDonAndChiTietSanPham(HoaDon hoaDon, ChiTietSanPham chiTietSanPham);

    Long countByHoaDon(HoaDon hoaDon);

    List<HoaDonChiTiet> findHoaDonChiTietByHoaDon(HoaDon hoaDon);
}
