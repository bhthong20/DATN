package com.example.demo.repositories;

import com.example.demo.models.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, UUID> {
    //    @Query("select nv from NhanVien nv where nv.ma like %:search% or nv.hoTen like %:search%")
//    List<NhanVien> search(String search);
    Optional<NhanVien> findByTaiKhoan(String ma);

    // Tìm nhân viên theo tài khoản (có vai trò)
    @Query("SELECT nv FROM NhanVien nv JOIN FETCH nv.chucVu WHERE nv.taiKhoan = :taiKhoan")
    Optional<NhanVien> findByTaiKhoanWithRole(String taiKhoan);

    // Tìm kiếm nhân viên dựa trên từ khóa
    @Query("SELECT nv FROM NhanVien nv WHERE " +
            "(:search IS NULL OR nv.ma LIKE %:search% OR UPPER(nv.hoTen) LIKE UPPER(concat('%', :search, '%')))")
    List<NhanVien> search(String search);

    // Lọc nhân viên theo trạng thái và giới tính
    @Query("SELECT nv FROM NhanVien nv JOIN FETCH nv.chucVu WHERE " +
            "(:locTT IS NULL OR nv.tinhTrang = :locTT) " +
            "AND (:locGT IS NULL OR nv.gioiTinh = :locGT)")
    List<NhanVien> loc(Integer locTT, Boolean locGT);

    // Tìm nhân viên theo vai trò
    @Query("SELECT nv FROM NhanVien nv JOIN nv.chucVu cv WHERE cv.tenChucVu = :roleName")
    List<NhanVien> findByRole(String roleName);
}
