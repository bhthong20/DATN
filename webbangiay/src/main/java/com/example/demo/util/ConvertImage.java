package com.example.demo.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.UUID;

@Service
public class ConvertImage {

    public String convertImageFromBase64(String base64) {
        String file = base64;
        if (file == null || file.isEmpty()) {
            return "Please select a file to upload.";
        }

        String destinationDirectory = "src/main/webapp/uploads/";

        try {
            byte[] decodedBytes = Base64.getDecoder().decode(file);

            String uniqueFileName = UUID.randomUUID().toString() + ".jpg";

            Path filePath = Paths.get(destinationDirectory, uniqueFileName);

            Files.write(filePath, decodedBytes);

            return uniqueFileName;
        } catch (IOException e) {
            return ("Error saving file: " + e.getMessage());
        }
    }
}
