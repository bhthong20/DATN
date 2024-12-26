package com.example.demo.models.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ThongKeTongDto {

    private Long soLuongBan;
    private Long tongDoanhSo;
    private Long tongTaiQuay;
    private Long tongOnline;
}
