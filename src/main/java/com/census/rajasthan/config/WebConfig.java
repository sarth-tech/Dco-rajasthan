package com.census.rajasthan.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * Web MVC Configuration
 *
 * - Maps /css/**, /js/**, /images/** to static resources in WEB-INF
 * - Configures CORS for the REST API (useful when frontend is separate)
 */
@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

    /** Configure JSP View Resolver */
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    /** Expose WEB-INF/css, js, images as static resources */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/css/**")
                .addResourceLocations("/WEB-INF/css/");

        registry.addResourceHandler("/js/**")
                .addResourceLocations("/WEB-INF/js/");

        registry.addResourceHandler("/images/**")
                .addResourceLocations("/WEB-INF/images/");

        // Map favicon and other root-level static files
        registry.addResourceHandler("/favicon.ico", "/robots.txt")
                .addResourceLocations("/WEB-INF/images/");
    }

    /**
     * CORS — allow the React/Angular frontend (if separated) to call the API.
     * Change origins to your actual frontend URL in production.
     */
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("http://localhost:3000", "http://localhost:8080")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .maxAge(3600);
    }
}
