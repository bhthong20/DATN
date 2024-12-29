package com.example.demo.repositories;

import com.example.demo.models.KhachHang;
import com.example.demo.models.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, UUID> {

    Optional<KhachHang> findByTaiKhoan(String ma);

    Optional<KhachHang> findByEmail(String email);

    Optional<KhachHang> findByResetCode(String resetCode);

    @Query("select kh from KhachHang kh where kh.ma like %:search% or kh.hoTen like %:search% or kh.sdt like %:search%")
    List<KhachHang> search(String search);

    @Query("select nv from KhachHang nv where " +
            "(:locTT is null or nv.trangThai=:locTT) " +
            "and (:locGT is null or nv.gioiTinh=:locGT)"
    )
    List<KhachHang> loc(Integer locTT, Boolean locGT);
}
