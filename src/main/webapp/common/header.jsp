<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ include file="/common/head.jsp"%>

<%---- Page Loader --%>
<div id="loader-wrapper">
	<div id="loader"></div>

	<div class="loader-section section-left"></div>
	<div class="loader-section section-right"></div>

</div>
<nav class="navbar navbar-expand-lg">
	<div class="container-fluid">
		<a class="navbar-brand" href="index"> <i class="fas fa-film mr-2"></i>
			ONLINE ENTERTAIMENT
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
				<c:choose>
					<%-- truy cập vào biến currentUser trong phạm vi session. kiểm tra xem không rỗng hay không --%>
					<c:when test="${not empty sessionScope.currentUser}">
						<li class="nav-item"><a data-bs-toggle="modal"
							data-bs-target="#changePassModal"
							class="nav-link nav-link-1 active">Welcome,
								${sessionScope.currentUser.username} </a></li>
						<li class="nav-item"><a class="nav-link nav-link-1"
							href="favorites">My favorites</a></li>
						<li class="nav-item"><a class="nav-link nav-link-2"
							href="history">History</a></li>
						<li class="nav-item"><a class="nav-link nav-link-3"
							href="logout">Log out</a></li>
						<%---- Kiểm tra nếu currentUser là admin --> --%>
						<c:if test="${sessionScope.currentUser.isAdmin eq true}">
							<li class="nav-item"><a class="nav-link nav-link-4"
								href="admin/video">ADMINNISTRATION </a></li>
						</c:if>
					</c:when>



					<%-- và ngược lại, nếu có rỗng --%>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link nav-link-2"
							href="login">Login</a></li>
						<li class="nav-item"><a class="nav-link nav-link-3"
							href="register">Register</a></li>
						<li class="nav-item"><a class="nav-link nav-link-4"
							href="forgotPass">Forgot password</a></li>

					</c:otherwise>
				</c:choose>




			</ul>
		</div>
	</div>
</nav>



<div class="tm-hero d-flex justify-content-center align-items-center"
	data-parallax="scroll"
	data-image-src="<c:url value='/templates/user/img/hero.jpg'/>">
	<form class="d-flex tm-search-form">
		<input class="form-control tm-search-input" type="search"
			placeholder="Search" aria-label="Search">
		<button class="btn btn-outline-success tm-search-btn" type="submit">
			<i class="fas fa-search"></i>
		</button>
	</form>
</div>


<!-- Modal Change Pass -->
<div class="modal fade" id="changePassModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Change password</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<input type="password" id="currentPass"
						class="form-control rounded-0" placeholder="Current Password"
						required />
				</div>
				<div class="form-group">
					<input type="password" id="newPass" class="form-control rounded-0"
						placeholder="New Password" required />
				</div>
				<h5 style="color: red" id="messageChangePass"></h5>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning"
					data-bs-dismiss="modal">Close</button>
				<button type="button" id="changePassBtn" class="btn btn-warning">Save
					changes</button>
			</div>
		</div>
	</div>
</div>
<script>
	$('#changePassBtn')
			.click(
					function() {
						// Xóa nội dung của phần tử có id 'messageChangePass'
						$('#messageChangePass').text('');

						// Lấy giá trị của các trường nhập liệu 'currentPass' và 'newPass'
						var currentPass = $('#currentPass').val();
						var newPass = $('#newPass').val();

						// Tạo formData với các key tương ứng
						var formData = {
							'currentPass' : currentPass,
							'newPass' : newPass
						};

						// Sử dụng AJAX để gửi dữ liệu đến 'changePass' endpoint
						$
								.ajax({
									url : 'changePass',
									type : 'POST',
									data : formData
								})
								.then(
										function(data) {
											// Nếu thành công, hiển thị thông báo
											$('#messageChangePass')
													.text(
															'Mật khẩu đã được thay đổi thành công!');
										})
								.fail(
										function(error) {
											// Nếu thất bại, hiển thị thông báo lỗi
											$('#messageChangePass')
													.text(
															'Mật khẩu hiện tại không đúng, hãy thử lại!');
										});
					});
</script>

