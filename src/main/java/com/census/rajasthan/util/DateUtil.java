package com.census.rajasthan.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

/**
 * Utility — Date formatting helpers for views and APIs
 */
public final class DateUtil {

    private DateUtil() { /* no instances */ }

    private static final DateTimeFormatter HINDI_FMT =
            DateTimeFormatter.ofPattern("d MMMM yyyy", new Locale("hi", "IN"));

    private static final DateTimeFormatter ENGLISH_FMT =
            DateTimeFormatter.ofPattern("dd MMM yyyy", Locale.ENGLISH);

    /** Returns "15 मार्च 2026" style */
    public static String toHindi(LocalDate date) {
        return date != null ? date.format(HINDI_FMT) : "";
    }

    /** Returns "15 Mar 2026" style */
    public static String toEnglish(LocalDate date) {
        return date != null ? date.format(ENGLISH_FMT) : "";
    }

    /** Returns true if date is within the last 30 days */
    public static boolean isRecent(LocalDate date) {
        return date != null && date.isAfter(LocalDate.now().minusDays(30));
    }
}
