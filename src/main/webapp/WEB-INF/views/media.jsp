<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Media Gallery - Rajasthan Census</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <style>
        .media-gallery {
            padding: 24px 0;
        }
        .gallery-header {
            text-align: center;
            margin-bottom: 32px;
        }
        .gallery-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
            margin-bottom: 32px;
        }
        .stat-card {
            background: var(--bg-white);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 20px;
            text-align: center;
            box-shadow: var(--shadow);
        }
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: var(--gov-blue);
            margin-bottom: 8px;
        }
        .stat-label {
            color: var(--text-mid);
            font-size: 0.9rem;
        }
        .gallery-tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 24px;
            border-bottom: 1px solid var(--border);
        }
        .tab-btn {
            padding: 12px 24px;
            background: none;
            border: none;
            border-bottom: 3px solid transparent;
            color: var(--text-mid);
            cursor: pointer;
            font-size: 0.9rem;
            transition: all 0.2s;
        }
        .tab-btn.active {
            color: var(--gov-blue);
            border-bottom-color: var(--gov-blue);
        }
        .tab-btn:hover {
            color: var(--gov-blue);
        }
        .media-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 20px;
        }
        .media-item {
            background: var(--bg-white);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .media-item:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }
        .media-preview {
            position: relative;
            height: 200px;
            overflow: hidden;
            background: #f8f9fa;
        }
        .media-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .media-preview video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .video-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0,0,0,0.7);
            color: white;
            padding: 12px;
            border-radius: 50%;
            font-size: 1.2rem;
        }
        .media-info {
            padding: 16px;
        }
        .media-title {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 8px;
            font-size: 0.9rem;
        }
        .media-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 0.8rem;
            color: var(--text-light);
            margin-bottom: 8px;
        }
        .media-actions {
            display: flex;
            gap: 8px;
        }
        .action-btn {
            padding: 6px 12px;
            border: 1px solid var(--border);
            background: white;
            color: var(--text-mid);
            border-radius: 4px;
            font-size: 0.8rem;
            cursor: pointer;
            transition: all 0.2s;
        }
        .action-btn:hover {
            background: var(--gov-blue);
            color: white;
            border-color: var(--gov-blue);
        }
        .delete-btn:hover {
            background: #dc3545;
            color: white;
            border-color: #dc3545;
        }
        .upload-section {
            background: var(--bg-white);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 24px;
            margin-bottom: 32px;
            text-align: center;
        }
        .upload-form {
            max-width: 500px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 16px;
            text-align: left;
        }
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-dark);
        }
        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--border);
            border-radius: var(--radius);
            font-family: var(--font-body);
        }
        .file-input-wrapper {
            position: relative;
            display: inline-block;
            width: 100%;
        }
        .file-input {
            position: absolute;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }
        .file-input-label {
            display: block;
            padding: 12px;
            border: 2px dashed var(--border);
            border-radius: var(--radius);
            background: var(--bg-light);
            text-align: center;
            cursor: pointer;
            transition: all 0.2s;
        }
        .file-input-label:hover {
            border-color: var(--gov-blue);
            background: rgba(0,75,135,0.05);
        }
        .submit-btn {
            background: var(--gov-blue);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: var(--radius);
            cursor: pointer;
            font-size: 0.9rem;
            font-weight: 500;
            transition: background 0.2s;
        }
        .submit-btn:hover {
            background: var(--gov-blue-dark);
        }
        .alert {
            padding: 12px 16px;
            border-radius: var(--radius);
            margin-bottom: 16px;
            font-weight: 500;
        }
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .empty-state {
            text-align: center;
            padding: 48px;
            color: var(--text-light);
        }
        .empty-state h3 {
            color: var(--text-mid);
            margin-bottom: 16px;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <main class="container">
        <div class="media-gallery">
            <div class="gallery-header">
                <h1>Media Gallery</h1>
                <p>Photos and videos from Rajasthan Census activities</p>
            </div>

            <!-- Upload Section -->
            <div class="upload-section">
                <h2>Upload New Media</h2>
                <form class="upload-form" action="${pageContext.request.contextPath}/media/upload" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="form-label" for="file">Select File</label>
                        <div class="file-input-wrapper">
                            <input type="file" id="file" name="file" class="file-input" accept="image/*,video/*" required>
                            <label for="file" class="file-input-label">
                                <span id="file-label">Choose image or video file...</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="form-label" for="description">Description (Optional)</label>
                        <input type="text" id="description" name="description" class="form-input" placeholder="Enter description...">
                    </div>
                    <button type="submit" class="submit-btn">Upload File</button>
                </form>
            </div>

            <!-- Success/Error Messages -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>

            <!-- Gallery Stats -->
            <div class="gallery-stats">
                <div class="stat-card">
                    <div class="stat-number">${totalCount}</div>
                    <div class="stat-label">Total Files</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">${imageCount}</div>
                    <div class="stat-label">Images</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">${videoCount}</div>
                    <div class="stat-label">Videos</div>
                </div>
            </div>

            <!-- Gallery Tabs -->
            <div class="gallery-tabs">
                <button class="tab-btn active" onclick="showTab('all')">All Media</button>
                <button class="tab-btn" onclick="showTab('images')">Images</button>
                <button class="tab-btn" onclick="showTab('videos')">Videos</button>
            </div>

            <!-- Media Grid -->
            <div id="all-tab" class="media-grid">
                <c:forEach var="media" items="${allMedia}">
                    <div class="media-item">
                        <div class="media-preview">
                            <c:if test="${media.fileType == 'image'}">
                                <img src="${pageContext.request.contextPath}/media/files/${media.fileName}" alt="${media.originalFileName}">
                            </c:if>
                            <c:if test="${media.fileType == 'video'}">
                                <video>
                                    <source src="${pageContext.request.contextPath}/media/files/${media.fileName}" type="${media.mimeType}">
                                </video>
                                <div class="video-overlay">▶</div>
                            </c:if>
                        </div>
                        <div class="media-info">
                            <div class="media-title">${media.originalFileName}</div>
                            <div class="media-meta">
                                <span><fmt:formatDate value="${media.uploadDate}" pattern="MMM dd, yyyy"/></span>
                                <span>${media.fileType}</span>
                            </div>
                            <c:if test="${not empty media.description}">
                                <div style="font-size: 0.8rem; color: var(--text-light); margin-bottom: 8px;">${media.description}</div>
                            </c:if>
                            <div class="media-actions">
                                <c:if test="${media.fileType == 'image'}">
                                    <button class="action-btn" onclick="openModal('${pageContext.request.contextPath}/media/files/${media.fileName}', '${media.originalFileName}')">View</button>
                                </c:if>
                                <c:if test="${media.fileType == 'video'}">
                                    <button class="action-btn" onclick="openVideoModal('${pageContext.request.contextPath}/media/files/${media.fileName}', '${media.originalFileName}', '${media.mimeType}')">Play</button>
                                </c:if>
                                <form action="${pageContext.request.contextPath}/media/delete/${media.id}" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this file?')">
                                    <button type="submit" class="action-btn delete-btn">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty allMedia}">
                    <div class="empty-state">
                        <h3>No media files uploaded yet</h3>
                        <p>Upload some photos and videos to get started!</p>
                    </div>
                </c:if>
            </div>

            <div id="images-tab" class="media-grid" style="display: none;">
                <c:forEach var="media" items="${images}">
                    <div class="media-item">
                        <div class="media-preview">
                            <img src="${pageContext.request.contextPath}/media/files/${media.fileName}" alt="${media.originalFileName}">
                        </div>
                        <div class="media-info">
                            <div class="media-title">${media.originalFileName}</div>
                            <div class="media-meta">
                                <span><fmt:formatDate value="${media.uploadDate}" pattern="MMM dd, yyyy"/></span>
                                <span>${media.fileType}</span>
                            </div>
                            <c:if test="${not empty media.description}">
                                <div style="font-size: 0.8rem; color: var(--text-light); margin-bottom: 8px;">${media.description}</div>
                            </c:if>
                            <div class="media-actions">
                                <button class="action-btn" onclick="openModal('${pageContext.request.contextPath}/media/files/${media.fileName}', '${media.originalFileName}')">View</button>
                                <form action="${pageContext.request.contextPath}/media/delete/${media.id}" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this file?')">
                                    <button type="submit" class="action-btn delete-btn">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty images}">
                    <div class="empty-state">
                        <h3>No images uploaded yet</h3>
                        <p>Upload some photos to get started!</p>
                    </div>
                </c:if>
            </div>

            <div id="videos-tab" class="media-grid" style="display: none;">
                <c:forEach var="media" items="${videos}">
                    <div class="media-item">
                        <div class="media-preview">
                            <video>
                                <source src="${pageContext.request.contextPath}/media/files/${media.fileName}" type="${media.mimeType}">
                            </video>
                            <div class="video-overlay">▶</div>
                        </div>
                        <div class="media-info">
                            <div class="media-title">${media.originalFileName}</div>
                            <div class="media-meta">
                                <span><fmt:formatDate value="${media.uploadDate}" pattern="MMM dd, yyyy"/></span>
                                <span>${media.fileType}</span>
                            </div>
                            <c:if test="${not empty media.description}">
                                <div style="font-size: 0.8rem; color: var(--text-light); margin-bottom: 8px;">${media.description}</div>
                            </c:if>
                            <div class="media-actions">
                                <button class="action-btn" onclick="openVideoModal('${pageContext.request.contextPath}/media/files/${media.fileName}', '${media.originalFileName}', '${media.mimeType}')">Play</button>
                                <form action="${pageContext.request.contextPath}/media/delete/${media.id}" method="post" style="display: inline;" onsubmit="return confirm('Are you sure you want to delete this file?')">
                                    <button type="submit" class="action-btn delete-btn">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty videos}">
                    <div class="empty-state">
                        <h3>No videos uploaded yet</h3>
                        <p>Upload some videos to get started!</p>
                    </div>
                </c:if>
            </div>
        </div>
    </main>

    <!-- Image Modal -->
    <div id="imageModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <img id="modalImage" src="" alt="" style="max-width: 100%; max-height: 80vh;">
            <div id="modalCaption" style="text-align: center; margin-top: 10px; color: var(--text-mid);"></div>
        </div>
    </div>

    <!-- Video Modal -->
    <div id="videoModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <video id="modalVideo" controls style="max-width: 100%; max-height: 80vh;">
                <source id="modalVideoSource" src="" type="">
                Your browser does not support the video tag.
            </video>
            <div id="videoModalCaption" style="text-align: center; margin-top: 10px; color: var(--text-mid);"></div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script>
        // File input handling
        document.getElementById('file').addEventListener('change', function(e) {
            const file = e.target.files[0];
            const label = document.getElementById('file-label');
            if (file) {
                label.textContent = file.name;
            } else {
                label.textContent = 'Choose image or video file...';
            }
        });

        // Tab switching
        function showTab(tabName) {
            // Hide all tabs
            document.getElementById('all-tab').style.display = 'none';
            document.getElementById('images-tab').style.display = 'none';
            document.getElementById('videos-tab').style.display = 'none';

            // Remove active class from all buttons
            document.querySelectorAll('.tab-btn').forEach(btn => btn.classList.remove('active'));

            // Show selected tab
            document.getElementById(tabName + '-tab').style.display = 'grid';

            // Add active class to clicked button
            event.target.classList.add('active');
        }

        // Modal functions
        function openModal(imageSrc, caption) {
            document.getElementById('modalImage').src = imageSrc;
            document.getElementById('modalCaption').textContent = caption;
            document.getElementById('imageModal').style.display = 'block';
        }

        function openVideoModal(videoSrc, caption, mimeType) {
            document.getElementById('modalVideoSource').src = videoSrc;
            document.getElementById('modalVideoSource').type = mimeType;
            document.getElementById('modalVideo').load();
            document.getElementById('videoModalCaption').textContent = caption;
            document.getElementById('videoModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('imageModal').style.display = 'none';
            document.getElementById('videoModal').style.display = 'none';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const imageModal = document.getElementById('imageModal');
            const videoModal = document.getElementById('videoModal');
            if (event.target == imageModal) {
                imageModal.style.display = 'none';
            }
            if (event.target == videoModal) {
                videoModal.style.display = 'none';
            }
        }
    </script>

    <style>
        .modal {
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.9);
        }
        .modal-content {
            position: relative;
            margin: 5% auto;
            padding: 20px;
            width: 90%;
            max-width: 800px;
            text-align: center;
        }
        .close {
            position: absolute;
            top: -10px;
            right: -10px;
            color: white;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            background: rgba(0,0,0,0.5);
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .close:hover {
            background: rgba(0,0,0,0.8);
        }
    </style>
</body>
</html>