<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디 찾기</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<style type="text/css">
input[type=button] {
	background: #c8936ed4;
	border: 1px solid #c8936ed4;
	color: white;
	border-radius: 6px;
}
span.span{
	color: #c8936ed4;
}
a{
	font-size: 20px;
	font-weight: bold;
}
</style>
<jsp:include page="/WEB-INF/common/header.jsp" />
</head>
<body>
	<section id="hero" style="height: 200px;">
		<div class="hero-container">
			<div id="heroCarousel" data-bs-interval="5000"
				class="carousel slide carousel-fade" data-bs-ride="carousel">
				<ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

				<div class="carousel-inner" role="listbox">

					<!-- Slide 1 -->
					<div class="carousel-item active"
						style="background-image: url(resources/assets/img/slide/cate1.jpg); height: 500px;">

						<h2 class="animate__animated animate__fadeInDown"
							style="text-align: center; line-height: 200px;">아이디 찾기</h2>

					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="d-flex align-items-center justify-content-center"
		style="height: 70vh;">
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<div class="card border-0">
					<div class="card-body">
						<br>
						<div class="row">

							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="email">이메일</label>
									<div class="col-6">
										<input class="form-control" type="email" id="email"
											placeholder="이메일을 입력해주세요" required autofocus>

									</div>
									<input type="button" value="보내기" class="col-3"
										onclick="validateForm(); emailCheck()">
									<div class="col-3"></div>
									<div class="col-6">
										<span class="span" id="emailCheck"></span>
									</div>
								</div>

							</div>
							<div class="card-body">
								<div class="form-group row">
									<label class="col-3 col-form-label" for="number">인증번호</label>
									<div class="col-6">
										<input class="form-control" type="text" id="number"
											placeholder="인증번호 입력">
									</div>
									<input type="button" value="확인" class="col-3"
										onclick="validateForm(); numCheck(document.getElementById('number').value); validate()">
									<div class="col-3"></div>
									<div class="col-7">
										<span class="span" id="time"></span>
									</div>
								</div>
							</div>
							<div class="card-body">
							<div class="form-group row">
								<div class="col-3"></div>
								<div class="col-7">
									<span class="span" id="show"></span>
								</div>
								</div>
								<div class="card-body">
								<div class="form-group row">
								<div class="col-6">
									<a href="/searchPwd">비밀번호 찾기</a>
								</div>
								<div class="col-6 text-right">
									<a href="/login.do">돌아가기</a>
								</div>
								</div>
							</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="status" value="id">

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/user/js/idPwdFind.js"></script>
	<script>
        function numCheck(number){
        	let pluralId = [];
        	let someId = [];
            if(num != 0){
                if(num == number && time > 0){
                	
                	for(var z=0; z<data.id.length; z++){
                		pluralId.push(data.id[z].id);
                	}       
                	for(var x=0; x<pluralId.length; x++){
                		someId.push("<span style='color: #505050; cursor: pointer;' onClick='du(this)'>"+pluralId[x]+"</span>")
                	}
                	const concatPluralId = someId.join("<span style='color: #505050';>, </span>");
                    clearInterval(interval);
                    document.getElementById('time').innerHTML = '인증완료';
                    document.getElementById('show').innerHTML = "아이디는 " + concatPluralId + "입니다.";
                }else if(time <= 0){
                    document.getElementById('time').innerHTML = '인증시간 만료';
                }
            }
        }
        
    	function du(event){
    		  var temp = document.createElement("textarea");
    		  temp.value = event.innerText;
    		  document.body.appendChild(temp);
    		  temp.select();
    		  document.execCommand("copy");
    		  document.body.removeChild(temp);
    		  alert("복사되었습니다.");
    		}	
    
    </script>

	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>
</html>