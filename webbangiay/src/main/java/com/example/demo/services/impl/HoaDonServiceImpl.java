package com.example.demo.services.impl;

import com.example.demo.models.HoaDon;
import com.example.demo.repositories.HoaDonRepository;
import com.example.demo.services.HoaDonService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class HoaDonServiceImpl implements HoaDonService {
    @Autowired
    HoaDonRepository hoaDonRepository;

    @Override
    public Page<HoaDon> getAll(Pageable pageable) {
        return hoaDonRepository.findAll(pageable);
    }

    @Override
    public Page<HoaDon> getAllAdmin(Pageable pageable) {
//        int[] c = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        return hoaDonRepository.findAllBy(pageable);
    }

    @Override
    public List<HoaDon> findAll() {
        return hoaDonRepository.findAll();
    }

    @Override
    public HoaDon findById(UUID id) {
        return
                hoaDonRepository.findById(id).orElse(null);
    }

    @Override
    public HoaDon findByMa(String ma) {
        return hoaDonRepository.findByMa(ma);
    }

    @Override
    public HoaDon add(HoaDon hoaDon) {
        return hoaDonRepository.save(hoaDon);
    }

    @Override
    public HoaDon update(UUID id, HoaDon hoaDon) {
        if (id != null) {
            HoaDon hoaDonUpdate = hoaDonRepository.findById(id).orElse(null);
            if (hoaDonUpdate != null) {
                BeanUtils.copyProperties(hoaDon, hoaDonUpdate);
                hoaDonRepository.save(hoaDonUpdate);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            HoaDon hoaDonUpdate = hoaDonRepository.findById(id).orElse(null);
            if (hoaDonUpdate != null) {
                hoaDonRepository.delete(hoaDonUpdate);
                return true;
            }
        }
        return false;
    }

    @Override
    public List<HoaDon> loc(Integer locTT, Integer locPTTT, Integer locLoai, LocalDateTime startOfDay, LocalDateTime endOfDay) {
        // Adjust your repository call accordingly
        return hoaDonRepository.loc(locTT, locPTTT, locLoai, startOfDay, endOfDay);
    }


    @Override
    public List<HoaDon> searchMa(String ma) {
        return hoaDonRepository.searchMa(ma);
    }

    @Override
    public List<HoaDon> loc1(Integer locTT, Integer locPTTT, Integer locLoai) {
        return hoaDonRepository.loc1(locTT, locPTTT, locLoai);
    }
}
