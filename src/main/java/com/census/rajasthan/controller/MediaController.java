package com.census.rajasthan.controller;

import com.census.rajasthan.model.MediaFile;
import com.census.rajasthan.service.MediaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/media")
public class MediaController {

    @Autowired
    private MediaService mediaService;

    @GetMapping("")
    public String mediaGallery(Model model) {
        List<MediaFile> allMedia = mediaService.getAllMedia();
        List<MediaFile> images = mediaService.getImages();
        List<MediaFile> videos = mediaService.getVideos();

        model.addAttribute("allMedia", allMedia);
        model.addAttribute("images", images);
        model.addAttribute("videos", videos);
        model.addAttribute("totalCount", allMedia.size());
        model.addAttribute("imageCount", images.size());
        model.addAttribute("videoCount", videos.size());

        return "media";
    }

    @GetMapping("/test")
    public String test(Model model) {
        model.addAttribute("message", "Media controller is working!");
        return "test";
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file,
                           @RequestParam(value = "description", required = false) String description,
                           RedirectAttributes redirectAttributes) {
        try {
            if (file.isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Please select a file to upload");
                return "redirect:/media/upload";
            }

            // Validate file type
            String contentType = file.getContentType();
            if (contentType == null ||
                (!contentType.startsWith("image/") && !contentType.startsWith("video/"))) {
                redirectAttributes.addFlashAttribute("error", "Only image and video files are allowed");
                return "redirect:/media/upload";
            }

            // Validate file size (50MB limit)
            if (file.getSize() > 50 * 1024 * 1024) {
                redirectAttributes.addFlashAttribute("error", "File size must be less than 50MB");
                return "redirect:/media/upload";
            }

            MediaFile savedFile = mediaService.saveFile(file, description, "Admin");
            redirectAttributes.addFlashAttribute("success",
                "File uploaded successfully: " + savedFile.getOriginalFileName());

        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("error", "Failed to upload file: " + e.getMessage());
        }

        return "redirect:/media";
    }

    @GetMapping("/files/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
        try {
            Path filePath = Paths.get("uploads/media/").resolve(filename);
            Resource resource = new UrlResource(filePath.toUri());

            if (resource.exists() || resource.isReadable()) {
                // Determine content type
                String contentType = determineContentType(filename);

                return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(contentType))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + filename + "\"")
                    .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (MalformedURLException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping("/delete/{id}")
    public String deleteMedia(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            MediaFile mediaFile = mediaService.getMediaById(id);
            if (mediaFile != null) {
                mediaService.deleteMedia(id);
                redirectAttributes.addFlashAttribute("success",
                    "File deleted successfully: " + mediaFile.getOriginalFileName());
            } else {
                redirectAttributes.addFlashAttribute("error", "File not found");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to delete file: " + e.getMessage());
        }

        return "redirect:/media";
    }

    @GetMapping("/images")
    public String imageGallery(Model model) {
        List<MediaFile> images = mediaService.getImages();
        model.addAttribute("images", images);
        model.addAttribute("title", "Image Gallery");
        return "media-images";
    }

    @GetMapping("/videos")
    public String videoGallery(Model model) {
        List<MediaFile> videos = mediaService.getVideos();
        model.addAttribute("videos", videos);
        model.addAttribute("title", "Video Gallery");
        return "media-videos";
    }

    @PostMapping("/search")
    public String searchMedia(@RequestParam("keyword") String keyword, Model model) {
        List<MediaFile> searchResults = mediaService.searchMedia(keyword);
        model.addAttribute("searchResults", searchResults);
        model.addAttribute("keyword", keyword);
        model.addAttribute("resultCount", searchResults.size());
        return "media-search";
    }

    private String determineContentType(String filename) {
        String extension = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();

        switch (extension) {
            case "jpg":
            case "jpeg":
                return "image/jpeg";
            case "png":
                return "image/png";
            case "gif":
                return "image/gif";
            case "webp":
                return "image/webp";
            case "mp4":
                return "video/mp4";
            case "avi":
                return "video/x-msvideo";
            case "mov":
                return "video/quicktime";
            case "wmv":
                return "video/x-ms-wmv";
            default:
                return "application/octet-stream";
        }
    }
}
