package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.ChucVu;
import com.example.demo.models.NhanVien;
import com.example.demo.repositories.ChucVuRepository;
import com.example.demo.services.ChucVuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ChucVuServiceImpl implements ChucVuService {
    @Autowired
    ChucVuRepository chucVuRepository;

    @Override
    public Page<ChucVu> FindAll(Pageable pageable) {
        return chucVuRepository.findAll(pageable);
    }

    @Override
    public List<ChucVu> getAll() {
        return chucVuRepository.findAll();
    }

    @Override
    public List<ChucVu> search(String search) {
        return null;
    }

    @Override
    public ChucVu findById(UUID id) {
        return chucVuRepository.findById(id).orElse(null);
    }

    @Override
    public ChucVu add(ChucVu chucVu) {
        return chucVuRepository.save(chucVu);
    }

    @Override
    public ChucVu update(UUID id, ChucVu chucVu) {
    if( id != null ){
        ChucVu chucVu1 = chucVuRepository.findById(id).orElse(null);
        if(chucVu1 != null){
            BeanUtils.copyProperties( chucVu , chucVu1);
            chucVuRepository.save(chucVu1);
        }
    }
        return null;
    }

    @Override
    public void deleteChucVu(UUID id) {
        chucVuRepository.deleteById(id);
    }


}
