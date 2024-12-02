package com.example.demo.services.impl;

import com.example.demo.models.ThuongHieu;
import com.example.demo.repositories.ThuongHieuRepository;
import com.example.demo.services.ThuongHieuService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class ThuongHieuServiceImpl implements ThuongHieuService {
    @Autowired
    ThuongHieuRepository thuongHieuRepository;


    @Override
    public Page<ThuongHieu> findAll(Pageable pageable) {
        return thuongHieuRepository.findAll(pageable);
    }

    @Override
    public List<ThuongHieu> findAll() {
        return thuongHieuRepository.findAll();
    }

    @Override
    public List<ThuongHieu> search(String search) {
        return thuongHieuRepository.search(search);
    }

    @Override
    public ThuongHieu findById(UUID id) {
        return thuongHieuRepository.findById(id).orElse(null);
    }

    @Override
    public ThuongHieu add(ThuongHieu thuongHieu) {
        return thuongHieuRepository.save(thuongHieu);
    }

    @Override
    public ThuongHieu update(UUID id, ThuongHieu thuongHieu) {
        if (id != null) {
            ThuongHieu thuongHieuUpadte = thuongHieuRepository.findById(id).orElse(null);
            if (thuongHieu != null){
                BeanUtils.copyProperties(thuongHieu, thuongHieuUpadte);
                thuongHieuRepository.save(thuongHieuUpadte);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            ThuongHieu thuongHieu = thuongHieuRepository.findById(id).orElse(null);
            if (thuongHieu != null) {
                thuongHieuRepository.delete(thuongHieu);
                return true;
            }
        }
        return false;
    }
}
