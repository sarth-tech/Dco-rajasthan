package com.census.rajasthan.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * Model — Contact Form Submission
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ContactMessage {

    private Long id;

    @NotBlank(message = "Name is required / नाम आवश्यक है")
    @Size(min = 2, max = 100)
    private String fullName;

    @NotBlank(message = "Email is required")
    @Email(message = "Please enter a valid email")
    private String email;

    @Size(max = 15, message = "Phone number too long")
    private String phone;

    @NotBlank(message = "Subject is required")
    private String subject;

    @NotBlank(message = "Message is required")
    @Size(min = 10, max = 1000, message = "Message must be 10–1000 characters")
    private String message;

    private LocalDateTime submittedAt;
    private String status;  // "RECEIVED", "IN_PROGRESS", "RESOLVED"
}
