package com.census.rajasthan.repository;

import com.census.rajasthan.model.MediaFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MediaRepository extends JpaRepository<MediaFile, Long> {

    List<MediaFile> findByFileTypeOrderByUploadDateDesc(String fileType);

    List<MediaFile> findAllByOrderByUploadDateDesc();

    List<MediaFile> findByFileNameContaining(String keyword);
    List<MediaFile> findByCategory(String category);

    @Query("SELECT m FROM MediaFile m WHERE m.fileType = :fileType ORDER BY m.uploadDate DESC")
    List<MediaFile> findImagesByType(@Param("fileType") String fileType);

    @Query("SELECT m FROM MediaFile m WHERE LOWER(m.description) LIKE LOWER(CONCAT('%', :keyword, '%')) ORDER BY m.uploadDate DESC")
    List<MediaFile> findByDescriptionContaining(@Param("keyword") String keyword);
}
