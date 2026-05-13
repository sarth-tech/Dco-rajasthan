package com.census.rajasthan.dto;

import jakarta.validation.constraints.*;
import lombok.Data;

/**
 * DTO — Incoming contact form request body
 */
@Data
public class ContactRequest {

    @NotBlank(message = "Name is required")
    @Size(min = 2, max = 100, message = "Name must be 2–100 characters")
    private String fullName;

    @NotBlank(message = "Email is required")
    @Email(message = "Enter a valid email address")
    private String email;

    @Pattern(regexp = "^[0-9+\\-\\s]{7,15}$", message = "Invalid phone number")
    private String phone;

    @NotBlank(message = "Subject is required")
    private String subject;

    @NotBlank(message = "Message is required")
    @Size(min = 10, max = 1000, message = "Message must be 10–1000 characters")
    private String message;
}
