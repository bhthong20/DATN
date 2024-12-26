package com.example.demo.services;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.KhachHang;
import com.example.demo.models.dto.HoaDonRequest;
import com.example.demo.models.dto.SanPhamAddHoaDon;
import org.apache.coyote.BadRequestException;

import java.util.List;
import java.util.UUID;

public interface BanHangTaiQuayService {
    List<HoaDon> getAllHoaDon();
    List<HoaDon> createHoaDon() throws BadRequestException;
    List<HoaDonChiTiet> findHoaDonDto(UUID id);
    List<ChiTietSanPham> getChiTietSanPham(List<UUID> listId);
    ChiTietSanPham getDetailSanPham(UUID id);
    List<HoaDonChiTiet> shoppingProduct(List<SanPhamAddHoaDon> sanPhamAddHoaDons);
    Boolean deleteProduct(List<UUID> listId);
    List<KhachHang> getAllKhachHang();
    Boolean changeStatusHoaDon(HoaDonRequest request);
    Boolean rejectHoaDon(List<UUID> listId, UUID idHoaDon);
}
