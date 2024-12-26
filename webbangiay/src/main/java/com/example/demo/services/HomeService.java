package com.example.demo.services;

import com.example.demo.models.dto.HomeQuangBaRequest;
import com.example.demo.models.dto.HomeQuangBaRespose;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.UUID;

public interface HomeService {
    Page<HomeQuangBaRespose> getSanPhamQuangBan(HomeQuangBaRequest request);
    Long getSoLuongDaBan(UUID id);
    Page<HomeQuangBaRespose> getAllSanPhamQuangBan(Pageable pageable);

}
