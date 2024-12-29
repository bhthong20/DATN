package com.example.demo.services.impl;

import com.example.demo.models.KhachHang;
import com.example.demo.repositories.KhachHangRepository;
import com.example.demo.services.KhachHangService;
import com.example.demo.util.RolesConstant;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class KhachHangServiceImpl implements KhachHangService {

    @Autowired
    KhachHangRepository khachHangRepository;

    @Override
    public Page<KhachHang> FindAll(Pageable pageable) {
        return khachHangRepository.findAll(pageable);
    }

    @Override
    public List<KhachHang> findAll() {
        return khachHangRepository.findAll();
    }

    @Override
    public List<KhachHang> search(String search) {
        return khachHangRepository.search(search);
    }

    @Override
    public List<KhachHang> loc(Integer locTT, Boolean locGT) {
        return khachHangRepository.loc(locTT, locGT);
    }

    @Override
    public KhachHang findById(UUID id) {
        return khachHangRepository.findById(id).orElse(null);
    }

    @Override
    public KhachHang add(KhachHang khachHang) {
        return khachHangRepository.save(khachHang);
    }

    @Override
    public KhachHang update(UUID id, KhachHang khachHang) {
        if (id != null) {
            KhachHang khachHang1 = khachHangRepository.findById(id).orElse(null);
            if (khachHang1 != null) {
                BeanUtils.copyProperties(khachHang, khachHang1);
                khachHangRepository.save(khachHang);
            }
        }
        return khachHangRepository.save(khachHang);
    }

    @Override
    public void deleteKhachHang(UUID id) {
        khachHangRepository.deleteById(id);
    }
}


