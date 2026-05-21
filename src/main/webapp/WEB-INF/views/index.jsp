<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>

<!-- ============ HERO / MARQUEE BANNER ============ -->
<div class="news-ticker">
    <div class="ticker-label">🔴 ताज़ा समाचार</div>
    <div class="ticker-content">
        <span>जनगणना 2027 - मकान सूचीकरण कार्य 1 अप्रैल 2026 से प्रारम्भ हो गया है | 
              Census 2027 House Listing commenced from April 1, 2026 &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 
              प्रगणकों की भर्ती हेतु आवेदन आमंत्रित हैं - अंतिम तिथि 30 मई 2026 &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
              ई-जनगणना मोबाइल ऐप अब Play Store पर उपलब्ध</span>
    </div>
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">

<!-- ============ HERO BANNER ============ -->
<section class="hero-section">

<div class="swiper heroSwiper">

<div class="swiper-wrapper">

<div class="swiper-slide">

<video autoplay muted loop playsinline
style="width:100%;height:100%;object-fit:cover;">

<source
src="/media/files/census_video_hindi.mp4"
type="video/mp4">

</video>

</div>

<!-- Add more slides later -->

<div class="swiper-slide">

<img
src="/media/files/censusbanner1.jpg"
style="width:100%;height:100%;object-fit:cover;">

</div>

</div>

<div class="swiper-pagination"></div>

<div class="swiper-button-prev"></div>

<div class="swiper-button-next"></div>

</div>

</section>
<!-- ============ KEY STATISTICS ============ -->
<section class="stats-section">
    <div class="container">
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon">👥</div>
                <div class="stat-number" data-target="68548437">0</div>
                <div class="stat-label">कुल जनसंख्या<br><small>Total Population (2011)</small></div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">🧾</div>
                <div class="stat-number count-pct" data-target="66.11">0</div>
                <div class="stat-label">साक्षरता दर<br><small>Literacy Rate</small></div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">⚖️</div>
                <div class="stat-number" data-target="928">0</div>
                <div class="stat-label">लिंगानुपात<br><small>Sex Ratio (per 1000 males)</small></div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">🏘️</div>
                <div class="stat-number" data-target="41">0</div>
                <div class="stat-label">जिले<br><small>Districts</small></div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">🌾</div>
                <div class="stat-number" data-target="44981">0</div>
                <div class="stat-label">गाँव<br><small>Villages</small></div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">📐</div>
                <div class="stat-number" data-target="342239">0</div>
                <div class="stat-label">क्षेत्रफल (वर्ग किमी)<br><small>Area in Sq.Km</small></div>
            </div>
        </div>
    </div>
</section>

