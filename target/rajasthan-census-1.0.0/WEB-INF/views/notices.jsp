<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="header.jsp" %>

<section class="content-section">
    <div class="container">
        <div class="page-heading">
            <h1>📋 सूचनाएँ, परिपत्र एवं समाचार</h1>
            <p class="page-subtitle">जनगणना निदेशालय, राजस्थान की नवीनतम सूचनाएँ एवं आदेश</p>
        </div>

        <!-- Filter Tabs -->
        <div class="filter-tabs">
            <button class="tab-btn active" onclick="filterNotices('all', this)">सभी</button>
            <button class="tab-btn" onclick="filterNotices('news', this)">समाचार</button>
            <button class="tab-btn" onclick="filterNotices('notice', this)">सूचना</button>
            <button class="tab-btn" onclick="filterNotices('circular', this)">परिपत्र</button>
        </div>

        <!-- Notices List -->
        <div class="notices-full-list" id="noticesList">
            <c:forEach var="notice" items="${notices}">
            <div class="notice-card" data-category="${notice.category}">
                <div class="notice-card-left">
                    <div class="notice-card-date">${notice.publishDate}</div>
                    <div class="notice-card-badge notice-${notice.category}">
                        <c:choose>
                            <c:when test="${notice.category == 'NEWS'}">समाचार</c:when>
                            <c:when test="${notice.category == 'CIRCULAR'}">परिपत्र</c:when>
                            <c:otherwise>📋 सूचना</c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="notice-card-body">
                    <c:if test="${notice.newNotice}">
                        <span class="new-badge">NEW</span>
                    </c:if>
                    <h3 class="notice-card-title">
                        <a href="${notice.documentUrl}">${notice.titleHindi}</a>
                    </h3>
                    <p class="notice-card-subtitle">${notice.titleEnglish}</p>
                </div>
                <div class="notice-card-actions">
                    <a href="${notice.documentUrl}" class="btn btn-sm btn-outline">देखें</a>
                    <a href="${notice.documentUrl}" class="btn btn-sm btn-primary">⬇ डाउनलोड</a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

<script>
function filterNotices(cat, btn) {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    document.querySelectorAll('.notice-card').forEach(card => {
        card.style.display = (cat === 'all' || card.dataset.category === cat) ? '' : 'none';
    });
}
</script>
