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

<!-- ============ HERO BANNER ============ -->
<section class="hero-section">
    <div class="hero-bg"></div>
    <div class="container hero-inner">
        <div class="hero-content">
            <div class="hero-badge">जनगणना 2027 • Census 2027</div>
            <h1 class="hero-title">जनगणना निदेशालय<br><span>राजस्थान</span></h1>
            <p class="hero-sub">भारत की 16वीं जनगणना में भागीदार बनें</p>
            <p class="hero-sub-en">Be a part of India's 16th Census</p>
            <div class="hero-actions">
                <a href="/districts" class="btn btn-primary">📊 जिला डेटा देखें</a>
                <a href="/notices" class="btn btn-outline">📋 नवीनतम सूचनाएँ</a>
            </div>
        </div>
        <div class="hero-map-area">
            <!-- Rajasthan stylized map SVG -->
            <svg class="raj-map-svg" viewBox="0 0 300 320" xmlns="http://www.w3.org/2000/svg">
                <defs>
                    <radialGradient id="mapGrad" cx="50%" cy="50%" r="60%">
                        <stop offset="0%" stop-color="rgba(255,165,0,0.3)"/>
                        <stop offset="100%" stop-color="rgba(255,100,0,0.05)"/>
                    </radialGradient>
                </defs>
                <!-- Simplified Rajasthan map shape -->
                <path d="M 60 30 L 200 20 L 260 60 L 280 130 L 240 200 L 210 280 L 140 310 L 80 290 L 30 230 L 20 150 L 40 80 Z"
                      fill="url(#mapGrad)" stroke="rgba(255,150,0,0.6)" stroke-width="2"/>
                <!-- District dots -->
                <circle cx="160" cy="100" r="6" fill="#FF6B35" opacity="0.8"/>
                <text x="168" y="104" fill="white" font-size="9" font-family="Noto Sans Devanagari">जयपुर</text>
                <circle cx="100" cy="160" r="4" fill="#FF6B35" opacity="0.7"/>
                <text x="108" y="164" fill="white" font-size="8">जोधपुर</text>
                <circle cx="190" cy="200" r="4" fill="#FF6B35" opacity="0.7"/>
                <text x="198" y="204" fill="white" font-size="8">उदयपुर</text>
                <circle cx="200" cy="130" r="4" fill="#FF6B35" opacity="0.7"/>
                <text x="208" y="134" fill="white" font-size="8">अलवर</text>
                <circle cx="130" cy="230" r="4" fill="#FF6B35" opacity="0.7"/>
                <text x="138" y="234" fill="white" font-size="8">कोटा</text>
                <!-- State Label -->
                <text x="150" y="175" fill="rgba(255,200,100,0.8)" font-size="14" font-family="Noto Sans Devanagari" text-anchor="middle" font-weight="bold">राजस्थान</text>
            </svg>
        </div>
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
                <div class="stat-icon">📚</div>
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
                <div class="stat-number" data-target="33">0</div>
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
