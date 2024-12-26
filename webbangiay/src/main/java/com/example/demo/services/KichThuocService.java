package com.example.demo.services;

import com.example.demo.models.KichThuoc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface KichThuocService {

    public Page<KichThuoc> getAll(Pageable pageable);

    public List<KichThuoc> search(String search);

    public List<KichThuoc> findAll();

    public KichThuoc findById(UUID id);

    public KichThuoc add(KichThuoc kichThuoc);

    public KichThuoc update(UUID id, KichThuoc kichThuoc);

    public Boolean delete(UUID id);

}
