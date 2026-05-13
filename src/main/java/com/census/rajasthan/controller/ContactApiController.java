package com.census.rajasthan.controller;

import com.census.rajasthan.dto.ApiResponse;
import com.census.rajasthan.dto.ContactRequest;
import com.census.rajasthan.model.ContactMessage;
import com.census.rajasthan.service.ContactService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * REST Controller — Contact Form API
 * Base URL : /api/contact
 */
@RestController
@RequestMapping("/api/contact")
public class ContactApiController {

    private final ContactService contactService;

    public ContactApiController(ContactService contactService) {
        this.contactService = contactService;
    }

    /**
     * POST /api/contact
     * Accepts a contact form submission.
     * @Valid triggers validation defined on ContactRequest fields.
     */
    @PostMapping
    public ResponseEntity<ApiResponse<ContactMessage>> submitMessage(
            @Valid @RequestBody ContactRequest request) {

        ContactMessage saved = contactService.saveMessage(request);
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.created(saved));
    }
}
