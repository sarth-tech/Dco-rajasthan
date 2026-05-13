package com.census.rajasthan.repository;

import com.census.rajasthan.model.CensusData;
import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Repository — Census Data
 *
 * Currently uses an in-memory List as the data store.
 * When a database is added later, only this class changes —
 * the service layer stays the same (Repository Pattern).
 *
 * To switch to JPA:  extend JpaRepository<CensusData, Long>
 *                    and annotate CensusData with @Entity.
 */
@Repository
public class CensusDataRepository {

    // ── In-memory data store ──────────────────────────────
    private final List<CensusData> store = new ArrayList<>();

    public CensusDataRepository() {
        initData();
    }

    // ── CRUD Operations ───────────────────────────────────

    public List<CensusData> findAll() {
        return Collections.unmodifiableList(store);
    }

    public Optional<CensusData> findById(Long id) {
        return store.stream().filter(d -> d.getId().equals(id)).findFirst();
    }

    public Optional<CensusData> findByDistrictCode(String code) {
        return store.stream()
                .filter(d -> d.getDistrictCode().equalsIgnoreCase(code))
                .findFirst();
    }

    public List<CensusData> findByNameContaining(String keyword) {
        String kw = keyword.toLowerCase();
        return store.stream()
                .filter(d -> d.getDistrictName().toLowerCase().contains(kw)
                          || d.getDistrictNameHindi().contains(keyword))
                .collect(Collectors.toList());
    }

    public List<CensusData> findTopByPopulation(int limit) {
        return store.stream()
                .sorted(Comparator.comparingLong(CensusData::getTotalPopulation).reversed())
                .limit(limit)
                .collect(Collectors.toList());
    }

    public List<CensusData> findTopByLiteracy(int limit) {
        return store.stream()
                .sorted(Comparator.comparingDouble(CensusData::getLiteracyRate).reversed())
                .limit(limit)
                .collect(Collectors.toList());
    }

    public long count() {
        return store.size();
    }

