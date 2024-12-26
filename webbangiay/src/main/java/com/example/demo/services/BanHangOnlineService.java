package com.example.demo.services;

import com.example.demo.models.GioHangChiTiet;
import com.example.demo.models.HoaDon;
import com.example.demo.models.HoaDonChiTiet;
import com.example.demo.models.dto.BanHangRequest;
import com.example.demo.models.dto.HoaDonRequest;
import org.apache.coyote.BadRequestException;

import java.util.List;
import java.util.UUID;

public interface BanHangOnlineService {
    Long countGioHang();
    List<GioHangChiTiet> getListGioHang();
    Boolean themVaoGioHang(BanHangRequest banHangRequest) throws BadRequestException;
    Boolean updateGioHang(List<BanHangRequest> banHangRequests) throws BadRequestException;
    Boolean deleteGioHang(List<UUID> listId);
    UUID taoHoaDon(List<BanHangRequest> list) throws BadRequestException;
    HoaDon findHoaDonById(UUID id);
    List<HoaDonChiTiet> listHoaDonChiTiet(UUID id);
    List<HoaDon> listHoaDon(int trangThai);
    Boolean updateHoaDon(List<BanHangRequest> banHangRequests, UUID idHoaDon) throws BadRequestException;
    Boolean deleteHoaDon(List<UUID> listId, UUID idHoaDon);
    String thanhToan(HoaDonRequest hoaDonRequest) throws BadRequestException;
    Boolean thayDoiTrangThaiHoaDon(UUID idHoaDon, int trangThai) throws BadRequestException;
    Boolean quayLaiTrangThai(UUID idHoaDon) throws BadRequestException;
    int countHoaDonByTrangThai(int trangThai);
}
