package com.example.demo.services.impl;

import com.example.demo.models.KichThuoc;
import com.example.demo.repositories.KichThuocRepository;
import com.example.demo.services.KichThuocService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class KichThuocServiceImpl implements KichThuocService {
    @Autowired
    KichThuocRepository sizeRepository;
    @Override
    public Page<KichThuoc> getAll(Pageable pageable) {
        return sizeRepository.findAll(pageable);
    }

    @Override
    public List<KichThuoc> findAll() {
        return sizeRepository.findAll();
    }

    @Override
    public List<KichThuoc> search(String search) {
        return sizeRepository.search(search);
    }

    @Override
    public KichThuoc findById(UUID id) {
        return sizeRepository.findById(id).orElse(null);
    }

    @Override
    public KichThuoc add(KichThuoc size) {
        return sizeRepository.save(size);
    }

    @Override
    public KichThuoc update(UUID id, KichThuoc size) {
        if(id != null){
            KichThuoc size1  = sizeRepository.findById(id).orElse(null);
            if(size1 != null){
                BeanUtils.copyProperties(size, size1 );
                sizeRepository.save(size);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if(id != null){
            KichThuoc size   = sizeRepository.findById(id).orElse(null);
            if(size != null){
                sizeRepository.delete(size);
                return true;
            }
        }
        return false;
    }
}
