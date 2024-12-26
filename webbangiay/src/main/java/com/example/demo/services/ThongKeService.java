package com.example.demo.services;

import com.example.demo.models.dto.ThongKeAllDto;
import com.example.demo.models.dto.ThongKeDetailDto;

import java.util.UUID;

public interface ThongKeService {
    ThongKeAllDto getTongThongKe(int type);

    ThongKeDetailDto getTongThongKeDetail(UUID uuid, int type);
}
