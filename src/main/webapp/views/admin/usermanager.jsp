<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Users</title>
  
</head>
  <%@ include file="/common/head.jsp" %>
<body>
<%-- header --%>
<%@ include file="/views/admin/headeradmin.jsp" %>


<%-- body --%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/daba042c9f.js"
	crossorigin="anonymous"></script>
</head>
<body class="">
<div class="card">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
				data-bs-target="#video-edition-tab" type="button" role="tab"
				aria-controls="home-tab-pane" aria-selected="true">USER
				EDITION</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
				data-bs-target="#video-list-tab" type="button" role="tab"
				aria-controls="profile-tab-pane" aria-selected="false">USER
				LIST</button>
		</li>

	</ul>
	<div class="tab-content border " id="myTabContent">
		<!-- user edition -->
		<div class="tab-pane fade show active" id="video-edition-tab"
			role="tabpanel" aria-labelledby="home-tab" tabindex="0">
			<div class="card-body">
				<div class="row">
					<div class="col-md-6">
						<label for="" class="form-label">USERNAME?</label> <input
							type="text" class="form-control">
					</div>
					<div class="col-md-6">
						<label for="" class="form-label">PASSWORD?</label> <input
							type="text" class="form-control">
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<label for="" class="form-label">FULLNAME?</label> <input
							type="text" class="form-control">
					</div>
					<div class="col-md-6">
						<label for="" class="form-label">EMAIL ADDRESS?</label> <input
							type="text" class="form-control">
					</div>
				</div>
			</div>
			<div class="card-footer text-end">
				<button class="btn btn-danger ">Update</button>
				<button class="btn btn-danger ">Delete</button>
			</div>

		</div>

		<!-- user list -->
		<div class="tab-pane fade" id="video-list-tab" role="tabpanel"
			aria-labelledby="profile-tab" tabindex="0">

			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th scope="col">Username</th>
						<th scope="col">Password</th>
						
						<th scope="col">Email</th>
						<th scope="col">Role</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="user" items="${users}">
				<tr>
						<td>${user.username}</td>
						<td>${user.password}</td>
						
						<td>${user.email}</td>
						<td>${user.isAdmin ? 'admin': 'user'}</td>

						<td><a href="">edit</a></td>
					</tr>
				</c:forEach>
					

				</tbody>

			</table>
			<div class="card-footer d-flex justify-content-between">
				<div>85 videos</div>
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


</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

</body>
</html>