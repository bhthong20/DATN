package com.example.demo.repositories;

import com.example.demo.models.HoaDon;
import com.example.demo.models.LichSuTrangThai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface LichSuTrangThaiRepository extends JpaRepository<LichSuTrangThai, UUID> {

    @Query("SELECT lst FROM LichSuTrangThai lst WHERE lst.hoaDon = :hoaDon AND lst.isDelete = 1 ORDER BY lst.ngayTao DESC ")
    List<LichSuTrangThai> getAllByHoaDon(HoaDon hoaDon);
}
