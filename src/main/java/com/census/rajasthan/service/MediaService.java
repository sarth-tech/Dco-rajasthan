package com.census.rajasthan.service;

import com.census.rajasthan.model.MediaFile;
import com.census.rajasthan.repository.MediaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.*;
import java.util.List;
import java.util.UUID;

@Service
public class MediaService {

    @Autowired
    private MediaRepository mediaRepository;

    private final String UPLOAD_DIR = "uploads/media/";

    public MediaFile saveFile(
            MultipartFile file,
            String description,
            String uploadedBy)
            throws IOException {

        // create folder if not exists
        Path uploadPath =
                Paths.get(UPLOAD_DIR);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // original file name
        String originalFileName =
                file.getOriginalFilename();

        // extension
        String fileExtension =
                getFileExtension(
                        originalFileName
                );

        // unique file name
        String uniqueFileName =
                UUID.randomUUID()
                + "." +
                fileExtension;

        // mime + type
        String mimeType =
                file.getContentType();

        String fileType =
                determineFileType(
                        mimeType
                );

        // save file
        Path savedPath =
                uploadPath.resolve(
                        uniqueFileName
                );

        Files.copy(
                file.getInputStream(),
                savedPath,
                StandardCopyOption.REPLACE_EXISTING
        );

        // save entity
        MediaFile mediaFile =
                new MediaFile(

                uniqueFileName,

                originalFileName,

                "/media/files/"
                        + uniqueFileName,

                fileType,

                mimeType,

                file.getSize(),

                description,

                "General",

                uploadedBy
        );

        return mediaRepository
                .save(mediaFile);
    }

    public List<MediaFile> getMediaByCategory(
            String category) {

        return mediaRepository
                .findByCategory(category);
    }

    public List<MediaFile> getAllMedia() {

        return mediaRepository
                .findAllByOrderByUploadDateDesc();
    }

    public List<MediaFile> getImages() {

        return mediaRepository
                .findByFileTypeOrderByUploadDateDesc(
                        "image"
                );
    }

    public List<MediaFile> getVideos() {

        return mediaRepository
                .findByFileTypeOrderByUploadDateDesc(
                        "video"
                );
    }

    public MediaFile getMediaById(
            Long id) {

        return mediaRepository
                .findById(id)
                .orElse(null);
    }

    public void deleteMedia(
            Long id) {

        MediaFile mediaFile =
                getMediaById(id);

        if (mediaFile != null) {

            try {

                Path filePath =
                        Paths.get(
                                UPLOAD_DIR
                                + mediaFile.getFileName()
                        );

                Files.deleteIfExists(
                        filePath
                );

            } catch (IOException e) {

                System.err.println(
                        e.getMessage()
                );
            }

            mediaRepository
                    .deleteById(id);
        }
    }

    public List<MediaFile> searchMedia(
            String keyword) {

        return mediaRepository
                .findByDescriptionContaining(
                        keyword
                );
    }

    private String getFileExtension(
            String fileName) {

        if (fileName != null
                && fileName.contains(".")) {

            return fileName.substring(
                    fileName.lastIndexOf(".")
                            + 1
            );
        }

        return "";
    }

    private String determineFileType(
            String mimeType) {

        if (mimeType != null) {

            if (mimeType.startsWith(
                    "image/")) {

                return "image";
            }

            else if (mimeType.startsWith(
                    "video/")) {

                return "video";
            }
        }

        return "unknown";
    }
}