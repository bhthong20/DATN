package com.example.demo.services.impl;

import com.example.demo.models.DiaChi;
import com.example.demo.repositories.DiaChiRepository;
import com.example.demo.services.DiaChiService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DiaChiServiceImpl implements DiaChiService {

    @Autowired
    private DiaChiRepository diaChiRepository;


    @Override
    public Page<DiaChi> FindAll(Pageable pageable) {
        return diaChiRepository.findAll(pageable) ;
    }

    @Override
    public List<DiaChi> getAll() {
        return diaChiRepository.findAll();
    }

    @Override
    public List<DiaChi> search(String search) {
        return null;
    }

    @Override
    public DiaChi findById(UUID id) {
        return diaChiRepository.findById(id).orElse(null);
    }

    @Override
    public DiaChi add(DiaChi diaChi) {
        return diaChiRepository.save(diaChi);
    }

    @Override
    public DiaChi update(UUID id, DiaChi diaChi) {

        if(id != null){
            DiaChi diaChi1 = diaChiRepository.findById(id).orElse(null);
            if(diaChi1 != null){
                BeanUtils.copyProperties(diaChi , diaChi1);
                diaChiRepository.save(diaChi1);
            }
        }
        return null;
    }

    @Override
    public void deleteDiaChi(UUID id) {
        diaChiRepository.deleteById(id);

    }
}
