<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Reports</title>
  
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
</head>
<body>
	<div class="container-fluid card">
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active" id="nav-home-tab"
					data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
					role="tab" aria-controls="nav-home" aria-selected="true">FAVORITES</button>
				<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
					data-bs-target="#nav-profile" type="button" role="tab"
					aria-controls="nav-profile" aria-selected="false">FAVORITE</button>
				<button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
					data-bs-target="#nav-contact" type="button" role="tab"
					aria-controls="nav-contact" aria-selected="false">SHARED
					FRIENDS</button>
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<!--FAVORITES -->
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab" tabindex="0">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th scope="col">VIDEO TITLE</th>
							<th scope="col">FAVORITE COUNT</th>
							<th scope="col">LATEST DATE</th>
							<th scope="col">OLDEST DATE</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>


					</tbody>
				</table>
			</div>

			<!-- FAVORITE USERS -->
			<div class="tab-pane fade" id="nav-profile" role="tabpanel"
				aria-labelledby="nav-profile-tab" tabindex="0">
				<div class="d-flex my-3 ">
					<div class="fw-bolder" style="width: 150px;">VIDEO TITLE?</div>
					<select class="form-select" aria-label="Default select example">
						<option selected>Lâu ghê mới gặp</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
				</div>

				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th scope="col">USERNAME</th>
							<th scope="col">FULLNAME</th>
							<th scope="col">EMAIL</th>
							<th scope="col">FAVORITE DATE</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>


					</tbody>
				</table>

			</div>

			<!-- SHARED FRIENDS -->
			<div class="tab-pane fade" id="nav-contact" role="tabpanel"
				aria-labelledby="nav-contact-tab" tabindex="0">
				<div class="d-flex my-3 ">
					<div class="fw-bolder" style="width: 150px;">VIDEO TITLE?</div>
					<select class="form-select" aria-label="Default select example">
						<option selected>Lâu ghê mới gặp</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
				</div>

				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th scope="col">SENDER NAME</th>
							<th scope="col">SENDER EMAIL</th>
							<th scope="col">RECEIVER EMAIL</th>
							<th scope="col">SENT DATE</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<td>Mark</td>
							<td>Otto</td>
							<td>@mdo</td>
						</tr>


					</tbody>
				</table>

			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>


</body>
</html>