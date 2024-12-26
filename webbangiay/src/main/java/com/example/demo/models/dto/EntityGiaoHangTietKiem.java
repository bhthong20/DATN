package com.example.demo.models.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class EntityGiaoHangTietKiem {
    private boolean success;
    private String message;
    private Fee fee;
}

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
class Fee {
    private String name;
    private Long fee;
}
