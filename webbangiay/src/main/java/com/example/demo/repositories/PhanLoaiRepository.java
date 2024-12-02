package com.example.demo.repositories;

import com.example.demo.models.PhanLoai;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PhanLoaiRepository extends JpaRepository<PhanLoai, UUID> {
    @Query("select hsp from PhanLoai hsp where hsp.ma like %:search% or hsp.tenLoai like %:search%")
    List<PhanLoai> search(String search);
}
