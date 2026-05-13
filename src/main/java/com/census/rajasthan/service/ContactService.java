package com.census.rajasthan.service;

import com.census.rajasthan.dto.ContactRequest;
import com.census.rajasthan.model.ContactMessage;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Service — Contact Form Submissions
 *
 * Currently stores in memory. To persist to a database,
 * add a JPA repository and call save() here.
 */
@Service
public class ContactService {

    // In-memory store (replace with JPA repo for persistence)
    private final List<ContactMessage> inbox = new ArrayList<>();
    private long idCounter = 1;

    public ContactMessage saveMessage(ContactRequest request) {
        ContactMessage msg = ContactMessage.builder()
                .id(idCounter++)
                .fullName(request.getFullName())
                .email(request.getEmail())
                .phone(request.getPhone())
                .subject(request.getSubject())
                .message(request.getMessage())
                .submittedAt(LocalDateTime.now())
                .status("RECEIVED")
                .build();

        inbox.add(msg);

        //  
        System.out.println("[ContactService] New message from: " + msg.getEmail());

        return msg;
    }

    public List<ContactMessage> getAllMessages() {
        return Collections.unmodifiableList(inbox);
    }

    public long getCount() {
        return inbox.size();
    }
}
