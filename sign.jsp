<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>회원가입</title>
      <link href="css/style.css" type="text/css" rel="stylesheet"/>
      <link href="css/sign.css" type="text/css" rel="stylesheet"/>
    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-ui.min.js" type="text/javascript"></script>
  <script src="js/jquery.color.js" type="text/javascript"></script>

    <style media="screen">
      #wrap{
        width: 100%; height: 300px;margin: 8px;
      }
      #logosize {
        width: 152px; height: 111px;
        background: url('img/MMM_logo2.png') no-repeat;
        background-size: contain;
        margin-left: auto; margin-right: auto; display: block;
     }
    </style>
  </head>

  <body>
    <div id="wrap">
      <div id="page_header">
        <a id="logosize" href="index.jsp"></a>
      </div>
      <hr size=5>
        <form id="join_form" name="form1" action="insert.jsp" method="post">
          <div id="page_join">
            <div id="input">
              <label for="Input_Id">ID</label>
              <input type="text" id="input_id" name="id" value="">
              <input type="button" id="button1" name="in_check" value="중복확인">
              <input type="hidden" name="idDuplication" value="idUncheck">
            </div>
            <div id="input">
              <label for="Input_Password">비밀번호</label>
              <input type="password" id="input_all" name="password" value="">
            </div>
            <div id="input">
              <label for="Input_Password_check">비밀번호 확인</label>
              <input type="password" id="input_all" name="password_check" value="">
            </div>
            <div id="input">
              <label for="Input_Email">이메일</label>
              <input type="text" id="email1" name="email1" value="">@
              <select name="email2" id="email2">
              	<option value="naver.com" selected="">naver.com</option>
              	<option value="freechal.com">freechal.com</option>
              	<option value="dreamwiz.com">dreamwiz.com</option>
              	<option value="korea.com">korea.com</option>
              	<option value="nate.com">nate.com</option>
              	<option value="lycos.co.kr">lycos.co.kr</option>
              	<option value="yahoo.co.kr">yahoo.co.kr</option>
              	<option value="netian.com">netian.com</option>
              	<option value="empal.com">empal.com</option>
              	<option value="paran.com">paran.com</option>
              	<option value="hotmail.com">hotmail.com</option>
              	<option value="hanafos.com">hanafos.com</option>
              	<option value="hanmail.net">hanmail.net</option>
              	<option value="1">직접입력</option>
              </select>
            </div>
          </div>
          <hr size=5>
          <div id="page_button">
            <input id="reset_bt" type="reset" name="" value="되돌리기">
            <input id="button1" type="submit" name="" value="회원가입">
          </div>
      </form>
    </div>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
      <script type="text/javascript">
      //이메일 입력방식 선택
      $('#email_select').change(function(){
        $("#email_select option:selected").each(function () {
          if($(this).val()== '1'){ //직접입력일 경우
            $("#email2").val('');                        //값 초기화
            $("#email2").attr("disabled",false); //활성화
            $("#email2").focus();
          }else{ //직접입력이 아닐경우
           $("#email2").val($(this).text());      //선택값 입력
           $("#email2").attr("disabled",true); //비활성화
          }
        });
      });
      </script>
      <script src="js/script.js" type="text/javascript"></script>
  </body>
</html>
