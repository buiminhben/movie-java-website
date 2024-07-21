<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<%@ include file="/common/head.jsp"%>
<!--
    
TemplateMo 556 Catalog-Z

https://templatemo.com/tm-556-catalog-z

-->
</head>
<body>
	<!-- Page Loader -->
	<%@ include file="/common/header.jsp"%>

	<!-- Body -->
	<div class="container-fluid tm-mt-60">
		<div class="row tm-mb-50">
			<div class="col-lg-12 col-12 mb-5">
				<center>
					<h2 class="tm-text-primary mb-5">Login</h2>
				</center>
				<form id="contact-form" action="" method="POST"
					class="tm-contact-form mx-auto">
					<div class="form-group">
						<input type="text" name="username" class="form-control rounded-0"
							placeholder="Name" required />
					</div>
					<div class="form-group">
						<input type="password" name="password"
							class="form-control rounded-0" placeholder="Password" required />
					</div>


					<div class="form-group tm-text-right">
						<button type="submit" class="btn btn-primary">Đăng Nhập</button>
					</div>
				</form>
			</div>


		</div>

	</div>
	<!-- container-fluid, tm-container-content -->


	<!-- end body -->
	<%@ include file="/common/footer.jsp"%>
</body>
</html>