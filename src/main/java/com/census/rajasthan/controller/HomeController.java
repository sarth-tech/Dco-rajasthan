package com.census.rajasthan.controller;

import com.census.rajasthan.service.CensusService;
import com.census.rajasthan.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Controller — Page Routing (returns JSP view names)
 *
 * Handles every browser URL and populates the Model
 * with data that JSP templates render.
 */
@Controller
public class HomeController {

    private final CensusService censusService;
    private final NoticeService noticeService;

    public HomeController(CensusService censusService, NoticeService noticeService) {
        this.censusService = censusService;
        this.noticeService = noticeService;
    }

    /** GET / — Home page */
    @GetMapping({"", "/"})
    public String home(Model model) {
        model.addAttribute("pageTitle", "मुख्य पृष्ठ — जनगणना राजस्थान");
        model.addAttribute("activePage", "home");
        model.addAttribute("summary",    censusService.getStateSummary());
        model.addAttribute("notices",    noticeService.getLatestNotices(5));
        return "index";
    }

    /** GET /districts — District data table */
    @GetMapping("/districts")
    public String districts(Model model) {
        model.addAttribute("pageTitle", "जिला डेटा — जनगणना राजस्थान");
        model.addAttribute("activePage", "districts");
        model.addAttribute("districts", censusService.getAllDistricts());
        return "districts";
    }

    /** GET /notices — All notices */
    @GetMapping("/notices")
    public String notices(Model model) {
        model.addAttribute("pageTitle", "सूचनाएँ — जनगणना राजस्थान");
        model.addAttribute("activePage", "notices");
        model.addAttribute("notices", noticeService.getAllNotices());
        return "notices";
    }

    /** GET /about */
    @GetMapping("/about")
    public String about(Model model) {
        model.addAttribute("pageTitle", "हमारे बारे में — जनगणना राजस्थान");
        model.addAttribute("activePage", "about");
        return "about";
    }

    /** GET /contact */
    @GetMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("pageTitle", "संपर्क करें — जनगणना राजस्थान");
        model.addAttribute("activePage", "contact");
        return "contact";
    }
}
