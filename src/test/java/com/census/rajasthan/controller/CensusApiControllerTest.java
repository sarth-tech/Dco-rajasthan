package com.census.rajasthan.controller;

import com.census.rajasthan.service.CensusService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(CensusApiController.class)
@DisplayName("CensusApiController Integration Tests")
class CensusApiControllerTest {

    @Autowired MockMvc mockMvc;
    @MockitoBean  CensusService censusService;

    @Test
    @DisplayName("GET /api/census/districts returns 200 with JSON")
    void getDistricts_returns200() throws Exception {
        when(censusService.getAllDistricts()).thenReturn(List.of());
        mockMvc.perform(get("/api/census/districts"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data").isArray());
    }

    @Test
    @DisplayName("GET /api/census/summary returns 200")
    void getSummary_returns200() throws Exception {
        when(censusService.getStateSummary()).thenReturn(null);
        mockMvc.perform(get("/api/census/summary"))
                .andExpect(status().isOk());
    }
}
