package com.example.demo.repositories;

import com.example.demo.models.HoaDon;
import com.example.demo.models.KhachHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Query;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;


import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, UUID> {

    List<HoaDon> findAllByLoaiAndTrangThai(int loai, int trangThai);

    List<HoaDon> findAllByTrangThaiAndKhachHang(int trangThai, KhachHang khachHang);

    List<HoaDon> findAllByLoai(int loai);

    List<HoaDon> findAllByLoaiAndTrangThaiAndKhachHang(int loai, int trangThai, KhachHang khachHang);

    List<HoaDon> findAllByLoaiAndKhachHang(int loai, KhachHang khachHang);

    Page<HoaDon> findAllByTrangThaiNotIn(int[] trangThais, Pageable pageable);

    HoaDon findByMa(String ma);

    @Query(value = """
                SELECT hd FROM HoaDon hd where 1 = 1 and hd.trangThai <> 9
            """)
    Page<HoaDon> findAllBy(Pageable pageable);

    @Query("SELECT hd FROM HoaDon hd " +
            "LEFT JOIN hd.khachHang kh " +
            "LEFT JOIN hd.nhanVien nv " +
            "WHERE hd.ma LIKE %:ma% " +
            "OR kh.hoTen LIKE %:ma% " +
            "OR nv.hoTen LIKE %:ma%")
    List<HoaDon> searchMa(String ma);

    @Query("select hd from HoaDon hd left join NhanVien nv on nv.id=hd.nhanVien.id " +
            "left join KhachHang kh on kh.id=hd.khachHang.id " +
            "where " +
            "(:locTT is null or hd.trangThai = :locTT) " +
            "and (:locPTTT is null or hd.phuongThucThanhToan = :locPTTT) " +
            "and (:locLoai is null or hd.loai = :locLoai) " +
            "and (:startOfDay is null or :endOfDay is null or (hd.ngayTao >= :startOfDay and hd.ngayTao < :endOfDay))")
    List<HoaDon> loc(Integer locTT, Integer locPTTT, Integer locLoai,
                     LocalDateTime startOfDay, LocalDateTime endOfDay);


    @Query("select hd from HoaDon hd left join NhanVien nv on nv.id=hd.nhanVien.id " +
            "left join KhachHang kh on kh.id=hd.khachHang.id " +
            "where" +
            "(:locTT is null or hd.trangThai=:locTT) " +
            "and (:locPTTT is null or hd.phuongThucThanhToan=: locPTTT) " +
            "and (:locLoai is null or hd.loai=: locLoai) "

//            +"and (:giaBanMin is null and :giaBanMax is null or ct.giaBan between :giaBanMin and :giaBanMax)"
    )
    List<HoaDon> loc1(Integer locTT, Integer locPTTT, Integer locLoai);
}