    // ── Seed Data ─────────────────────────────────────────
    private void initData() {
        store.add(CensusData.builder().id(1L).districtCode("RJ-10").districtName("Jaipur").districtNameHindi("जयपुर")
                .totalPopulation(6626178L).malePopulation(3469081L).femalePopulation(3157097L)
                .literacyRate(75.51).maleLiteracyRate(86.08).femaleLiteracyRate(64.03)
                .sexRatio(910).area(11143L).populationDensity(595.0)
                .totalHouseholds(1434409L).ruralPopulation(3263200L).urbanPopulation(3362978L)
                .census2011Rank(1).build());

        store.add(CensusData.builder().id(2L).districtCode("RJ-18").districtName("Jodhpur").districtNameHindi("जोधपुर")
                .totalPopulation(3687165L).malePopulation(1920977L).femalePopulation(1766188L)
                .literacyRate(65.94).maleLiteracyRate(79.01).femaleLiteracyRate(51.98)
                .sexRatio(916).area(22850L).populationDensity(161.0)
                .totalHouseholds(749025L).ruralPopulation(2299000L).urbanPopulation(1388165L)
                .census2011Rank(2).build());

        store.add(CensusData.builder().id(3L).districtCode("RJ-03").districtName("Alwar").districtNameHindi("अलवर")
                .totalPopulation(3671999L).malePopulation(1930464L).femalePopulation(1741535L)
                .literacyRate(70.72).maleLiteracyRate(83.89).femaleLiteracyRate(56.57)
                .sexRatio(902).area(8380L).populationDensity(438.0)
                .totalHouseholds(752756L).ruralPopulation(3097000L).urbanPopulation(574999L)
                .census2011Rank(3).build());

        store.add(CensusData.builder().id(4L).districtCode("RJ-21").districtName("Nagaur").districtNameHindi("नागौर")
                .totalPopulation(3307743L).malePopulation(1718219L).femalePopulation(1589524L)
                .literacyRate(62.82).maleLiteracyRate(76.97).femaleLiteracyRate(47.91)
                .sexRatio(925).area(17718L).populationDensity(187.0)
                .totalHouseholds(664083L).ruralPopulation(2987000L).urbanPopulation(320743L)
                .census2011Rank(4).build());

        store.add(CensusData.builder().id(5L).districtCode("RJ-32").districtName("Udaipur").districtNameHindi("उदयपुर")
                .totalPopulation(3068420L).malePopulation(1564348L).femalePopulation(1504072L)
                .literacyRate(61.82).maleLiteracyRate(75.98).femaleLiteracyRate(47.44)
                .sexRatio(961).area(13430L).populationDensity(228.0)
                .totalHouseholds(600042L).ruralPopulation(2446000L).urbanPopulation(622420L)
                .census2011Rank(5).build());

        store.add(CensusData.builder().id(6L).districtCode("RJ-05").districtName("Barmer").districtNameHindi("बाड़मेर")
                .totalPopulation(2603751L).malePopulation(1353831L).femalePopulation(1249920L)
                .literacyRate(56.53).maleLiteracyRate(71.15).femaleLiteracyRate(40.58)
                .sexRatio(923).area(28387L).populationDensity(92.0)
                .totalHouseholds(459898L).ruralPopulation(2453000L).urbanPopulation(150751L)
                .census2011Rank(6).build());

        store.add(CensusData.builder().id(7L).districtCode("RJ-27").districtName("Sikar").districtNameHindi("सीकर")
                .totalPopulation(2677737L).malePopulation(1393521L).femalePopulation(1284216L)
                .literacyRate(71.91).maleLiteracyRate(84.23).femaleLiteracyRate(58.72)
                .sexRatio(921).area(7732L).populationDensity(346.0)
                .totalHouseholds(543017L).ruralPopulation(2256000L).urbanPopulation(421737L)
                .census2011Rank(7).build());

        store.add(CensusData.builder().id(8L).districtCode("RJ-07").districtName("Bikaner").districtNameHindi("बीकानेर")
                .totalPopulation(2363937L).malePopulation(1244406L).femalePopulation(1119531L)
                .literacyRate(65.13).maleLiteracyRate(77.09).femaleLiteracyRate(52.29)
                .sexRatio(900).area(30247L).populationDensity(78.0)
                .totalHouseholds(464564L).ruralPopulation(1406000L).urbanPopulation(957937L)
                .census2011Rank(8).build());

        store.add(CensusData.builder().id(9L).districtCode("RJ-02").districtName("Ajmer").districtNameHindi("अजमेर")
                .totalPopulation(2584913L).malePopulation(1343409L).femalePopulation(1241504L)
                .literacyRate(70.46).maleLiteracyRate(82.75).femaleLiteracyRate(57.43)
                .sexRatio(924).area(8481L).populationDensity(305.0)
                .totalHouseholds(549699L).ruralPopulation(1665000L).urbanPopulation(919913L)
                .census2011Rank(9).build());

        store.add(CensusData.builder().id(10L).districtCode("RJ-06").districtName("Bharatpur").districtNameHindi("भरतपुर")
                .totalPopulation(2548462L).malePopulation(1337975L).femalePopulation(1210487L)
                .literacyRate(70.11).maleLiteracyRate(83.17).femaleLiteracyRate(55.84)
                .sexRatio(905).area(5066L).populationDensity(503.0)
                .totalHouseholds(484416L).ruralPopulation(2100000L).urbanPopulation(448462L)
                .census2011Rank(10).build());

        store.add(CensusData.builder().id(11L).districtCode("RJ-17").districtName("Kota").districtNameHindi("कोटा")
                .totalPopulation(1950491L).malePopulation(1018356L).femalePopulation(932135L)
                .literacyRate(77.48).maleLiteracyRate(87.45).femaleLiteracyRate(66.43)
                .sexRatio(915).area(12436L).populationDensity(157.0)
                .totalHouseholds(418614L).ruralPopulation(838000L).urbanPopulation(1112491L)
                .census2011Rank(11).build());

        store.add(CensusData.builder().id(12L).districtCode("RJ-09").districtName("Chittorgarh").districtNameHindi("चित्तौड़गढ़")
                .totalPopulation(1544338L).malePopulation(794682L).femalePopulation(749656L)
                .literacyRate(64.29).maleLiteracyRate(77.82).femaleLiteracyRate(49.89)
                .sexRatio(943).area(10856L).populationDensity(142.0)
                .totalHouseholds(304898L).ruralPopulation(1373000L).urbanPopulation(171338L)
                .census2011Rank(12).build());
    }
}
