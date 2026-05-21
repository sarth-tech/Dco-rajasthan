<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

<title>Media Gallery</title>

<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/style.css">

<style>

.media-gallery{
padding:30px;
}

.gallery-header{
text-align:center;
margin-bottom:30px;
}

.gallery-tabs{
display:flex;
justify-content:center;
gap:20px;
margin-bottom:25px;
}

.tab-btn{

padding:10px 20px;

border:none;

background:#eee;

cursor:pointer;

border-radius:6px;
}

.tab-btn.active{
background:#0c4a6e;
color:white;
}

.media-grid{

display:grid;

grid-template-columns:
repeat(auto-fill,minmax(300px,1fr));

gap:25px;
}

.media-item{

background:white;

border-radius:10px;

overflow:hidden;

box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.media-preview{

height:220px;

overflow:hidden;
}

.media-preview img,
.media-preview video{

width:100%;
height:100%;

object-fit:cover;
}

.media-info{
padding:15px;
}

.media-title{
font-weight:bold;
margin-bottom:8px;
}

.media-meta{

display:flex;
justify-content:space-between;

font-size:13px;

color:gray;
margin-bottom:10px;
}

.action-btn{

padding:8px 15px;

border:none;

background:#0c4a6e;

color:white;

cursor:pointer;

border-radius:6px;
}

.modal{

display:none;

position:fixed;

top:0;
left:0;

width:100%;
height:100%;

background:rgba(0,0,0,.85);

z-index:999;
}

.modal-content{

width:90%;

max-width:900px;

margin:5% auto;

text-align:center;
}

.close{

font-size:40px;

color:white;

cursor:pointer;
}

</style>

</head>

<body>

<%@ include file="header.jsp" %>

<div class="container">

<div class="media-gallery">

<div class="gallery-header">

<h1>मीडिया गैलरी</h1>

<p>
Photos and videos from Rajasthan Census activities
</p>

</div>


<div class="gallery-tabs">

<button
class="tab-btn active"
onclick="showTab('all')">

All

</button>

<button
class="tab-btn"
onclick="showTab('images')">

Images

</button>

<button
class="tab-btn"
onclick="showTab('videos')">

Videos

</button>

</div>


<!-- ALL -->

<div
id="all-tab"
class="media-grid">

<c:forEach
var="media"
items="${allMedia}">

<div class="media-item">

<div class="media-preview">

<c:if test="${media.fileType=='image'}">

<img
src="${pageContext.request.contextPath}/media/files/${media.fileName}">

</c:if>

<c:if test="${media.fileType=='video'}">

<video>

<source
src="${pageContext.request.contextPath}/media/files/${media.fileName}">

</video>

</c:if>

</div>

<div class="media-info">

<div class="media-title">

${media.originalFileName}

</div>

<div class="media-meta">

<span>
${media.uploadDate.toLocalDate()}
</span>

<span>
${media.fileType}
</span>

</div>

<div class="media-actions">

<c:if test="${media.fileType=='image'}">

<button
class="action-btn"

onclick="openModal(
'${pageContext.request.contextPath}/media/files/${media.fileName}'
)">

View

</button>

</c:if>


<c:if test="${media.fileType=='video'}">

<button
class="action-btn"

onclick="openVideoModal(
'${pageContext.request.contextPath}/media/files/${media.fileName}'
)">

Play

</button>

</c:if>

</div>

</div>

</div>

</c:forEach>

</div>



<!-- IMAGES -->

<div
id="images-tab"
class="media-grid"
style="display:none">

<c:forEach
var="media"
items="${images}">

<div class="media-item">

<div class="media-preview">

<img
src="${pageContext.request.contextPath}/media/files/${media.fileName}">

</div>

<div class="media-info">

<div class="media-title">

${media.originalFileName}

</div>

<button
class="action-btn"

onclick="openModal(
'${pageContext.request.contextPath}/media/files/${media.fileName}'
)">

View

</button>

</div>

</div>

</c:forEach>

</div>



<!-- VIDEOS -->

<div
id="videos-tab"
class="media-grid"
style="display:none">

<c:forEach
var="media"
items="${videos}">

<div class="media-item">

<div class="media-preview">

<video>

<source
src="${pageContext.request.contextPath}/media/files/${media.fileName}">

</video>

</div>

<div class="media-info">

<div class="media-title">

${media.originalFileName}

</div>

<button
class="action-btn"

onclick="openVideoModal(
'${pageContext.request.contextPath}/media/files/${media.fileName}'
)">

Play

</button>

</div>

</div>

</c:forEach>

</div>


</div>

</div>


<div
id="imageModal"
class="modal">

<div class="modal-content">

<span
class="close"
onclick="closeModal()">

×

</span>

<img
id="modalImage"
style="max-width:100%;
max-height:80vh">

</div>

</div>


<script>

function showTab(tab){

document
.querySelectorAll(
'.media-grid'
)

.forEach(

x=>x.style.display='none'
);

document
.getElementById(
tab+'-tab'
)
.style.display='grid';

document
.querySelectorAll(
'.tab-btn'
)
.forEach(

b=>b.classList.remove(
'active'
)
);

event.target
.classList.add(
'active'
);

}


function openModal(src){

document
.getElementById(
'modalImage'
)
.src=src;

document
.getElementById(
'imageModal'
)
.style.display='block';

}


function closeModal(){

document
.getElementById(
'imageModal'
)
.style.display='none';

}

</script>

<%@ include file="footer.jsp" %>

</body>
</html>