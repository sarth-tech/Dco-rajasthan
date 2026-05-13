package com.census.rajasthan.controller;

import com.census.rajasthan.dto.ApiResponse;
import com.census.rajasthan.model.Notice;
import com.census.rajasthan.service.NoticeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * REST Controller — Notices API
 * Base URL : /api/notices
 */
@RestController
@RequestMapping("/api/notices")
public class NoticeApiController {

    private final NoticeService noticeService;

    public NoticeApiController(NoticeService noticeService) {
        this.noticeService = noticeService;
    }

    /** GET /api/notices — All notices (sorted latest first) */
    @GetMapping
    public ResponseEntity<ApiResponse<List<Notice>>> getAll() {
        return ResponseEntity.ok(ApiResponse.ok(noticeService.getAllNotices()));
    }

    /** GET /api/notices/{id} */
    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<Notice>> getById(@PathVariable Integer id) {
        return ResponseEntity.ok(ApiResponse.ok(noticeService.getNoticeById(id)));
    }

    /** GET /api/notices/category/{category} — e.g. NEWS, NOTICE, CIRCULAR */
    @GetMapping("/category/{category}")
    public ResponseEntity<ApiResponse<List<Notice>>> getByCategory(
            @PathVariable String category) {
        return ResponseEntity.ok(ApiResponse.ok(noticeService.getNoticesByCategory(category)));
    }

    /** GET /api/notices/latest?limit=5 */
    @GetMapping("/latest")
    public ResponseEntity<ApiResponse<List<Notice>>> getLatest(
            @RequestParam(defaultValue = "5") int limit) {
        return ResponseEntity.ok(ApiResponse.ok(noticeService.getLatestNotices(limit)));
    }
}
