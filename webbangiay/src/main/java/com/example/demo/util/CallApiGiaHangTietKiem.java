package com.example.demo.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class CallApiGiaHangTietKiem {

    public Map<String, Object> getPhiGiaoHang(String province, String district) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            String apiUrl = "https://services.giaohangtietkiem.vn/services/shipment/fee?pick_province=Thành phố Hà Nội&pick_district=Quận Từ Liêm&province=" + province + "&district=" + district + "&address=P.503 tòa nhà Auu Việt, số 1 Lê Đức Thọ&weight=1000&transport=road&deliver_option=none";
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Token", "8b3517821b6b32db7571dd0dd0af734180384757");
            Map<String, String> requestBody = new HashMap<>();
            HttpEntity<Map<String, String>> httpEntity = new HttpEntity<>(requestBody, headers);
            ResponseEntity<Map<String, Object>> responseEntity =
                    restTemplate.exchange(apiUrl, HttpMethod.GET, httpEntity,
                            new ParameterizedTypeReference<>() {
                            });
            return responseEntity.getBody();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
