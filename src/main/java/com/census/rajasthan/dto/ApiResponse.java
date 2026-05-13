package com.census.rajasthan.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

/**
 * DTO — Standard API Response Wrapper
 * All REST endpoints return this so clients always get a consistent JSON shape.
 *   Success: { "success":true,  "data":{...}, "message":"OK" }
 *   Error:   { "success":false, "data":null,  "message":"Error detail" }
 */
@Data @Builder @NoArgsConstructor @AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> {
    private boolean success;
    private String message;
    private T data;
    private LocalDateTime timestamp;
    private Integer statusCode;

    public static <T> ApiResponse<T> ok(T data) {
        return ApiResponse.<T>builder().success(true).message("Success")
                .data(data).statusCode(200).timestamp(LocalDateTime.now()).build();
    }
    public static <T> ApiResponse<T> ok(T data, String message) {
        return ApiResponse.<T>builder().success(true).message(message)
                .data(data).statusCode(200).timestamp(LocalDateTime.now()).build();
    }
    public static <T> ApiResponse<T> error(String message, int statusCode) {
        return ApiResponse.<T>builder().success(false).message(message)
                .statusCode(statusCode).timestamp(LocalDateTime.now()).build();
    }
    public static <T> ApiResponse<T> created(T data) {
        return ApiResponse.<T>builder().success(true).message("Created successfully")
                .data(data).statusCode(201).timestamp(LocalDateTime.now()).build();
    }
}
