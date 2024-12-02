package com.example.demo.services;

import com.example.demo.models.ThuongHieu;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ThuongHieuService {

    public Page<ThuongHieu> findAll(Pageable pageable);

    public List<ThuongHieu> findAll();

    public List<ThuongHieu> search(String search);

    public ThuongHieu findById(UUID id);

    public ThuongHieu add(ThuongHieu thuongHieu);

    public ThuongHieu update(UUID id, ThuongHieu thuongHieu);

    public Boolean delete(UUID id);
}
