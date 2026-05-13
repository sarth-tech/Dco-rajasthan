package com.census.rajasthan.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Model — District-level Census Data (Census 2011)
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CensusData {

    private Long id;

    private String districtCode;         // e.g. "RJ-01"
    private String districtName;         // English name
    private String districtNameHindi;    // Hindi name

    private Long totalPopulation;
    private Long malePopulation;
    private Long femalePopulation;

    private Double literacyRate;         // percentage
    private Double maleLiteracyRate;
    private Double femaleLiteracyRate;

    private Integer sexRatio;            // females per 1000 males
    private Long area;                   // sq km
    private Double populationDensity;    // per sq km

    private Long totalHouseholds;
    private Long ruralPopulation;
    private Long urbanPopulation;

    private Integer census2011Rank;      // rank by population in Rajasthan
}
