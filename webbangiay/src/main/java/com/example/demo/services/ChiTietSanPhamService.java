package com.example.demo.services;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.SanPham;
import com.example.demo.models.dto.SanPhamDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.UUID;

public interface ChiTietSanPhamService {
    //phân trang bên trang hiển thị
    public Page<ChiTietSanPham> getAll(Pageable pageable);

    //phân trang bên trang view trạng thái
    public Page<ChiTietSanPham> getAll1(Pageable pageable);

    //làm mã tự tăng
    public List<ChiTietSanPham> findAll();

    //hiển thị liên combobox với những trường có trạng thái 0
    public List<ChiTietSanPham> findAll0();

    //tìm theo id
    public ChiTietSanPham findById(UUID id);

    List<ChiTietSanPham> findChiTietSanPhamBySanPham(SanPham sanPham);

    List<ChiTietSanPham> findChiTietSanPhamBySanPhamHome(SanPham sanPham);

    //thêm
    public ChiTietSanPham add(ChiTietSanPham chiTietSanPham);

    //update
    public ChiTietSanPham update(UUID id, ChiTietSanPham chiTietSanPham);

    //update lại toàn bộ các trường có trạng thái 0
    public void updateTT();

    //tìm kiếm bên trang trạng thái
    public List<SanPham> search0(String search);

    //tìm kiếm bên trang view trạng thái
    public List<ChiTietSanPham> search1(String search);

    //lọc bên trang trạng thái
    List<SanPham> loc(String locTH, String locPL);

    List<SanPham> loc1(String locTH, String locPL, Integer locTT);

    public Boolean delete(UUID id);

    Boolean addAllChiTietSanPham(SanPhamDto sanPhamDto);

    Boolean updateAllChiTietSanPham(SanPhamDto sanPhamDto);
}
