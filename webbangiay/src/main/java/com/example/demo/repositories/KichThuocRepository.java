package com.example.demo.repositories;

import com.example.demo.models.ChatLieu;
import com.example.demo.models.KichThuoc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface KichThuocRepository extends JpaRepository<KichThuoc, UUID> {
    @Query("select kt from KichThuoc kt where kt.ma like %:search% or kt.size like %:search%")
    List<KichThuoc> search(String search);
}
