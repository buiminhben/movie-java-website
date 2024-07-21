<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${video.title}</title>
<%@ include file="/common/head.jsp"%>
<!--
    
TemplateMo 556 Catalog-Z

https://templatemo.com/tm-556-catalog-z

-->
</head>
<body>
	<!-- Page Loader -->
	<%@ include file="/common/header.jsp"%>

	<!-- body -->
	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">
			<h2 class="col-12 tm-text-primary">${video.title }</h2>
		</div>
		<div class="row tm-mb-90">
			<div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
				<iframe id="tm-video"
					src="https://www.youtube.com/embed/${video.href }"></iframe>


			</div>
			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-12"
				style="min-height: 500px !important">
				<div class="tm-bg-gray tm-video-details">
					<c:if test="${not empty sessionScope.currentUser }">
						<div class="text-center mb-5">
							
							<button id="likeOrUnlikeBtn"  class="btn btn-success tm-btn-big"> 
							<c:choose>
									<c:when test="${flagLikedBtn == true }">
								Unlike
								</c:when>
									<c:otherwise>Like</c:otherwise>
								</c:choose>


							</button>

						</div>
						<div class="text-center mb-5">
							<a href="#" class="btn btn-primary tm-btn-big">Share</a>

						</div>

					</c:if>


					<div class="mb-4">
						<h3 class="tm-text-gray-dark mb-3">Description</h3>
						<p>${video.description }</p>
					</div>
						<input type="hidden" id="videoIdHdn" value="${video.href}"/>
				</div>
			</div>
		</div>


	</div>
	<!-- container-fluid, tm-container-content -->



	<%@ include file="/common/footer.jsp"%>
<script>
    $('#likeOrUnlikeBtn').click(function(){
        var videoId = $('#videoIdHdn').val();
        $.ajax({
            url: 'video?action=like&id=' + videoId,
            // ^--- Đã thêm dấu phẩy để đóng cặp tham số trong object
        }).then(function(data){
            var text = $('#likeOrUnlikeBtn').text();
            if(text.indexOf('Like') != -1){
                // ^--- Đã sửa điều kiện kiểm tra
                $('#likeOrUnlikeBtn').text('Unlike');
                // ^--- Đã sửa id thành 'likeOrUnlikeBtn'
            } else {
                $('#likeOrUnlikeBtn').text('Like');
                // ^--- Đã sửa id thành 'likeOrUnlikeBtn'
            }
        }).fail(function(error){
            alert('Có lỗi xảy ra!');
            // ^--- Đã thay đổi thông báo lỗi
        });
    });
</script>

	
</body>
	
	
	

</html>