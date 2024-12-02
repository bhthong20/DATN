//package com.example.demo.models;
//
//import jakarta.persistence.Column;
//import jakarta.persistence.Entity;
//import jakarta.persistence.GeneratedValue;
//import jakarta.persistence.GenerationType;
//import jakarta.persistence.Id;
//import jakarta.persistence.Table;
//import jakarta.validation.constraints.NotBlank;
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;
//import org.hibernate.annotations.CreationTimestamp;
//
//import java.sql.Date;
//import java.util.UUID;
//
//@AllArgsConstructor
//@NoArgsConstructor
//@ToString
//@Getter
//@Setter
//@Entity
//@Table(name = "chat_lieu")
//public class ChatLieu {
//    @Id
//    @GeneratedValue(strategy = GenerationType.UUID)
//    @Column(name = "id_chat_lieu")
//    private UUID id;
//
//    @Column(name = "ma")
//    private String ma;
//
//    @NotBlank(message = "Không để trống thông tin")
//    @Column(name = "ten_chat_lieu")
//    private String tenChatLieu;
//
//    @CreationTimestamp
//    @Column(name = "ngay_tao")
//    private Date ngayTao;
//
//
//    @Column(name = "ngay_cap_nhat")
//    private Date ngayCapNhat;
//
//
//    @Column(name = "trang_thai")
//    private int trangThai;
//
//    @NotBlank(message = "Không để trống thông tin")
//    @Column(name = "mo_ta")
//    private String moTa;
//}
