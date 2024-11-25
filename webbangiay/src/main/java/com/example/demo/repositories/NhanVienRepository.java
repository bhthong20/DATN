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

    @Query("select nv from NhanVien nv where nv.ma like %:search% or UPPER(nv.hoTen) like UPPER(concat('%', :search, '%'))")
    List<NhanVien> search(String search);

    @Query("select nv from NhanVien nv where " +
            "(:locTT is null or nv.tinhTrang=:locTT) " +
            "and (:locGT is null or nv.gioiTinh=:locGT)"
    )
    List<NhanVien> loc(Integer locTT, Boolean locGT);
}
