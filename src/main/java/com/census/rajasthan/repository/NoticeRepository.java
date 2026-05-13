package com.census.rajasthan.repository;

import com.census.rajasthan.model.Notice;
import com.census.rajasthan.model.Notice.NoticeCategory;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Repository — Notices, Circulars, News
 */
@Repository
public class NoticeRepository {

    private final List<Notice> store = new ArrayList<>();

    public NoticeRepository() {
        initData();
    }

    public List<Notice> findAll() {
        return store.stream()
                .sorted(Comparator.comparing(Notice::getPublishDate).reversed())
                .collect(Collectors.toList());
    }

    public Optional<Notice> findById(Integer id) {
        return store.stream().filter(n -> n.getId().equals(id)).findFirst();
    }

    public List<Notice> findByCategory(NoticeCategory category) {
        return store.stream()
                .filter(n -> n.getCategory() == category)
                .sorted(Comparator.comparing(Notice::getPublishDate).reversed())
                .collect(Collectors.toList());
    }

    public List<Notice> findLatest(int limit) {
        return store.stream()
                .sorted(Comparator.comparing(Notice::getPublishDate).reversed())
                .limit(limit)
                .collect(Collectors.toList());
    }

    public long count() { return store.size(); }

    private void initData() {
        store.add(Notice.builder().id(1)
                .titleHindi("जनगणना 2027 हेतु मकान सूचीकरण कार्य प्रारंभ — राजस्थान")
                .titleEnglish("House Listing for Census 2027 commenced in Rajasthan")
                .publishDate(LocalDate.of(2026, 4, 1))
                .category(NoticeCategory.NEWS)
                .department("Census Directorate, Rajasthan")
                .fileType("PDF").fileSize("1.2 MB").newNotice(true)
                .documentUrl("/documents/house-listing-2027.pdf").build());

        store.add(Notice.builder().id(2)
                .titleHindi("जनगणना 2027 — प्रगणकों की भर्ती हेतु अधिसूचना")
                .titleEnglish("Recruitment Notification for Census 2027 Enumerators")
                .publishDate(LocalDate.of(2026, 3, 15))
                .category(NoticeCategory.NOTICE)
                .department("Census Directorate, Rajasthan")
                .fileType("PDF").fileSize("850 KB").newNotice(true)
                .documentUrl("/documents/enumerator-recruitment-2027.pdf").build());

        store.add(Notice.builder().id(3)
                .titleHindi("ई-जनगणना मोबाइल ऐप का शुभारंभ")
                .titleEnglish("Launch of e-Census Mobile Application")
                .publishDate(LocalDate.of(2026, 3, 10))
                .category(NoticeCategory.CIRCULAR)
                .department("NIC / Census Directorate")
                .fileType("PDF").fileSize("500 KB").newNotice(true)
                .documentUrl("/documents/ecensus-app-launch.pdf").build());

        store.add(Notice.builder().id(4)
                .titleHindi("NPR अद्यतन कार्य — जिला प्रशिक्षण कार्यक्रम")
                .titleEnglish("NPR Updation Work - District Training Programme")
                .publishDate(LocalDate.of(2026, 3, 5))
                .category(NoticeCategory.CIRCULAR)
                .department("Census Directorate, Rajasthan")
                .fileType("PDF").fileSize("2.1 MB").newNotice(false)
                .documentUrl("/documents/npr-training-2026.pdf").build());

        store.add(Notice.builder().id(5)
                .titleHindi("जनगणना 2011 — अंतिम जनसंख्या आँकड़े (जिलावार)")
                .titleEnglish("Census 2011 - Final Population Data (District-wise)")
                .publishDate(LocalDate.of(2026, 2, 15))
                .category(NoticeCategory.NOTICE)
                .department("Census Directorate, Rajasthan")
                .fileType("Excel").fileSize("3.4 MB").newNotice(false)
                .documentUrl("/documents/census-2011-district-data.xlsx").build());

        store.add(Notice.builder().id(6)
                .titleHindi("गृह सूचीकरण एवं मकान गणना — प्रशिक्षण सामग्री")
                .titleEnglish("House Listing and Housing Census - Training Material")
                .publishDate(LocalDate.of(2026, 2, 1))
                .category(NoticeCategory.NOTICE)
                .department("Census Directorate, Rajasthan")
                .fileType("PDF").fileSize("4.8 MB").newNotice(false)
                .documentUrl("/documents/training-material-house-listing.pdf").build());
    }
}
