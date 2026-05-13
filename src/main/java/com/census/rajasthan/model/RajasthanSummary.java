package com.census.rajasthan.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Model — State-level summary statistics for Rajasthan
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RajasthanSummary {

    private String totalPopulation;
    private String malePopulation;
    private String femalePopulation;
    private String literacyRate;
    private String sexRatio;
    private String totalArea;
    private String populationDensity;
    private Integer totalDistricts;
    private Integer totalTehsils;
    private Integer totalVillages;
    private Integer totalUrbanAreas;
    private String populationGrowthRate;   // 2001-2011
    private String decadalGrowth;
    private String childSexRatio;          // 0-6 years
}
