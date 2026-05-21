<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="राजस्थान जनगणना - जनगणना निदेशालय, राजस्थान सरकार की आधिकारिक वेबसाइट">
    <title>${pageTitle}</title>
    
    <!-- Google Fonts: Noto Sans Devanagari + Tiro Devanagari Hindi -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Devanagari:wght@300;400;500;600;700&family=Tiro+Devanagari+Hindi&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=9999999">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css?v=20">
</head>
<body>

<!-- Skip Navigation (Accessibility) -->
<a href="#main-content" class="skip-nav">मुख्य सामग्री पर जाएँ</a>

<!-- ============ TOP UTILITY BAR ============ -->
<div class="utility-bar">
    <div class="container">
        <div class="utility-left">
            <span>भारत सरकार | Government of India</span>
            <span class="separator">|</span>
            <span>गृह मंत्रालय | Ministry of Home Affairs</span>
        </div>
        <div class="utility-right">
            <a href="${pageContext.request.contextPath}/" class="lang-btn active">हिन्दी</a>
            <a href="${pageContext.request.contextPath}/en" class="lang-btn">English</a>
            <span class="separator">|</span>
            <button class="text-resize" onclick="changeFontSize(-1)" title="अक्षर छोटा करें">A-</button>
            <button class="text-resize active" onclick="changeFontSize(0)" title="मूल आकार">A</button>
            <button class="text-resize" onclick="changeFontSize(1)" title="अक्षर बड़ा करें">A+</button>
            <span class="separator">|</span>
            <button class="contrast-btn" onclick="toggleContrast()" title="उच्च कंट्रास्ट">☀</button>
        </div>
    </div>
</div>

<!-- ============ MAIN HEADER ============ -->
<header class="main-header">

<div class="container">

<div class="header-inner">

<!-- Left emblem -->

<div class="header-emblem">

<img
src="${pageContext.request.contextPath}/media/files/emblem.png"
class="emblem-img"
alt="Emblem">

</div>


<!-- Center title -->

<div class="header-title">

<div class="header-title-hi">

जनगणना निदेशालय, राजस्थान

</div>

<div class="header-title-en">

Directorate of Census Operations, Rajasthan

</div>

<div class="header-subtitle">

Under Office of Registrar General & Census Commissioner, India

</div>

</div>


<!-- Right logo -->

<div class="header-logo">

<img
src="${pageContext.request.contextPath}/media/files/censuslogo_2027.png"
class="census-logo"
alt="Census">

</div>

</div>

</div>

</header>
<!-- ============ MAIN NAVIGATION ============ -->
<nav class="main-nav" role="navigation" aria-label="मुख्य नेविगेशन">
    <div class="container">
        <button class="mobile-menu-toggle" onclick="toggleMobileMenu()" aria-label="मेनू">☰ मेनू</button>
        <ul class="nav-list" id="mainNavList">
            <li><a href="${pageContext.request.contextPath}/" class="${activePage == 'home' ? 'active' : ''}">🏠 मुख्य पृष्ठ</a></li>
            <li class="has-dropdown">
                <a href="#">जनगणना 2027 ▾</a>
                <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/notices">अधिसूचनाएँ</a></li>
                    <li><a href="#">मकान सूचीकरण</a></li>
                    <li><a href="#">जनगणना अनुसूची</a></li>
                    <li><a href="#">प्रशिक्षण सामग्री</a></li>
                </ul>
            </li>
            <li class="has-dropdown">
                <a href="#">डेटा ▾</a>
                <ul class="dropdown">
                    <li><a href="${pageContext.request.contextPath}/districts">जिला डेटा</a></li>
                    <li><a href="#">जनसंख्या तालिकाएँ</a></li>
                    <li><a href="#">साक्षरता दर</a></li>
                    <li><a href="#">लिंगानुपात</a></li>
                    <li><a href="#">शहरी/ग्रामीण वितरण</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/notices" class="${activePage == 'notices' ? 'active' : ''}">📋 सूचनाएँ</a></li>
            <li><a href="${pageContext.request.contextPath}/media" class="${activePage == 'media' ? 'active' : ''}">📸 मीडिया</a></li>
            <li class="has-dropdown">
                <a href="#">प्रकाशन ▾</a>
                <ul class="dropdown">
                    <li><a href="#">वार्षिक रिपोर्ट</a></li>
                    <li><a href="#">जनगणना प्रचंड</a></li>
                    <li><a href="#">सांख्यिकीय पुस्तिका</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/about" class="${activePage == 'about' ? 'active' : ''}">हमारे बारे में</a></li>
            <li><a href="${pageContext.request.contextPath}/contact" class="${activePage == 'contact' ? 'active' : ''}">📞 संपर्क करें</a></li>
        </ul>
    </div>
</nav>

<!-- ============ BREADCRUMB ============ -->
<div class="breadcrumb-bar">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/">मुख्य पृष्ठ</a></li>
                <c:if test="${activePage != 'home'}">
                    <li class="separator">»</li>
                    <li class="current">${pageTitle}</li>
                </c:if>
            </ol>
        </nav>
        <div class="last-updated">अंतिम अद्यतन: 11 मई 2026</div>
    </div>
</div>

<!-- ============ MAIN CONTENT STARTS ============ -->
<main id="main-content">
