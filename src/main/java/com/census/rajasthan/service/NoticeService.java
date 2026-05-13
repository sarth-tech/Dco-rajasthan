package com.census.rajasthan.service;

import com.census.rajasthan.exception.ResourceNotFoundException;
import com.census.rajasthan.model.Notice;
import com.census.rajasthan.model.Notice.NoticeCategory;
import com.census.rajasthan.repository.NoticeRepository;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service — Notice / News / Circular Business Logic
 */
@Service
public class NoticeService {

    private final NoticeRepository repository;

    public NoticeService(NoticeRepository repository) {
        this.repository = repository;
    }

    public List<Notice> getAllNotices() {
        return repository.findAll();
    }

    public Notice getNoticeById(Integer id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Notice", "id", id));
    }

    public List<Notice> getNoticesByCategory(String category) {
        try {
            NoticeCategory cat = NoticeCategory.valueOf(category.toUpperCase());
            return repository.findByCategory(cat);
        } catch (IllegalArgumentException ex) {
            throw new ResourceNotFoundException("Category", "name", category);
        }
    }

    public List<Notice> getLatestNotices(int limit) {
        int safeLimit = (limit > 0 && limit <= 20) ? limit : 5;
        return repository.findLatest(safeLimit);
    }

    public long getTotalCount() {
        return repository.count();
    }
}
