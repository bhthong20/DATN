package com.example.demo.repositories;

import com.example.demo.models.SanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.example.demo.models.dto.HomeQuangBaRequest;
import com.example.demo.models.dto.HomeQuangBaRespose;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, UUID> {
    @Query("select sp from SanPham sp where sp.ma like %:search% or sp.tenSP like %:search%")
    List<SanPham> search(String search);

    Page<SanPham> findAllByTrangThai(int trangThai, Pageable pageable);

    @Query(value = """
            WITH luotMua AS (
                SELECT
                    COUNT(hdct.id_hoa_don_chi_tiet) AS countLuotMua,
                    ctsp.san_pham_id 
                FROM hoa_don_chi_tiet hdct
                JOIN chi_tiet_san_pham ctsp ON hdct.chi_tiet_san_pham_id = ctsp.id_chi_tiet_san_pham
                JOIN hoa_don hd on hdct.hoa_don_id = hd.id_hoa_don
                where hd.trang_thai = 10
                GROUP BY
                    ctsp.san_pham_id
            )
            SELECT
                sp.id_san_pham AS idSanPham,
                sp.ma_san_pham AS maSanPham,
                sp.ten_san_pham AS tenSanPham,
                ha.url_anh AS hinhAnh,
                l.ten_loai AS loai,
                th.ten_thuong_hieu AS thuongHieu,
                sp.mo_ta AS moTa,
                MAX(ctsp.don_gia) AS donGia,
                30 as sale,
                COALESCE(lm.countLuotMua, 0) as luotMua
            FROM
                san_pham sp
            JOIN
                chi_tiet_san_pham ctsp ON sp.id_san_pham = ctsp.san_pham_id
            LEFT JOIN
                luotMua lm ON lm.san_pham_id = sp.id_san_pham
            JOIN
                hinh_anh ha ON sp.id_hinh_anh = ha.id_hinh_anh
            JOIN
                loai l ON l.id_loai = sp.id_loai
            JOIN
                thuong_hieu th ON th.id_thuong_hieu = sp.id_thuong_hieu
            WHERE 
                sp.trang_thai = 1
                AND (:#{#req.ma} IS NULL OR :#{#req.ma} = '' OR sp.ma_san_pham LIKE %:#{#req.ma}%)
                AND (:#{#req.ten} IS NULL OR :#{#req.ten} = '' OR sp.ten_san_pham LIKE %:#{#req.ten}%)
                AND (ctsp.mau_sac_id IN (:#{#req.listIdMauSac}))
                AND ( sp.id_loai IN (:#{#req.listIdPhanLoai}))
                AND ( sp.id_thuong_hieu IN (:#{#req.listIdThuongHieu}))
                GROUP BY
                    sp.id_san_pham,
                    sp.ma_san_pham,
                    sp.ten_san_pham,
                    ha.url_anh,
                    th.ten_thuong_hieu,
                    sp.mo_ta,
                    l.ten_loai,
                    lm.countLuotMua,
                    sp.ngay_tao
            HAVING 
                (:#{#req.giaBatDau} IS NULL OR MAX(ctsp.don_gia) >= :#{#req.giaBatDau})
                AND (:#{#req.giaKetThuc} IS NULL OR MAX(ctsp.don_gia) <= :#{#req.giaKetThuc}) 
            """, nativeQuery = true, countQuery = """
            WITH luotMua AS (
                SELECT
                    COUNT(hdct.id_hoa_don_chi_tiet) AS countLuotMua,
                    ctsp.san_pham_id 
                FROM hoa_don_chi_tiet hdct
                JOIN chi_tiet_san_pham ctsp ON hdct.chi_tiet_san_pham_id = ctsp.id_chi_tiet_san_pham
                JOIN hoa_don hd on hdct.hoa_don_id = hd.id_hoa_don
                where hd.trang_thai = 10
                GROUP BY
                    ctsp.san_pham_id
            )
            SELECT
                sp.id_san_pham AS idSanPham,
                sp.ma_san_pham AS maSanPham,
                sp.ten_san_pham AS tenSanPham,
                ha.url_anh AS hinhAnh,
                l.ten_loai AS loai,
                th.ten_thuong_hieu AS thuongHieu,
                sp.mo_ta AS moTa,
                MAX(ctsp.don_gia) AS donGia,
                30 as sale,
                COALESCE(lm.countLuotMua, 0) as luotMua
            FROM
                san_pham sp
            JOIN
                chi_tiet_san_pham ctsp ON sp.id_san_pham = ctsp.san_pham_id
            LEFT JOIN
                luotMua lm ON lm.san_pham_id = sp.id_san_pham
            JOIN
                hinh_anh ha ON sp.id_hinh_anh = ha.id_hinh_anh
            JOIN
                loai l ON l.id_loai = sp.id_loai
            JOIN
                thuong_hieu th ON th.id_thuong_hieu = sp.id_thuong_hieu
            WHERE 
                sp.trang_thai = 1
                AND (:#{#req.ma} IS NULL OR :#{#req.ma} = '' OR sp.ma_san_pham LIKE %:#{#req.ma}%)
                AND (:#{#req.ten} IS NULL OR :#{#req.ten} = '' OR sp.ten_san_pham LIKE %:#{#req.ten}%)
                AND (ctsp.mau_sac_id IN (:#{#req.listIdMauSac}))
                AND ( sp.id_loai IN (:#{#req.listIdPhanLoai}))
                AND ( sp.id_thuong_hieu IN (:#{#req.listIdThuongHieu}))
                GROUP BY
                    sp.id_san_pham,
                    sp.ma_san_pham,
                    sp.ten_san_pham,
                    ha.url_anh,
                    th.ten_thuong_hieu,
                    sp.mo_ta,
                    l.ten_loai,
                    lm.countLuotMua,
                    sp.ngay_tao
            HAVING 
                (:#{#req.giaBatDau} IS NULL OR MAX(ctsp.don_gia) >= :#{#req.giaBatDau})
                AND (:#{#req.giaKetThuc} IS NULL OR MAX(ctsp.don_gia) <= :#{#req.giaKetThuc}) 
            """)
    Page<HomeQuangBaRespose> getSanPhamQuangBa(@Param("req") HomeQuangBaRequest req, Pageable pageable);

    @Query(value = """
                        SELECT
                            SUM(hdct.so_luong) AS countLuotMua
                        FROM hoa_don_chi_tiet hdct
                        JOIN chi_tiet_san_pham ctsp ON hdct.chi_tiet_san_pham_id = ctsp.id_chi_tiet_san_pham
                        JOIN hoa_don hd on hdct.hoa_don_id = hd.id_hoa_don
                        where hd.trang_thai = 10 and ctsp.san_pham_id = :idSp
            """, nativeQuery = true)
    Long getSoLuongDaBa(@Param("idSp") UUID idSp);

    @Query(value = """
            WITH luotMua AS (
                SELECT
                    SUM(hdct.so_luong) AS countLuotMua,
                    ctsp.san_pham_id 
                FROM hoa_don_chi_tiet hdct
                JOIN chi_tiet_san_pham ctsp ON hdct.chi_tiet_san_pham_id = ctsp.id_chi_tiet_san_pham
                JOIN hoa_don hd on hdct.hoa_don_id = hd.id_hoa_don
                where hd.trang_thai = 10
                GROUP BY
                    ctsp.san_pham_id
            )
            SELECT
                sp.id_san_pham AS idSanPham,
                sp.ma_san_pham AS maSanPham,
                sp.ten_san_pham AS tenSanPham,
                ha.url_anh AS hinhAnh,
                l.ten_loai AS loai,
                th.ten_thuong_hieu AS thuongHieu,
                sp.mo_ta AS moTa,
                MAX(ctsp.don_gia) AS donGia,
                30 as sale,
                COALESCE(lm.countLuotMua, 0) as luotMua
            FROM
                san_pham sp
            JOIN
                chi_tiet_san_pham ctsp ON sp.id_san_pham = ctsp.san_pham_id
            LEFT JOIN
                luotMua lm ON lm.san_pham_id = sp.id_san_pham
            JOIN
                hinh_anh ha ON sp.id_hinh_anh = ha.id_hinh_anh
            JOIN
                loai l ON l.id_loai = sp.id_loai
            JOIN
                thuong_hieu th ON th.id_thuong_hieu = sp.id_thuong_hieu
            WHERE 
                sp.trang_thai = 1
            GROUP BY
                sp.id_san_pham,
                sp.ma_san_pham,
                sp.ten_san_pham,
                ha.url_anh,
                th.ten_thuong_hieu,
                sp.mo_ta,
                l.ten_loai,
                lm.countLuotMua,
                sp.ngay_tao
            ORDER BY sp.ngay_tao DESC
            """, nativeQuery = true, countQuery = """
            WITH luotMua AS (
                SELECT
                    COUNT(hdct.id_hoa_don_chi_tiet) AS countLuotMua,
                    ctsp.san_pham_id 
                FROM hoa_don_chi_tiet hdct
                JOIN chi_tiet_san_pham ctsp ON hdct.chi_tiet_san_pham_id = ctsp.id_chi_tiet_san_pham
                JOIN hoa_don hd on hdct.hoa_don_id = hd.id_hoa_don
                where hd.trang_thai = 10
                GROUP BY
                    ctsp.san_pham_id
            )
            SELECT
                COUNT(sp.id_san_pham)
            FROM
                san_pham sp
            JOIN
                chi_tiet_san_pham ctsp ON sp.id_san_pham = ctsp.san_pham_id
            LEFT JOIN
                luotMua lm ON lm.san_pham_id = sp.id_san_pham
            JOIN
                hinh_anh ha ON sp.id_hinh_anh = ha.id_hinh_anh
            JOIN
                loai l ON l.id_loai = sp.id_loai
            JOIN
                thuong_hieu th ON th.id_thuong_hieu = sp.id_thuong_hieu
            WHERE 
                sp.trang_thai = 1
            """)
    Page<HomeQuangBaRespose> getAllSanPhamQuangBa(Pageable pageable);

}