<!-- ============ MAIN CONTENT AREA ============ -->
<section class="content-section">
    <div class="container">
        <div class="two-col-layout">

            <!-- LEFT: Notices & News -->
            <div class="content-main">

                <!-- Notices Panel -->
                <div class="panel">
                    <div class="panel-header">
                        <h2>📋 सूचनाएँ एवं समाचार</h2>
                        <a href="/notices" class="view-all">सभी देखें »</a>
                    </div>
                    <div class="panel-body">
                        <ul class="notice-list">
                            <c:forEach var="notice" items="${notices}">
                                <li class="notice-item">
                                    <span class="notice-date">${notice.publishDate}</span>
                                    <span class="notice-badge notice-${notice.category}">
                                        <c:choose>
                                            <c:when test="${notice.category == 'NEWS'}">समाचार</c:when>
                                            <c:when test="${notice.category == 'CIRCULAR'}">परिपत्र</c:when>
                                            <c:otherwise>सूचना</c:otherwise>
                                        </c:choose>
                                    </span>
                                    <c:if test="${notice.newNotice}">
                                        <span class="new-badge">NEW</span>
                                    </c:if>
                                    <a href="${notice.documentUrl}" class="notice-title">${notice.titleHindi}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <!-- Census 2027 Info Panel -->
                <div class="panel census27-panel">
                    <div class="panel-header">
                        <h2>🗓️ जनगणना 2027</h2>
                    </div>
                    <div class="panel-body census27-body">
                        <div class="census27-phase">
                            <div class="phase-icon">🏠</div>
                            <div>
                                <strong>प्रथम चरण: मकान सूचीकरण</strong>
                                <p>1 अप्रैल 2026 से 30 सितम्बर 2026</p>
                            </div>
                            <span class="phase-status active">जारी है</span>
                        </div>
                        <div class="census27-phase">
                            <div class="phase-icon">📝</div>
                            <div>
                                <strong>द्वितीय चरण: जनसंख्या गणना</strong>
                                <p>फरवरी - मार्च 2027</p>
                            </div>
                            <span class="phase-status upcoming">शीघ्र आ रहा है</span>
                        </div>
                        <a href="/notices" class="btn btn-sm btn-primary mt-1">अधिक जानकारी</a>
                    </div>
                </div>
            </div>

            <!-- RIGHT: Sidebar -->
            <aside class="content-sidebar">

                <!-- Quick Links -->
                <div class="panel">
                    <div class="panel-header"><h3>⚡ त्वरित लिंक</h3></div>
                    <div class="panel-body">
                        <ul class="quicklinks">
                            <li><a href="/districts">📊 जिला डेटा (2011)</a></li>
                            <li><a href="#">📈 जनसंख्या तालिकाएँ</a></li>
                            <li><a href="#">🗺️ जनगणना मानचित्र</a></li>
                            <li><a href="#">📱 ई-जनगणना ऐप</a></li>
                            <li><a href="#">📄 जनगणना अधिनियम 1948</a></li>
                            <li><a href="#">🔍 NPR डेटाबेस</a></li>
                            <li><a href="https://censusindia.gov.in" target="_blank">🌐 राष्ट्रीय जनगणना</a></li>
                        </ul>
                    </div>
                </div>

                <!-- Photo Gallery Teaser -->
                <div class="panel">
                    <div class="panel-header"><h3>📷 फोटो गैलरी</h3></div>
                    <div class="panel-body">
                        <div class="gallery-grid">
                            <div class="gallery-thumb" style="background: linear-gradient(135deg, #FF6B35, #FF8C42);">📊</div>
                            <div class="gallery-thumb" style="background: linear-gradient(135deg, #2E4057, #048A81);">🗺️</div>
                            <div class="gallery-thumb" style="background: linear-gradient(135deg, #4CAF50, #2E7D32);">🏘️</div>
                            <div class="gallery-thumb" style="background: linear-gradient(135deg, #9C27B0, #673AB7);">📚</div>
                        </div>
                        <a href="#" class="btn btn-sm btn-outline mt-1">सभी फोटो देखें</a>
                    </div>
                </div>

                <!-- Download Section -->
                <div class="panel">
                    <div class="panel-header"><h3>⬇️ डाउनलोड</h3></div>
                    <div class="panel-body">
                        <ul class="download-list">
                            <li><a href="#" class="download-item"><span>📄</span> जनगणना 2011 प्राथमिक रिपोर्ट (PDF)</a></li>
                            <li><a href="#" class="download-item"><span>📊</span> जिलावार जनसंख्या (Excel)</a></li>
                            <li><a href="#" class="download-item"><span>📋</span> जनगणना अनुसूची (PDF)</a></li>
                        </ul>
                    </div>
                </div>
            </aside>

        </div><!-- end two-col -->
    </div>
</section>

<%@ include file="footer.jsp" %>

<script>
// Animated counter for stats
document.addEventListener('DOMContentLoaded', () => {
    const counters = document.querySelectorAll('.stat-number');
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const el = entry.target;
                const target = parseFloat(el.dataset.target);
                const isPct = el.classList.contains('count-pct');
                const duration = 1800;
                const step = target / (duration / 16);
                let current = 0;
                const timer = setInterval(() => {
                    current += step;
                    if (current >= target) { current = target; clearInterval(timer); }
                    el.textContent = isPct
                        ? current.toFixed(2) + '%'
                        : Math.floor(current).toLocaleString('hi-IN');
                }, 16);
                observer.unobserve(el);
            }
        });
    }, { threshold: 0.3 });
    counters.forEach(c => observer.observe(c));
});
</script>

<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script><script>new Swiper(".heroSwiper",{loop:true,speed:1000,autoplay:{delay:4000,disableOnInteraction:false},pagination:{el:".swiper-pagination",clickable:true}});</script>