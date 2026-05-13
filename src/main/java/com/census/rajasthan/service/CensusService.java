package com.census.rajasthan.service;

import com.census.rajasthan.exception.ResourceNotFoundException;
import com.census.rajasthan.model.CensusData;
import com.census.rajasthan.model.RajasthanSummary;
import com.census.rajasthan.repository.CensusDataRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.LinkedHashMap;

/**
 * Service — Census Business Logic
 *
 * All data access goes through the Repository.
 * All transformations and business rules live here.
 */
@Service
public class CensusService {

    private final CensusDataRepository repository;

    // Constructor injection (preferred over @Autowired on field)
    public CensusService(CensusDataRepository repository) {
        this.repository = repository;
    }

    // ── District queries ──────────────────────────────────

    public List<CensusData> getAllDistricts() {
        return repository.findAll();
    }

    public CensusData getDistrictById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("District", "id", id));
    }

    public CensusData getDistrictByCode(String code) {
        return repository.findByDistrictCode(code)
                .orElseThrow(() -> new ResourceNotFoundException("District", "code", code));
    }

    public List<CensusData> searchDistricts(String keyword) {
        if (keyword == null || keyword.isBlank()) {
            return repository.findAll();
        }
        return repository.findByNameContaining(keyword.trim());
    }

    public List<CensusData> getTopDistrictsByPopulation(int limit) {
        int safeLimit = Math.min(limit, 33);   // Rajasthan has 33 districts
        return repository.findTopByPopulation(safeLimit);
    }

    public List<CensusData> getTopDistrictsByLiteracy(int limit) {
        return repository.findTopByLiteracy(Math.min(limit, 33));
    }

    // ── State-level summary ───────────────────────────────

    public RajasthanSummary getStateSummary() {
        return RajasthanSummary.builder()
                .totalPopulation("6,85,48,437")
                .malePopulation("3,55,50,997")
                .femalePopulation("3,29,97,440")
                .literacyRate("66.11%")
                .sexRatio("928")
                .totalArea("3,42,239 Sq.Km")
                .populationDensity("200 per Sq.Km")
                .totalDistricts(33)
                .totalTehsils(295)
                .totalVillages(44981)
                .totalUrbanAreas(297)
                .populationGrowthRate("21.44%")
                .decadalGrowth("2001–2011")
                .childSexRatio("888")
                .build();
    }

    // ── Chart / analytics data ─────────────────────────────

    public Map<String, Double> getLiteracyChartData() {
        Map<String, Double> data = new LinkedHashMap<>();
        repository.findAll().forEach(d ->
                data.put(d.getDistrictName(), d.getLiteracyRate()));
        return data;
    }

    public Map<String, Long> getPopulationChartData() {
        Map<String, Long> data = new LinkedHashMap<>();
        repository.findTopByPopulation(10).forEach(d ->
                data.put(d.getDistrictName(), d.getTotalPopulation()));
        return data;
    }

    public long getTotalDistrictCount() {
        return repository.count();
    }
}
