package com.example.demo.repositories;

import com.example.demo.models.DanhGia;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface DanhGiaRepository extends JpaRepository<DanhGia, UUID> {
    @Query("select dg from DanhGia dg where dg.ma like %:search% or dg.ghiChu like %:search%")
    List<DanhGia> search(String search);

    public Page<DanhGia> findAll(Pageable pageable);
}
