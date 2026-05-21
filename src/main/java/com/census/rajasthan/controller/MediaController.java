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
    public String mediaGallery(Model model){

        List<MediaFile> allMedia=
                mediaService.getAllMedia();

        List<MediaFile> images=
                mediaService.getImages();

        List<MediaFile> videos=
                mediaService.getVideos();

        model.addAttribute(
                "allMedia",
                allMedia
        );

        model.addAttribute(
                "images",
                images
        );

        model.addAttribute(
                "videos",
                videos
        );

        model.addAttribute(
                "totalCount",
                allMedia.size()
        );

        model.addAttribute(
                "imageCount",
                images.size()
        );

        model.addAttribute(
                "videoCount",
                videos.size()
        );

        return "media";
    }

    @GetMapping("/admin/media")
    public String adminMedia(){

        return "admin_media";
    }

    @PostMapping("/upload")
    public String uploadFile(

            @RequestParam("file")
            MultipartFile file,

            @RequestParam(
                    value="description",
                    required=false
            )
            String description,

            @RequestParam(
                    value="category",
                    defaultValue="General"
            )
            String category,

            RedirectAttributes redirectAttributes){

        try{

            if(file.isEmpty()){

                redirectAttributes
                        .addFlashAttribute(
                                "error",
                                "Select file first"
                        );

                return
                        "redirect:/media/admin/media";
            }

            String contentType=
                    file.getContentType();

            if(contentType==null ||

                    (!contentType.startsWith("image/")
                    &&

                    !contentType.startsWith("video/"))){

                redirectAttributes
                        .addFlashAttribute(
                                "error",
                                "Only image/video allowed"
                        );

                return
                        "redirect:/media/admin/media";
            }

            if(file.getSize() >
                    50*1024*1024){

                redirectAttributes
                        .addFlashAttribute(
                                "error",
                                "Maximum 50MB"
                        );

                return
                        "redirect:/media/admin/media";
            }

            MediaFile savedFile=

                    mediaService.saveFile(
                            file,
                            description,
                            "Admin"
                    );

            savedFile.setCategory(
                    category
            );

            redirectAttributes
                    .addFlashAttribute(
                            "success",
                            "Uploaded : "
                            +
                            savedFile.getOriginalFileName()
                    );

        }

        catch(IOException e){

            redirectAttributes
                    .addFlashAttribute(
                            "error",
                            e.getMessage()
                    );
        }

        return "redirect:/media";
    }

    @GetMapping("/files/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource>
    serveFile(
            @PathVariable
            String filename){

        try{

            Path filePath=

                    Paths.get(
                            "uploads/media/"
                    )
                    .resolve(
                            filename
                    );

            Resource resource=

                    new UrlResource(
                            filePath.toUri()
                    );

            if(resource.exists()
                    ||
                    resource.isReadable()){

                return ResponseEntity.ok()

                        .contentType(
                                MediaType.parseMediaType(
                                        determineContentType(
                                                filename
                                        )
                                )
                        )

                        .header(
                                HttpHeaders.CONTENT_DISPOSITION,

                                "inline; filename=\""
                                        +filename+
                                        "\""
                        )

                        .body(resource);
            }

            return
                    ResponseEntity
                            .notFound()
                            .build();

        }

        catch(MalformedURLException e){

            return ResponseEntity
                    .badRequest()
                    .build();
        }
    }

    @GetMapping("/category/{name}")
    public String category(

            @PathVariable
            String name,

            Model model){

        List<MediaFile> media=

                mediaService
                        .getMediaByCategory(
                                name
                        );

        model.addAttribute(
                "allMedia",
                media
        );

        return "media";
    }

    private String determineContentType(
            String filename){

        String extension=

                filename.substring(
                        filename.lastIndexOf(".")+1
                )
                .toLowerCase();

        switch(extension){

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

            default:
                return "application/octet-stream";
        }

    }
}