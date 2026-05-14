package com.census.rajasthan.service;

import com.census.rajasthan.model.MediaFile;
import com.census.rajasthan.repository.MediaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

@Service
public class MediaService {

    @Autowired
    private MediaRepository mediaRepository;

    private final String UPLOAD_DIR = "uploads/media/";

    public MediaFile saveFile(MultipartFile file, String description, String uploadedBy) throws IOException {
        // Create upload directory if it doesn't exist
        Path uploadPath = Paths.get(UPLOAD_DIR);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Generate unique filename
        String originalFileName = file.getOriginalFilename();
        String fileExtension = getFileExtension(originalFileName);
        String uniqueFileName = UUID.randomUUID().toString() + "." + fileExtension;

        // Determine file type
        String fileType = determineFileType(file.getContentType());

        // Save file to disk
        Path filePath = uploadPath.resolve(uniqueFileName);
        Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

        // Create MediaFile entity
        MediaFile mediaFile = new MediaFile(
            uniqueFileName,
            originalFileName,
            UPLOAD_DIR + uniqueFileName,
            fileType,
            file.getContentType(),
            file.getSize(),
            description,
            uploadedBy
        );

        return mediaRepository.save(mediaFile);
    }

    public List<MediaFile> getAllMedia() {
        return mediaRepository.findAllByOrderByUploadDateDesc();
    }

    public List<MediaFile> getImages() {
        return mediaRepository.findByFileTypeOrderByUploadDateDesc("image");
    }

    public List<MediaFile> getVideos() {
        return mediaRepository.findByFileTypeOrderByUploadDateDesc("video");
    }

    public MediaFile getMediaById(Long id) {
        return mediaRepository.findById(id).orElse(null);
    }

    public void deleteMedia(Long id) {
        MediaFile mediaFile = getMediaById(id);
        if (mediaFile != null) {
            // Delete file from disk
            try {
                Path filePath = Paths.get(mediaFile.getFilePath());
                Files.deleteIfExists(filePath);
            } catch (IOException e) {
                // Log error but continue with database deletion
                System.err.println("Error deleting file: " + e.getMessage());
            }
            // Delete from database
            mediaRepository.deleteById(id);
        }
    }

    public List<MediaFile> searchMedia(String keyword) {
        return mediaRepository.findByDescriptionContaining(keyword);
    }

    private String getFileExtension(String fileName) {
        if (fileName != null && fileName.contains(".")) {
            return fileName.substring(fileName.lastIndexOf(".") + 1);
        }
        return "";
    }

    private String determineFileType(String mimeType) {
        if (mimeType != null) {
            if (mimeType.startsWith("image/")) {
                return "image";
            } else if (mimeType.startsWith("video/")) {
                return "video";
            }
        }
        return "unknown";
    }
}
