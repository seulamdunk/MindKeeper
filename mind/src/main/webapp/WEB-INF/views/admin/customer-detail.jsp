<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>MindKeeper - Tables</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>

<body>


<div class="container">

    <form class="well form-horizontal" action=" " method="post"  id="contact_form">
<fieldset>

<!-- Form Name -->
<legend>회원 정보</legend>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">아이디</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  id="customerID" class="form-control"  type="text" readonly>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >이름</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input id="customerName" class="form-control"  type="text" readonly>
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">닉네임</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-tag"></i></span>
  <input id="customerNick" class="form-control"  type="text" readonly>
    </div>
  </div>
</div>


<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">전화번호</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input id="phoneNum" class="form-control" type="text" readonly>
    </div>
  </div>
</div>

<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">가입 날짜</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  <input id="createDate" class="form-control" type="text" readonly>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">작성한 게시글 수</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-comment"></i></span>
  <input id="customerTalkCount" class="form-control" type="text" readonly>
    </div>
  </div>
</div>



<!-- Select Basic -->
   
<div class="form-group"> 
  <label class="col-md-4 control-label">권한 설정</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select id="roles" name="" class="form-control selectpicker" >
      <option value="ROLE_USER">User</option>
      <option value="ROLE_ADMIN">Admin</option>
      <option value="ROLE_GUEST">Guest</option>
    </select>
  </div>
</div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4" >
     <input type="button" class="btn btn-primary" onclick="changerole();" value="변경하기"></input>
     &emsp;&emsp;&emsp;&emsp;
     <input type="button" class="btn btn-default" onclick="exit();" value="취소하기"></input>
  </div>
</div>

</fieldset>
</form>
</div>
    </div><!-- /.container -->
    

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../../js/admin/customerDetail.js"></script>
</body>

</html>
