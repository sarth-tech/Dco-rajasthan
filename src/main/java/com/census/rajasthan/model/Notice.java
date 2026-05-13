package com.census.rajasthan.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * Model — Official Notice / News / Circular
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Notice {

    private Integer id;
    private String titleHindi;
    private String titleEnglish;
    private LocalDate publishDate;
    private NoticeCategory category;
    private String documentUrl;
    private boolean newNotice;         // shown as "NEW" badge if published within 30 days
    private String department;         // issuing department
    private String fileSize;           // e.g. "2.4 MB"
    private String fileType;           // e.g. "PDF"

    public enum NoticeCategory {
        NEWS, NOTICE, CIRCULAR, ORDER, TENDER
    }
}
