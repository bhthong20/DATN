package com.example.demo.repositories;

import com.example.demo.models.GioHang;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GioHangRepository extends JpaRepository<GioHang, UUID> {
    @Query("select gh from GioHang gh where gh.ma like %:search% or gh.ghiChu like %:search%")
    List<GioHang> search(String search);

    public Page<GioHang> findAll(Pageable pageable);
}
