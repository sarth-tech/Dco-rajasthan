<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<section class="content-section">
    <div class="container">
        <div class="page-heading">
            <h1>📞 संपर्क करें</h1>
            <p class="page-subtitle">जनगणना निदेशालय, राजस्थान से संपर्क करने के लिए</p>
        </div>

        <div class="contact-grid">
            <div class="contact-info-col">
                <div class="panel">
                    <div class="panel-header"><h2>कार्यालय का पता</h2></div>
                    <div class="panel-body">
                        <div class="contact-detail">
                            <span class="contact-icon">📍</span>
                            <div>
                                <strong>जनगणना निदेशालय, राजस्थान</strong>
                                <p>जनगणना भवन, 6-बी, झालाना डूंगरी,,<br>
                                जयपुर - 302 006, राजस्थान</p>
                            </div>
                        </div>
                        <div class="contact-detail">
                            <span class="contact-icon">📞</span>
                            <div>
                                <strong>दूरभाष</strong>
                                <p>0141-2222001 / 0141-2222002</p>
                            </div>
                        </div>
                        <div class="contact-detail">
                            <span class="contact-icon">📠</span>
                            <div>
                                <strong>फैक्स</strong>
                                <p>0141-2222003</p>
                            </div>
                        </div>
                        <div class="contact-detail">
                            <span class="contact-icon">✉</span>
                            <div>
                                <strong>ई-मेल</strong>
                                <p>census-raj@gov.in</p>
                            </div>
                        </div>
                        <div class="contact-detail">
                            <span class="contact-icon">⏰</span>
                            <div>
                                <strong>कार्यालय समय</strong>
                                <p>सोमवार - शुक्रवार: प्रातः 9:30 से सायं 6:00 बजे<br>
                                (शनिवार, रविवार एवं सरकारी अवकाश को बंद)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="contact-form-col">
                <div class="panel">
                    <div class="panel-header"><h2>✉ संदेश भेजें</h2></div>
                    <div class="panel-body">
                        <div class="contact-form">
                            <div class="form-group">
                                <label>आपका नाम *</label>
                                <input type="text" class="form-control" placeholder="अपना पूरा नाम लिखें">
                            </div>
                            <div class="form-group">
                                <label>ई-मेल पता *</label>
                                <input type="email" class="form-control" placeholder="example@email.com">
                            </div>
                            <div class="form-group">
                                <label>दूरभाष संख्या</label>
                                <input type="tel" class="form-control" placeholder="मोबाइल / लैंडलाइन">
                            </div>
                            <div class="form-group">
                                <label>विषय *</label>
                                <select class="form-control">
                                    <option value="">-- विषय चुनें --</option>
                                    <option>जनगणना 2027 संबंधी जानकारी</option>
                                    <option>जनगणना 2011 डेटा</option>
                                    <option>प्रगणक भर्ती</option>
                                    <option>NPR संबंधी जानकारी</option>
                                    <option>अन्य</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>संदेश *</label>
                                <textarea class="form-control" rows="5" placeholder="अपना संदेश यहाँ लिखें..."></textarea>
                            </div>
                            <button class="btn btn-primary" onclick="submitForm()">📤 संदेश भेजें</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>
<script>
function submitForm() {
    alert('धन्यवाद! आपका संदेश प्राप्त हो गया है। हम शीघ्र आपसे संपर्क करेंगे।\n\nThank you! Your message has been received. We will contact you shortly.');
}
</script>
