package com.example.demo.services.impl;

import com.example.demo.models.ChiTietSanPham;
import com.example.demo.models.HinhAnh;
import com.example.demo.models.SanPham;
import com.example.demo.models.dto.ChiTietSanPhamDto;
import com.example.demo.models.dto.SanPhamDto;
import com.example.demo.repositories.ChiTietSanPhamRepository;
import com.example.demo.repositories.SanPhamRepository;
import com.example.demo.services.ChatLieuService;
import com.example.demo.services.ChiTietSanPhamService;
import com.example.demo.services.HinhAnhService;
import com.example.demo.services.KichThuocService;
import com.example.demo.services.MauSacService;
import com.example.demo.services.PhanLoaiService;
import com.example.demo.services.SanPhamService;
import com.example.demo.services.ThuongHieuService;
import com.example.demo.util.ConvertImage;
import jakarta.transaction.Transactional;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class ChiTietSanPhamServiceImpl implements ChiTietSanPhamService {
    @Autowired
    private ChiTietSanPhamRepository repository;

    @Autowired
    private SanPhamService sanPhamService;

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @Autowired
    private HinhAnhService hinhAnhService;

    @Autowired
    private PhanLoaiService phanLoaiService;

    @Autowired
    private ThuongHieuService thuongHieuService;

    @Autowired
    private ChatLieuService chatLieuService;

    @Autowired
    private KichThuocService kichThuocService;

    @Autowired
    private MauSacService mauSacService;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @Autowired
    private ConvertImage convertImage;

    @Override
    public Page<ChiTietSanPham> getAll(Pageable pageable) {
        return repository.findAll(pageable);
    }

    @Override
    public Page<ChiTietSanPham> getAll1(Pageable pageable) {
        return repository.getAll1(pageable);
    }

    @Override
    public List<ChiTietSanPham> findAll() {
        return repository.findAll();
    }

    @Override
    public List<ChiTietSanPham> findAll0() {
        return repository.findAll0();
    }

    @Override
    public List<SanPham> search0(String search) {
        return repository.search(search);
    }

    @Override
    public List<ChiTietSanPham> search1(String search) {
        return repository.search1(search);
    }

    @Override
    public List<SanPham> loc(String locTH, String locPL) {
        return repository.loc(locTH, locPL);
    }

    @Override
    public List<SanPham> loc1(String locTH, String locPL, Integer locTT) {
        return repository.loc1(locTH, locPL, locTT);
    }


    @Override
    public Boolean delete(UUID id) {
        if (id != null) {
            SanPham sanPhamUpdate = sanPhamService.findById(id);
            if (sanPhamUpdate != null) {
                sanPhamUpdate.setTrangThai(0);
                sanPhamRepository.save(sanPhamUpdate);
                chiTietSanPhamRepository.saveAll(chiTietSanPhamRepository.findAllBySanPhamAndIsDelete(sanPhamUpdate, 1).stream().map(el -> {
                    el.setIsDelete(0);
                    return el;
                }).collect(Collectors.toList()));
                return true;
            }
        }
        return false;

    }

    @Override
    @Transactional
    public Boolean addAllChiTietSanPham(SanPhamDto sanPhamDto) {
        try {

            SanPham sanPham = new SanPham();
            sanPham.setMa("SP" + (sanPhamService.findAll().size() + 1));
            sanPham.setTenSP(sanPhamDto.getTenSanPham());
            sanPham.setNgayTao(Date.valueOf(LocalDate.now()));
            sanPham.setMoTa(sanPhamDto.getMoTa());
            sanPham.setPhanLoai(phanLoaiService.findById(UUID.fromString(sanPhamDto.getIdLoaiSanPham())));
            sanPham.setThuongHieu(thuongHieuService.findById(UUID.fromString(sanPhamDto.getIdThuongHieu())));
            sanPham.setTrangThai(1);

            HinhAnh hinhAnh = new HinhAnh();
            if (sanPhamDto.getAnh1() != null) {
                hinhAnh.setAnh1(convertImage.convertImageFromBase64(sanPhamDto.getAnh1()));
            }
            if (sanPhamDto.getAnh2() != null) {
                hinhAnh.setAnh2(convertImage.convertImageFromBase64(sanPhamDto.getAnh2()));
            }
            if (sanPhamDto.getAnh3() != null) {
                hinhAnh.setAnh3(convertImage.convertImageFromBase64(sanPhamDto.getAnh3()));
            }

            hinhAnh.setTen("Ảnh sản phẩm " + sanPhamDto.getTenSanPham());
            hinhAnh.setId(hinhAnhService.add(hinhAnh).getId());
            sanPham.setHinhAnh(hinhAnh);

            sanPham.setId(sanPhamService.add(sanPham).getId());

            List<ChiTietSanPham> chiTietSanPhams = new ArrayList<>();

            for (ChiTietSanPhamDto dto : sanPhamDto.getChiTietSanPhamDtos()) {
                String maCTSP = "CTSP" + (findAll().size() + 1);

                ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
                chiTietSanPham.setMa(maCTSP);
                chiTietSanPham.setNgayTao(Date.valueOf(LocalDate.now()));
                chiTietSanPham.setChatLieu(chatLieuService.findById(UUID.fromString(dto.getIdChatLieu())));
                chiTietSanPham.setDonGia(dto.getDonGia());
                chiTietSanPham.setKichThuoc(kichThuocService.findById(UUID.fromString(dto.getIdKichThuoc())));
                chiTietSanPham.setMauSac(mauSacService.findById(UUID.fromString(dto.getIdMauSac())));
                chiTietSanPham.setSoLuongTon(dto.getSoLuongTon());
                chiTietSanPham.setTrangThai(dto.getTrangThai());
                chiTietSanPham.setMoTa(dto.getMoTa());
                chiTietSanPham.setSanPham(sanPham);
                chiTietSanPham.setIsDelete(1);

                if (dto.getAnh1() != null && dto.getAnh2() != null && dto.getAnh3() != null) {
                    HinhAnh hinhAnhCtsp = new HinhAnh();
                    if (dto.getAnh1() != null) {
                        hinhAnhCtsp.setAnh1(convertImage.convertImageFromBase64(dto.getAnh1()));
                    }
                    if (dto.getAnh2() != null) {
                        hinhAnhCtsp.setAnh2(convertImage.convertImageFromBase64(dto.getAnh2()));
                    }
                    if (dto.getAnh3() != null) {
                        hinhAnhCtsp.setAnh3(convertImage.convertImageFromBase64(dto.getAnh3()));
                    }
                    hinhAnhCtsp.setTen("Ảnh sản phẩm " + sanPhamDto.getTenSanPham() + ". Mã " + maCTSP);
                    hinhAnhCtsp.setId(hinhAnhService.add(hinhAnhCtsp).getId());
                    chiTietSanPham.setHinhAnh(hinhAnhCtsp);
                }
                chiTietSanPhams.add(chiTietSanPham);
            }

            repository.saveAll(chiTietSanPhams);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    @Transactional
    public Boolean updateAllChiTietSanPham(SanPhamDto sanPhamDto) {
        try {
            SanPham sanPham = sanPhamRepository.findById(UUID.fromString(sanPhamDto.getId())).orElse(null);
            if (sanPham != null) {
                HinhAnh hinhAnh = null;
                if (sanPham.getHinhAnh() == null) {
                    hinhAnh = new HinhAnh();

                    if (sanPhamDto.getAnh1() != null) {
                        hinhAnh.setAnh1(convertImage.convertImageFromBase64(sanPhamDto.getAnh1()));
                    }
                    if (sanPhamDto.getAnh2() != null) {
                        hinhAnh.setAnh2(convertImage.convertImageFromBase64(sanPhamDto.getAnh2()));
                    }
                    if (sanPhamDto.getAnh3() != null) {
                        hinhAnh.setAnh3(convertImage.convertImageFromBase64(sanPhamDto.getAnh3()));
                    }

                    hinhAnh.setTen("Ảnh sản phẩm " + sanPhamDto.getTenSanPham());

                    hinhAnh.setId(hinhAnhService.add(hinhAnh).getId());
                    sanPham.setHinhAnh(hinhAnh);

                } else {
                    hinhAnh = sanPham.getHinhAnh();
                    if (sanPhamDto.getAnh1() != null) {
                        hinhAnh.setAnh1(convertImage.convertImageFromBase64(sanPhamDto.getAnh1()));
                    }
                    if (sanPhamDto.getAnh2() != null) {
                        hinhAnh.setAnh2(convertImage.convertImageFromBase64(sanPhamDto.getAnh2()));
                    }
                    if (sanPhamDto.getAnh3() != null) {
                        hinhAnh.setAnh3(convertImage.convertImageFromBase64(sanPhamDto.getAnh3()));
                    }

                    hinhAnhService.update(hinhAnh.getId(), hinhAnh);
                    sanPham.setHinhAnh(sanPham.getHinhAnh());
                }


                sanPham.setTenSP(sanPhamDto.getTenSanPham());
                sanPham.setNgayTao(Date.valueOf(LocalDate.now()));
                sanPham.setMoTa(sanPhamDto.getMoTa());
                sanPham.setPhanLoai(phanLoaiService.findById(UUID.fromString(sanPhamDto.getIdLoaiSanPham())));
                sanPham.setThuongHieu(thuongHieuService.findById(UUID.fromString(sanPhamDto.getIdThuongHieu())));
                sanPham.setTrangThai(1);
                sanPhamRepository.save(sanPham);

                List<ChiTietSanPham> chiTietSanPhams = new ArrayList<>();
                List<UUID> listIdSave = new ArrayList<>();

                for (ChiTietSanPhamDto dto: sanPhamDto.getChiTietSanPhamDtos()) {
                    ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
                    if (dto.getId() == null) {
                        String maCTSP = "CTSP" + (findAll().size() + 1);
                        chiTietSanPham.setMa(maCTSP);
                        chiTietSanPham.setSanPham(sanPham);
                    } else {
                        chiTietSanPham = repository.findById(UUID.fromString(dto.getId())).orElse(null);
                        listIdSave.add(chiTietSanPham.getId());
                    }

                    HinhAnh hinhAnhCtsp;

                    if (chiTietSanPham.getHinhAnh() == null) {
                        hinhAnhCtsp = new HinhAnh();

                        if (dto.getAnh1() != null) {
                            hinhAnhCtsp.setAnh1(convertImage.convertImageFromBase64(dto.getAnh1()));
                        }
                        if (dto.getAnh2() != null) {
                            hinhAnhCtsp.setAnh2(convertImage.convertImageFromBase64(dto.getAnh2()));
                        }
                        if (dto.getAnh3() != null) {
                            hinhAnhCtsp.setAnh3(convertImage.convertImageFromBase64(dto.getAnh3()));
                        }

                        hinhAnhCtsp.setTen("Ảnh sản phẩm " + sanPhamDto.getTenSanPham() + ". Mã " + chiTietSanPham.getMa());

                        hinhAnhCtsp.setId(hinhAnhService.add(hinhAnhCtsp).getId());
                        chiTietSanPham.setHinhAnh(hinhAnhCtsp);
                    } else {
                        hinhAnhCtsp = chiTietSanPham.getHinhAnh();
                        if (dto.getAnh1() != null) {
                            hinhAnhCtsp.setAnh1(convertImage.convertImageFromBase64(dto.getAnh1()));
                        }
                        if (dto.getAnh2() != null) {
                            hinhAnhCtsp.setAnh2(convertImage.convertImageFromBase64(dto.getAnh2()));
                        }
                        if (dto.getAnh3() != null) {
                            hinhAnhCtsp.setAnh3(convertImage.convertImageFromBase64(dto.getAnh3()));
                        }

                        hinhAnhService.update(hinhAnhCtsp.getId(), hinhAnhCtsp);
                        chiTietSanPham.setHinhAnh(chiTietSanPham.getHinhAnh());
                    }

                    chiTietSanPham.setNgayTao(Date.valueOf(LocalDate.now()));
                    chiTietSanPham.setChatLieu(chatLieuService.findById(UUID.fromString(dto.getIdChatLieu())));
                    chiTietSanPham.setDonGia(dto.getDonGia());
                    chiTietSanPham.setKichThuoc(kichThuocService.findById(UUID.fromString(dto.getIdKichThuoc())));
                    chiTietSanPham.setMauSac(mauSacService.findById(UUID.fromString(dto.getIdMauSac())));
                    chiTietSanPham.setSoLuongTon(dto.getSoLuongTon());
                    chiTietSanPham.setTrangThai(dto.getTrangThai());
                    chiTietSanPham.setIsDelete(1);
                    chiTietSanPham.setMoTa(dto.getMoTa());
                    chiTietSanPhams.add(chiTietSanPham);
                }

                List<ChiTietSanPham> listChiTietSanPhamDelete = repository.findAllByIdNotInAndSanPhamAndIsDelete(listIdSave, sanPham, 1).stream().map(el -> {
                    el.setIsDelete(0);
                    return el;
                }).collect(Collectors.toList());

                chiTietSanPhams.addAll(listChiTietSanPhamDelete);

                repository.saveAll(chiTietSanPhams);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public ChiTietSanPham findById(UUID id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public List<ChiTietSanPham> findChiTietSanPhamBySanPham(SanPham sanPham) {
        return repository.findAllBySanPhamAndIsDelete(sanPham, 1);
    }


    @Override
    public List<ChiTietSanPham> findChiTietSanPhamBySanPhamHome(SanPham sanPham) {
        return repository.findAllBySanPhamAndIsDeleteAndTrangThai(sanPham, 1, 1);
    }

    @Override
    public ChiTietSanPham add(ChiTietSanPham chiTietSanPham) {
        return repository.save(chiTietSanPham);
    }

    @Override
    public ChiTietSanPham update(UUID id, ChiTietSanPham chiTietSanPham) {
        if (id != null) {
            ChiTietSanPham ctsp = repository.findById(id).orElse(null);
            if (ctsp != null) {
                BeanUtils.copyProperties(chiTietSanPham, ctsp);
                repository.save(ctsp);
            }
        }
        return null;
    }

    @Override
    public void updateTT() {
        repository.updateTT();
    }
}
