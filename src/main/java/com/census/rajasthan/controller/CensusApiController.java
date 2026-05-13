package com.census.rajasthan.controller;

import com.census.rajasthan.dto.ApiResponse;
import com.census.rajasthan.model.CensusData;
import com.census.rajasthan.model.RajasthanSummary;
import com.census.rajasthan.service.CensusService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * REST Controller — Census Data API
 *
 * Base URL : /api/census
 *
 * All endpoints return ApiResponse<T> so the frontend
 * always gets { "success": true/false, "data": ... }
 */
@RestController
@RequestMapping("/api/census")
public class CensusApiController {

    private final CensusService censusService;

    public CensusApiController(CensusService censusService) {
        this.censusService = censusService;
    }

    /**
     * GET /api/census/districts
     * Returns all districts. Optionally filter by ?search=jaipur
     */
    @GetMapping("/districts")
    public ResponseEntity<ApiResponse<List<CensusData>>> getAllDistricts(
            @RequestParam(required = false) String search) {

        List<CensusData> data = (search != null && !search.isBlank())
                ? censusService.searchDistricts(search)
                : censusService.getAllDistricts();

        return ResponseEntity.ok(ApiResponse.ok(data,
                "Fetched " + data.size() + " districts"));
    }

    /**
     * GET /api/census/districts/{id}
     * Returns a single district by ID
     */
    @GetMapping("/districts/{id}")
    public ResponseEntity<ApiResponse<CensusData>> getDistrictById(@PathVariable Long id) {
        CensusData district = censusService.getDistrictById(id);
        return ResponseEntity.ok(ApiResponse.ok(district));
    }

    /**
     * GET /api/census/districts/code/{code}
     * Returns a district by its code, e.g. RJ-10
     */
    @GetMapping("/districts/code/{code}")
    public ResponseEntity<ApiResponse<CensusData>> getByCode(@PathVariable String code) {
        CensusData district = censusService.getDistrictByCode(code);
        return ResponseEntity.ok(ApiResponse.ok(district));
    }

    /**
     * GET /api/census/summary
     * Returns Rajasthan state-level summary statistics
     */
    @GetMapping("/summary")
    public ResponseEntity<ApiResponse<RajasthanSummary>> getSummary() {
        return ResponseEntity.ok(ApiResponse.ok(censusService.getStateSummary()));
    }

    /**
     * GET /api/census/charts/literacy
     * Returns literacy rate data for all districts (for charts)
     */
    @GetMapping("/charts/literacy")
    public ResponseEntity<ApiResponse<Map<String, Double>>> getLiteracyChart() {
        return ResponseEntity.ok(ApiResponse.ok(censusService.getLiteracyChartData()));
    }

    /**
     * GET /api/census/charts/population?limit=10
     * Returns top N districts by population (for charts)
     */
    @GetMapping("/charts/population")
    public ResponseEntity<ApiResponse<Map<String, Long>>> getPopulationChart(
            @RequestParam(defaultValue = "10") int limit) {
        return ResponseEntity.ok(ApiResponse.ok(censusService.getPopulationChartData()));
    }

    /**
     * GET /api/census/top-population?limit=5
     * Returns top N districts by population
     */
    @GetMapping("/top-population")
    public ResponseEntity<ApiResponse<List<CensusData>>> getTopByPopulation(
            @RequestParam(defaultValue = "5") int limit) {
        return ResponseEntity.ok(
                ApiResponse.ok(censusService.getTopDistrictsByPopulation(limit)));
    }

    /**
     * GET /api/census/top-literacy?limit=5
     * Returns top N districts by literacy rate
     */
    @GetMapping("/top-literacy")
    public ResponseEntity<ApiResponse<List<CensusData>>> getTopByLiteracy(
            @RequestParam(defaultValue = "5") int limit) {
        return ResponseEntity.ok(
                ApiResponse.ok(censusService.getTopDistrictsByLiteracy(limit)));
    }
}
