 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/head.jsp"%>
<%-- header --%>
<%@ include file="/views/admin/headeradmin.jsp" %>
<body class=" ">
	<div class="container-fluid card">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
					data-bs-target="#video-edition-tab" type="button" role="tab"
					aria-controls="home-tab-pane" aria-selected="true">VIDEO
					EDITION</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
					data-bs-target="#video-list-tab" type="button" role="tab"
					aria-controls="profile-tab-pane" aria-selected="false">VIDEO
					LIST</button>
			</li>

		</ul>

		<%-- xu ly form video --%>
<h3>${message }</h3>
		<c:url var="url" value="/admin/video" />
<form action="${url}" method="post">
		<div class="tab-content border " id="myTabContent">
			<!-- video edition -->
	
			<div  class="tab-pane fade show active" id="video-edition-tab"
				role="tabpanel" aria-labelledby="home-tab" tabindex="0">
				<div class="row my-3 ">
					<div class="col-md-5 text-center ">
<img alt=""  class="img-fluid" src="<c:url value='https://img.youtube.com/vi/${form.href}/maxresdefault.jpg'/>">
</div>
					<div class="col-md-7 pe-4">
					
						<label for="" class="form-label">YOUTUBE ID?</label> 
						<input value="${form.href }"
							type="text" class="form-control" name="href"> 
							
							<label for=""
							class="form-label">VIDEO TITLE?</label> 
							<input type="text" value ="${form.title }"
							class="form-control" name="title"> 
							
							<label for="" class="form-label">VIEW
							COUNT?</label> 
							<input type="text" value="${form.views }" class="form-control" name="views">
							
						<input type="checkbox" value="true" name="active" ${form.isActive ? 'checked' : ''}>ACTIVE 
						<input type="checkbox" value="false" name=active ${form.isActive ? '' : 'checked'}>INACTIVE
					</div>
				</div>


				<p  class="form-label ms-3">DESCRIPTION?</p>
				<textarea  cols="170" rows="4" class="ms-3" name="description" value="">${form.description}</textarea>
				<div class="card-footer text-end">
					<button formaction="${url}/create" class="btn btn-danger">Create</button>
					<button formaction="${url}/update" class="btn btn-danger">Update</button>
					<button formaction="${url}/delete" class="btn btn-danger">Delete</button>
					<button formaction="${url}" class="btn btn-danger">Reset</button>
				</div>

			</div>


			<!-- video list -->
			<div class="tab-pane fade" id="video-list-tab" role="tabpanel"
				aria-labelledby="profile-tab" tabindex="0">

				<table class="table table-hover table-bordered">
					<thead>
						<tr>
							<th scope="col">Youtube Id</th>
							<th scope="col">Video Title</th>
							<th scope="col">View Count</th>
							<th scope="col">Status</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
					 <c:set var="count" value="0" />
						<c:forEach var="video" items="${items}">
						<c:set var="count" value="${count + 1}" />
							<tr>

								<td>${video.href}</td>
								<td>${video.title}</td>
								<td>${video.views }</td>
								<td>${video.isActive ? 'On' : 'Off' }</td>

								<td><a href="${url}/edit/${video.href}">edit</a></td>
							</tr>
						</c:forEach>


					</tbody>

				</table>
				<div class="card-footer d-flex justify-content-between">
					<div>${count} videos</div>
					<div class="">
						<button class="btn btn-danger">
							<i class="fa-solid fa-backward-step"></i>
						</button>
						<button class="btn btn-danger">
							<i class="fa-solid fa-angles-left"></i>
						</button>
						<button class="btn btn-danger">
							<i class="fa-solid fa-forward"></i>
						</button>
						<button class="btn btn-danger">
							<i class="fa-solid fa-forward-step"></i>
						</button>
					</div>

				</div>

			</div>
		</div>
</form>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>

