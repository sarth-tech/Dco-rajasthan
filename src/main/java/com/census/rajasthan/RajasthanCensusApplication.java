package com.census.rajasthan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * ╔══════════════════════════════════════════════════════╗
 * ║   जनगणना निदेशालय, राजस्थान                        ║
 * ║   Directorate of Census Operations, Rajasthan        ║
 * ║   Spring Boot Entry Point                            ║
 * ╚══════════════════════════════════════════════════════╝
 */
@SpringBootApplication
public class RajasthanCensusApplication extends SpringBootServletInitializer {

    // Needed when deploying as WAR to external Tomcat
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(RajasthanCensusApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(RajasthanCensusApplication.class, args);
        System.out.println("\n================================================");
        System.out.println("  जनगणना राजस्थान वेबसाइट — चालू है!");
        System.out.println("  Rajasthan Census Website is RUNNING");
        System.out.println("  URL : http://localhost:8080");
        System.out.println("  API : http://localhost:8080/api/districts");
        System.out.println("================================================\n");
    }
}
