<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
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
					<h2 class="tm-text-primary mb-5">Forgot Password</h2>
				</center>
					
					<div class="form-group tm-contact-form mx-auto">
						<input type="text" name="email" id="email" class="form-control rounded-0"
							placeholder="Email" required />
					</div>
					


					<div class="form-group tm-text-right tm-contact-form mx-auto">
						<button type="submit" id="sendBtn" class="btn btn-primary">Send</button>
						<h5 style="color: red" id="messageReturn"></h5>
					</div>
			</div>


		</div>

	</div>
	<!-- container-fluid, tm-container-content -->


	<!-- end body -->
	<%@ include file="/common/footer.jsp"%>
</body>
<script>
$('#sendBtn').click(function(){
	$('messageReturn').text('');
	var email = $('#email').val();
	var formData = {'email':email};
	$.ajax({
		url: 'forgotPass',
		type: 'POST',
		data: formData
	}).then(function(data){
		$('#messageReturn').text('Mật khẩu đã được đặt lại, hãy kiểm tra email của bạn!');
		setTimeout(function(){
			window.location.href = 'http://localhost:8080/asmJava4/index';
		},5*1000);
	}).fail(function(error){
		$('#messageReturn').text('Không kết nối được thông tin của bạn, hãy thử lại!');
	});
});
</script>
</html>