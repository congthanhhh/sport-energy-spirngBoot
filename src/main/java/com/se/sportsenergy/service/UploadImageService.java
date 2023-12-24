package com.se.sportsenergy.service;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Service
public class UploadImageService {

    public void saveImage(MultipartFile img, String uploadPath) {
        try {
            if (img != null && !img.isEmpty()) {
                File uploadDirectory = new File(uploadPath);
                if (!uploadDirectory.exists()) {
                    uploadDirectory.mkdirs();
                }

                File saveFile = new File(uploadDirectory, img.getOriginalFilename());
                Path filePath = Paths.get(saveFile.getAbsolutePath());
                Files.copy(img.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
//    public void saveImage(MultipartFile img, String path) {
//        try {
//            if (img != null) {
//                File saveFile = new File(path + img.getOriginalFilename());
//                if (!saveFile.exists()) {
//                    saveFile.mkdirs();
//                }
//                Path filePath = Paths.get(saveFile.getAbsolutePath());
////            System.out.println("This is path of img"+filePath);
//                Files.copy(img.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
//            }
//            // Không thực hiện hành động lưu ảnh nếu img là null
//        } catch (IOException e) {
//            throw new RuntimeException(e);
//        }
//    }
}



