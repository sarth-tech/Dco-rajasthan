package com.census.rajasthan.service;

import com.census.rajasthan.exception.ResourceNotFoundException;
import com.census.rajasthan.model.CensusData;
import com.census.rajasthan.repository.CensusDataRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.*;

@DisplayName("CensusService Tests")
class CensusServiceTest {

    private CensusService service;

    @BeforeEach
    void setUp() {
        service = new CensusService(new CensusDataRepository());
    }

    @Test
    @DisplayName("getAllDistricts() returns non-empty list")
    void getAllDistricts_returnsList() {
        List<CensusData> districts = service.getAllDistricts();
        assertThat(districts).isNotEmpty();
        assertThat(districts.size()).isGreaterThanOrEqualTo(12);
    }

    @Test
    @DisplayName("getDistrictById(1) returns Jaipur")
    void getDistrictById_returnsJaipur() {
        CensusData d = service.getDistrictById(1L);
        assertThat(d.getDistrictName()).isEqualTo("Jaipur");
        assertThat(d.getTotalPopulation()).isGreaterThan(6_000_000L);
    }

    @Test
    @DisplayName("getDistrictById() throws ResourceNotFoundException for unknown id")
    void getDistrictById_throwsForUnknownId() {
        assertThatThrownBy(() -> service.getDistrictById(999L))
                .isInstanceOf(ResourceNotFoundException.class)
                .hasMessageContaining("999");
    }

    @Test
    @DisplayName("searchDistricts() finds by English name")
    void search_findsByEnglishName() {
        List<CensusData> results = service.searchDistricts("jaipur");
        assertThat(results).isNotEmpty();
        assertThat(results.get(0).getDistrictName()).isEqualToIgnoringCase("Jaipur");
    }

    @Test
    @DisplayName("getTopDistrictsByPopulation() returns correct count")
    void topByPopulation_returnsLimit() {
        List<CensusData> top3 = service.getTopDistrictsByPopulation(3);
        assertThat(top3).hasSize(3);
        // Jaipur should be first
        assertThat(top3.get(0).getDistrictName()).isEqualTo("Jaipur");
    }

    @Test
    @DisplayName("getStateSummary() returns non-null Rajasthan summary")
    void stateSummary_isNotNull() {
        assertThat(service.getStateSummary()).isNotNull();
        assertThat(service.getStateSummary().getTotalDistricts()).isEqualTo(33);
    }
}
