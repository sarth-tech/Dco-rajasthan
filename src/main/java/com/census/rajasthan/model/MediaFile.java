package com.census.rajasthan.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "media_files")
public class MediaFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable=false)
    private String fileName;

    @Column(nullable=false)
    private String originalFileName;

    @Column(nullable=false)
    private String filePath;

    @Column(nullable=false)
    private String fileType;

    @Column(nullable=false)
    private String mimeType;

    @Column(nullable=false)
    private Long fileSize;

    @Column(length=500)
    private String description;

    @Column(nullable=false)
    private String category;

    @Column(nullable=false)
    private LocalDateTime uploadDate;

    @Column(nullable=false)
    private String uploadedBy;


    // REQUIRED by Hibernate
    public MediaFile() {

    }


    public MediaFile(
            String fileName,
            String originalFileName,
            String filePath,
            String fileType,
            String mimeType,
            Long fileSize,
            String description,
            String category,
            String uploadedBy
    ) {

        this.fileName=fileName;

        this.originalFileName=
                originalFileName;

        this.filePath=
                filePath;

        this.fileType=
                fileType;

        this.mimeType=
                mimeType;

        this.fileSize=
                fileSize;

        this.description=
                description;

        this.category=
                category;

        this.uploadedBy=
                uploadedBy;

        this.uploadDate=
                LocalDateTime.now();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id=id;
    }


    public String getFileName() {
        return fileName;
    }

    public void setFileName(
            String fileName) {

        this.fileName=fileName;
    }


    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(
            String originalFileName) {

        this.originalFileName=
                originalFileName;
    }


    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(
            String filePath) {

        this.filePath=
                filePath;
    }


    public String getFileType() {
        return fileType;
    }

    public void setFileType(
            String fileType) {

        this.fileType=fileType;
    }


    public String getMimeType() {
        return mimeType;
    }

    public void setMimeType(
            String mimeType) {

        this.mimeType=mimeType;
    }


    public Long getFileSize() {
        return fileSize;
    }

    public void setFileSize(
            Long fileSize) {

        this.fileSize=fileSize;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(
            String description) {

        this.description=
                description;
    }


    public String getCategory() {
        return category;
    }

    public void setCategory(
            String category) {

        this.category=
                category;
    }


    public LocalDateTime getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(
            LocalDateTime uploadDate) {

        this.uploadDate=
                uploadDate;
    }


    public String getUploadedBy() {
        return uploadedBy;
    }

    public void setUploadedBy(
            String uploadedBy) {

        this.uploadedBy=
                uploadedBy;
    }

}