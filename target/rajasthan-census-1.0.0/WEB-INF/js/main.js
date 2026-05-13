/**
 * राजस्थान जनगणना - Main JavaScript
 * Rajasthan Census Website - Client-side functionality
 */

// ---- Mobile Menu Toggle ----
function toggleMobileMenu() {
    const navList = document.getElementById('mainNavList');
    navList.classList.toggle('open');
}

// ---- Font Size Control ----
let currentFontSize = 16;
function changeFontSize(dir) {
    if (dir === 0) { currentFontSize = 16; }
    else if (dir === 1 && currentFontSize < 22) { currentFontSize += 2; }
    else if (dir === -1 && currentFontSize > 12) { currentFontSize -= 2; }
    document.documentElement.style.fontSize = currentFontSize + 'px';
}

// ---- High Contrast Toggle ----
function toggleContrast() {
    document.body.classList.toggle('high-contrast');
    const stored = localStorage.getItem('highContrast') === 'true';
    localStorage.setItem('highContrast', (!stored).toString());
}

// ---- Restore preferences on load ----
document.addEventListener('DOMContentLoaded', () => {
    // Restore contrast
    if (localStorage.getItem('highContrast') === 'true') {
        document.body.classList.add('high-contrast');
    }

    // Active nav highlight
    const current = window.location.pathname;
    document.querySelectorAll('.nav-list a').forEach(link => {
        if (link.getAttribute('href') === current) {
            link.classList.add('active');
        }
    });

    // Close mobile menu on outside click
    document.addEventListener('click', (e) => {
        const nav = document.querySelector('.main-nav');
        const toggle = document.querySelector('.mobile-menu-toggle');
        if (nav && !nav.contains(e.target) && e.target !== toggle) {
            const navList = document.getElementById('mainNavList');
            if (navList) navList.classList.remove('open');
        }
    });

    // Smooth dropdown on touch
    document.querySelectorAll('.has-dropdown > a').forEach(link => {
        link.addEventListener('touchstart', (e) => {
            const parent = link.parentElement;
            const dropdown = parent.querySelector('.dropdown');
            if (dropdown) {
                e.preventDefault();
                const isOpen = dropdown.style.display === 'block';
                // Close all dropdowns first
                document.querySelectorAll('.dropdown').forEach(d => d.style.display = '');
                if (!isOpen) dropdown.style.display = 'block';
            }
        });
    });
});
