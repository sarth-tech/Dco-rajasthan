<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="header.jsp" %>

<style>

.admin-media{

padding:30px;
}

.upload-card{

background:white;

padding:25px;

border-radius:10px;

box-shadow:0 2px 10px rgba(0,0,0,.1);

margin-bottom:30px;
}

.form-group{

margin-bottom:20px;
}

.form-group label{

display:block;

margin-bottom:8px;

font-weight:bold;
}

.form-control{

width:100%;

padding:10px;

border:1px solid #ddd;

border-radius:6px;
}

.upload-btn{

background:#0c4a6e;

color:white;

border:none;

padding:12px 20px;

border-radius:6px;

cursor:pointer;
}

.upload-btn:hover{

background:#0a3550;
}

.admin-gallery{

display:grid;

grid-template-columns:
repeat(auto-fill,minmax(250px,1fr));

gap:20px;
}

.media-card{

background:white;

padding:15px;

border-radius:10px;

box-shadow:0 2px 10px rgba(0,0,0,.1);

text-align:center;
}

.media-card img,
.media-card video{

width:100%;

height:180px;

object-fit:cover;

border-radius:8px;

margin-bottom:10px;
}

.delete-btn{

background:#dc3545;

color:white;

border:none;

padding:10px 15px;

border-radius:6px;

cursor:pointer;
}

.delete-btn:hover{

background:#b91c1c;
}

.alert{

padding:12px;

margin-bottom:20px;

border-radius:6px;
}

.success{
background:#d4edda;
}

.error{
background:#f8d7da;
}

</style>

<div class="container admin-media">

<div class="upload-card">

<h2>Upload Media</h2>

<c:if test="${not empty success}">
<div class="alert success">
${success}
</div>
</c:if>

<c:if test="${not empty error}">
<div class="alert error">
${error}
</div>
</c:if>

<form
action="${pageContext.request.contextPath}/media/upload"
method="post"
enctype="multipart/form-data">

<div class="form-group">

<label>Select File</label>

<input
type="file"
name="file"
accept="image/*,video/*"
class="form-control"
required>

</div>

<div class="form-group">

<label>Description</label>

<input
type="text"
name="description"
class="form-control"
placeholder="Enter description">

</div>

<div class="form-group">

<label>Category</label>

<select
name="category"
class="form-control">

<option value="Independence Day">
Independence Day
</option>

<option value="Census Campaign">
Census Campaign
</option>

<option value="Training Program">
Training Program
</option>

<option value="Republic Day">
Republic Day
</option>

<option value="General">
General
</option>

</select>

</div>

<button
type="submit"
class="upload-btn">

Upload

</button>

</form>

</div>


<h2>Uploaded Files</h2>

<div class="admin-gallery">

<c:forEach
var="media"
items="${allMedia}">

<div class="media-card">

<c:if test="${media.fileType=='image'}">

<img
src="${pageContext.request.contextPath}/media/files/${media.fileName}">

</c:if>

<c:if test="${media.fileType=='video'}">

<video controls>

<source
src="${pageContext.request.contextPath}/media/files/${media.fileName}">

</video>

</c:if>

<h4>

${media.originalFileName}

</h4>

<p>

${media.category}

</p>

<form
action="${pageContext.request.contextPath}/media/delete/${media.id}"
method="post"

onsubmit="return confirm(
'Delete file?'
)">

<button
type="submit"
class="delete-btn">

Delete

</button>

</form>

</div>

</c:forEach>

</div>

</div>

<%@ include file="footer.jsp" %>