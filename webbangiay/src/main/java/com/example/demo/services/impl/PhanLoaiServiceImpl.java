package com.example.demo.services.impl;

import com.example.demo.models.PhanLoai;
import com.example.demo.repositories.PhanLoaiRepository;
import com.example.demo.services.PhanLoaiService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PhanLoaiServiceImpl implements PhanLoaiService {

    @Autowired
    PhanLoaiRepository mauSacRepository;


    @Override
    public Page<PhanLoai> getAll(Pageable pageable) {
        return mauSacRepository.findAll(pageable);
    }

    @Override
    public List<PhanLoai> findAll() {
        return mauSacRepository.findAll();
    }

    @Override
    public List<PhanLoai> search(String search) {
        return mauSacRepository.search(search);
    }

    @Override
    public PhanLoai findById(UUID id) {
        return mauSacRepository.findById(id).orElse(null);
    }

    @Override
    public PhanLoai add(PhanLoai mauSac) {
        return mauSacRepository.save(mauSac);
    }

    @Override
    public PhanLoai update(UUID id, PhanLoai mauSac ) {
        if(id != null){
            PhanLoai mauSac1  = mauSacRepository.findById(id).orElse(null);
            if(mauSac1 != null){
                BeanUtils.copyProperties(mauSac, mauSac1 );
                mauSacRepository.save(mauSac);
            }
        }
        return null;
    }

    @Override
    public Boolean delete(UUID id) {
        if(id != null){
            PhanLoai mauSac   = mauSacRepository.findById(id).orElse(null);
            if(mauSac != null){
                mauSacRepository.delete(mauSac);
                return true;
            }
        }
        return false;
    }
}
