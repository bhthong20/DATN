package com.example.demo.models.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
public class LineChartDto {
    private UUID id;
    private String name;
    private List<Long> data;

    public LineChartDto() {
        data = new ArrayList<>();
    }
}
