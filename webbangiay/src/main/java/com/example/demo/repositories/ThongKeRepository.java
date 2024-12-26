package com.example.demo.repositories;

import com.example.demo.models.HoaDonChiTiet;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ThongKeRepository extends HoaDonRepository {

    @Query("SELECT hdct FROM HoaDonChiTiet hdct " +
            "JOIN hdct.hoaDon hd " +
            "WHERE (hd.trangThai = 10 OR hd.trangThai = 6) AND hdct.trangThai = 0")
    List<HoaDonChiTiet> getAllHoaDonChiTiet();

}
