<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ include file="header.jsp" %>

<section class="content-section">
    <div class="container">
        <div class="page-heading">
            <h1>📊 जिलावार जनसंख्या डेटा</h1>
            <p class="page-subtitle">जनगणना 2011 के अनुसार राजस्थान के जिलों का विस्तृत डेटा</p>
        </div>

        <!-- Summary Cards -->
        <div class="district-summary-bar">
            <div class="dsb-item">
                <span class="dsb-val">6,85,48,437</span>
                <span class="dsb-lbl">कुल जनसंख्या</span>
            </div>
            <div class="dsb-item">
                <span class="dsb-val">33</span>
                <span class="dsb-lbl">जिले</span>
            </div>
            <div class="dsb-item">
                <span class="dsb-val">66.11%</span>
                <span class="dsb-lbl">साक्षरता दर</span>
            </div>
            <div class="dsb-item">
                <span class="dsb-val">928</span>
                <span class="dsb-lbl">लिंगानुपात</span>
            </div>
        </div>

        <!-- Search / Filter -->
        <div class="table-controls">
            <input type="text" id="districtSearch" placeholder="🔍 जिले का नाम खोजें..."
                   onkeyup="filterTable()" class="search-box">
            <span class="table-count" id="rowCount">12 जिले दिखाए जा रहे हैं</span>
        </div>

        <!-- Data Table -->
        <div class="table-wrapper">
            <table class="data-table" id="districtTable">
                <thead>
                    <tr>
                        <th>क्र.सं.</th>
                        <th onclick="sortTable(1)" class="sortable">जिला ▲▼</th>
                        <th onclick="sortTable(2)" class="sortable">कुल जनसंख्या ▲▼</th>
                        <th>पुरुष</th>
                        <th>महिलाएँ</th>
                        <th onclick="sortTable(5)" class="sortable">साक्षरता % ▲▼</th>
                        <th>लिंगानुपात</th>
                        <th>क्षेत्रफल (वर्ग किमी)</th>
                        <th>घनत्व (/वर्ग किमी)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="d" items="${districts}" varStatus="s">
                    <tr>
                        <td class="center">${s.count}</td>
                        <td class="district-name">
                            <strong>${d.districtNameHindi}</strong>
                            <small>${d.districtName}</small>
                        </td>
                        <td class="number"><fmt:formatNumber value="${d.totalPopulation}" type="number"/></td>
                        <td class="number"><fmt:formatNumber value="${d.malePopulation}" type="number"/></td>
                        <td class="number"><fmt:formatNumber value="${d.femalePopulation}" type="number"/></td>
                        <td class="number">
                            <div class="literacy-bar-cell">
                                <span>${d.literacyRate}%</span>
                                <div class="mini-bar">
                                    <div class="mini-bar-fill" style="width:${d.literacyRate}%"></div>
                                </div>
                            </div>
                        </td>
                        <td class="number">${d.sexRatio}</td>
                        <td class="number"><fmt:formatNumber value="${d.area}" type="number"/></td>
                        <td class="number">${d.populationDensity}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="table-note">
            📌 स्रोत: भारत की जनगणना 2011, जनगणना निदेशालय, राजस्थान | 
            नोट: उपरोक्त तालिका में 12 प्रमुख जिलों का डेटा दर्शाया गया है।
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

<script>
function filterTable() {
    const input = document.getElementById('districtSearch').value.toLowerCase();
    const rows = document.querySelectorAll('#districtTable tbody tr');
    let visible = 0;
    rows.forEach(row => {
        const text = row.textContent.toLowerCase();
        const show = text.includes(input);
        row.style.display = show ? '' : 'none';
        if (show) visible++;
    });
    document.getElementById('rowCount').textContent = visible + ' जिले दिखाए जा रहे हैं';
}

function sortTable(col) {
    const table = document.getElementById('districtTable');
    const rows = Array.from(table.querySelectorAll('tbody tr'));
    const isNum = col !== 1;
    rows.sort((a, b) => {
        const aVal = a.cells[col].textContent.replace(/[,₹%]/g, '').trim();
        const bVal = b.cells[col].textContent.replace(/[,₹%]/g, '').trim();
        return isNum ? parseFloat(bVal) - parseFloat(aVal) : aVal.localeCompare(bVal, 'hi');
    });
    rows.forEach(r => table.querySelector('tbody').appendChild(r));
}
</script>
