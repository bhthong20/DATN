package com.example.demo.services.impl;

import com.example.demo.models.ChatLieu;
import com.example.demo.models.NhanVien;
import com.example.demo.models.SanPham;
import com.example.demo.repositories.NhanVienRepository;
import com.example.demo.services.NhanVienService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class NhanVienServiceImpl implements NhanVienService {
    @Autowired
    NhanVienRepository nhanVienRepository;

    @Override
    public List<NhanVien> findAll() {
        return null;
    }

    @Override
    public Page<NhanVien> FindAll(Pageable pageable) {
        return nhanVienRepository.findAll(pageable);
    }

    @Override
    public List<NhanVien> getAll() {
        return nhanVienRepository.findAll();
    }

    @Override
    public List<NhanVien> search(String search) {
        return nhanVienRepository.search(search);
    }

    @Override
    public NhanVien findById(UUID id) {
        return nhanVienRepository.findById(id).orElse(null);
    }

    @Override
    public NhanVien add(NhanVien nhanVien) {
        return nhanVienRepository.save(nhanVien);
    }

    @Override
    public NhanVien update(UUID id, NhanVien nhanVien) {
        if (id != null) {
            NhanVien nhanVien1 = nhanVienRepository.findById(id).orElse(null);
            if (nhanVien1 != null) {
                BeanUtils.copyProperties(nhanVien, nhanVien1);
                nhanVienRepository.save(nhanVien1);
            }
        }
        return null;
    }

    @Override
    public void deleteNhanVien(UUID id) {
        nhanVienRepository.deleteById(id);
    }

    @Override
    public List<NhanVien> loc(Integer locTT, Boolean locGT) {
        return nhanVienRepository.loc(locTT, locGT);
    }
}



