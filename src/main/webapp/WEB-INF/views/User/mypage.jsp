<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
section {
	width: 1000px;
	margin: 0 auto;
}

</style>
<jsp:include page="/WEB-INF/common/header.jsp" />
</head>
<body>


	<section>
		<ul class="nav nav-pills nav-justified">
		  <li class="nav-item" >
		    <a class="nav-link active" href="/mypage.do" style="background: #c8936ed4; color:white;">회원 정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/cate.do" style="background: #c8936ed4; color:white;">장바 구니</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/products/payMypage" style="background: #c8936ed4; color:white;">결제 내역</a>
		  </li>
		</ul>
	</section>


	<div class="container" style="border-top:2px solid #c8936ed4;padding:40px 0;">
		<fieldset style="
    width: fit-content;
    margin: 0 auto;
">

	<form action="/update.do?id=${login_info.id}" method="post" name="mypage" id="mypage" style="width:950px;border:2px solid #c8936ed4;padding-bottom: 50px;">
		<table>
		<tr style="border-top:20px solid white;">
			<td style="padding-left: 80px;"><label for="id">아이디</label></td>
			<td style="padding-left: 150px;">${login_info.id}<br></td>
		</tr>
		<tr style="border-top:20px solid white;">
			<td style="padding-left: 80px;"><label for="pwd">비밀번호</label></td>
			<td style="padding-left: 150px;"><input type="password" class="pwd" id="pwd" name="pwd" required><br>
			</td>
			
		</tr>
		
		<tr style="border-top:20px solid white;">
			<td style="padding-left: 80px;"><label for="pwd">비밀번호 확인</label></td>

			<td style="padding-left: 150px;"><input type="password" id="pwd2" name="pwd2" required onkeyup="passConfirm()"><br><span id="confirmMsg"></span></td>

			
		</tr>
		<tr style="border-top:20px solid white;">
			<td style="padding-left: 80px;"><label for="name">이름</label></td>
			<td style="padding-left: 150px;">${login_info.name}<br></td>
		</tr>
		<tr style="border-top:20px solid white;">
			<td style="padding-left: 80px;"><label for="age">나이</label></td>
			<td style="padding-left: 150px;">${login_info.age}<br></td>
		</tr>
		<tr style="border-top:20px solid white;">
			<td style="padding-left: 80px;"><label for="gender">성별</label></td>
			<td style="padding-left: 150px;">${login_info.gender}<br></td>
		</tr>
		<tr style="border-top:20px solid white;">
			<td style="padding-left: 80px;"><label for="email">이메일</label></td>
			<td style="padding-left: 150px;"><input type="text" class="myinfo_email" id="myinfo_email" name="email" value="${login_info.email}"><br></td>
		</tr>
		<tr style="border-top:20px solid white;">
			<td  style="padding-left: 80px;"><label for="phone">휴대전화</label></td>
			<td style="padding-left: 150px;"><input type="tel" name="phone" value="${login_info.phone}"><br></td>
		</tr>
		<tr style="border-top:20px solid white;">
		
			<td><label for="adr"></label></td>
			<td style="width:310px"><input type="text" class="address_input_1" name=adr id="adr" placeholder="우편번호" value="${myinfo_adr1}" ><br></td>	
			<td style="padding-left: 150px;"><input type="button" class="adrchk" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
		</tr>
		<tr style="border-top:20px solid white;">
			<td style="padding-left: 80px;">주소</td>
			<td colspan="2" style="padding-left: 150px;"><input type="text" size="50" class="address_input_2" name="adr2" id="adr2" placeholder="주소" value="${myinfo_adr2}" required></td><br>
			
		</tr>
		<tr style="border-top:20px solid white;">
			<td></td>
			<td colspan="2" style="padding-left: 150px;"><input type="text" size="50" class="address_input_3" name="adr3" id="adr3" placeholder="상세주소" value="${myinfo_adr3}" required></td>
		</tr>
		<tr style="border-top:20px solid white;">
		<br>
			<td colspan="2" style="padding-left: 200px;">
			<br><br>
			<div class="row">

				<div class="col-md-4">
				<input type="submit" id="updateBtn" class="btn btn-primary" value="수정하기" style="background:#c8936ed4;border:#c8936ed4;color:white;" onclick="return UpdateCheck()">
  					
				</div>
				<div class="col-md-4">
				<button type="button" class="btn btn-primary" data-toggle="modal" style="background:#c8936ed4;border:#c8936ed4;color:white;" data-target="#exampleModal" >
					탈퇴하기
				</button>
				</div>
				<div class="col-md-4">
				<button type="button" class="btn btn-primary" style="background:#c8936ed4;border:#c8936ed4;color:white;" onclick="location.href='/index.jsp'">
  					메인으로
				</button>
				</div>
			</div>
			</td>
		</tr>
		</table>
		
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	탈퇴시 모든 버킷내역 및 주문내역이 삭제됩니다.<br> 
      	또한, 삭제된 정보는 다시 되돌릴 수 없습니다.<br>
      	탈퇴하시겠습니까?<br>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" onclick="location.href = '/delete.do'">탈퇴하기</button>
        <button type="reset" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  	</div>
	</div>
	</form>
	<div>
				<c:choose>
				<c:when test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:when>
				</c:choose>
			</div>
</fieldset>
	</div>




	<jsp:include page="/WEB-INF/common/footer.jsp" />
</body>

</html>