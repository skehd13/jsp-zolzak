<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<%
	String title	= request.getParameter("title");
  String sessionID = (String)session.getAttribute("userid");
	if (title == null) title = "";
  Class.forName("org.gjt.mm.mysql.Driver");

  Connection conn = DriverManager.getConnection("jdbc:mysql://skehd13.dothome.co.kr/myadmin/skehd13?useUnicode=true&characterEncoding=utf-8", "skehd13", "dk1994");
  Statement stmt = conn.createStatement();

  String sql = "select count(search_title), search_title from tbl_search group by(search_title) order by count(search_title) desc;";
  ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
	<title>Mindmap Search</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link rel="stylesheet" type="text/css" href="css/js-mindmap.css" />
    <link href="css/style.css" type="text/css" rel="stylesheet"/>
    <link href="css/search.css" type="text/css" rel="stylesheet"/>

    <!-- jQuery -->
    <script src="jquery.min.js" type="text/javascript"></script>
    <!-- UI, for draggable nodes -->
	<script type="text/javascript" src="jquery-ui.min.js"></script>

    <!-- Background Fading -->
    <script src="js/jquery.color.js" type="text/javascript"></script>

    <!-- Raphael for SVG support (won't work on android) -->
	<script type="text/javascript" src="js/raphael-min.js"></script>

    <!-- Mindmap -->
	<script type="text/javascript" src="js/js-mindmap.js"></script>

    <!-- Kick everything off -->
    <script src="js/script.js" type="text/javascript"></script>

    <script language=javascript>
<!--
function isNull(elm)
{
        //Null 체크 함수
        var elm;
        return (elm == null || elm == "" || elm == "undefined" || elm == " ") ? true : false
}
function ValidCheck()
{
        var thisform = document.allForm;
        if(isNull(thisform.title.value)){
                alert("내용을 입력해 주세요.");
                thisform.title.value ="";
                thisform.title.focus();
                return false;
        }else{
                return true;
        }
}


//-->
</script>

    <style type="text/css">
    #wrap{
      width: 100%; height: 300px;
    }
      #logosize {
    width: 416px; height: 270px;
    background: url('img/MMM_logo2.png') no-repeat;
    background-size: contain;
    margin-left: auto; margin-right: auto; display: block;
     }

     #search{
      width: 100%;height: 50px;
      text-align: center;
     }
     #mainwrap{
      width: 100%;height: 450px;
      padding-left: 20%;
      vertical-align: middle;
     }

     #rankwrap{
      width: 25%;height: 100%;
      margin: 40px;
      vertical-align: middle;
      float:left;
      border-style: solid;
      border-radius: 15px;
      opacity: 0.5;
      background-color: #ffffff;
     }
     #signwrap{
      width: 30%;height: 100%;
      margin: 40px;
      vertical-align: middle;
      float:left;
    }
     #sign{
      width: 100%; height: 60%;
      float:left;
      border-style: solid;
      border-radius: 15px;
      opacity: 0.5;
      background-color: #ffffff;
     }
     th{
      border-bottom: solid;
      padding-bottom: 10px;
     }
     td{
      padding-top: 5px;
      padding-bottom: 5px;
      width: 40px;
     }
     #tableCenter{
      padding-top: 25px;
      margin-left: auto; margin-right: auto; text-align: center;
      opacity: unset;
     }
    </style>
</head>
<body>
<div id="wrap">
  <div id="logosize"></div>
</div>

<div id="search">
  <FORM ACTION="search.jsp" METHOD=post class="form-wrapper cf" name="allForm" onsubmit="return ValidCheck()">
    <INPUT TYPE = text id="title" NAME = "title" VALUE="<%= title %>">
    <button value="체크" name="check"><img style="width: 40px; height: 40px;" src="img/search.png"></button>
  </FORM>
</div>

<div id="mainwrap">
  <div id="rankwrap">
		<form action="search.jsp" method="post">
  <table id="tableCenter">
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
    <tr>
      <th colspan="5">인기검색어</th>
    </tr>
    <%
    int i = 1;
    while(rs.next()){
    if(i == 11){
      break;
    }
    String str = rs.getString("search_title");
    %>
    <tr>
      <td><%=i%></td>
      <td colspan="4"><button onclick="submit" name ="title" value="<%=str%>"><%=str%></a></td>
    </tr>
    <%
    i++;
    }
    %>
  </table>
	</form>
</div>

<div id="signwrap">
  <div id="sign">
  <%
    if (sessionID==null)   {
  %>
    <form action="login_ok.jsp" method="post">
<table id="tableCenter" style="width:90%;height:90%; margin:5%; border: 2px; border-style: solid; border-color: #000000">
    <tr>
      <td colspan="2" style="text-align: left;">아이디</td>
      <td colspan="5"><input type=text style="width:100%;" name="id"  /></td>
      <td colspan="3" rowspan="2"><input type="submit" value="로그인"></td>
    </tr>
    <tr>
      <td colspan="2" style="text-align: left;">비밀번호</td>
      <td colspan="5"><input type=password style="width:100%;" name="password" /></td>
    </tr>
    <tr>
      <td colspan="5"><a href="sign.jsp">회원가입</a></td>
      <td colspan="5">아디/ 비번 찾기</td>
    </tr>
  </table>
  </form>
  <%
     } else {
  %>
  <form action="logout.jsp" method="post">
    <p style="padding-left:35% "><% out.println(sessionID+" 님");%><input type="submit" value="로그아웃" name="B1" onClick="logout()"></p>
		<table id="tableCenter" style="padding-top:0px;">
			<tr>
		    <td></td>
		    <td></td>
		    <td></td>
		    <td></td>
		    <td></td>
		  </tr>
			<tr>
				<td colspan="5">자주사용한 검색어</td>
			</tr>
			<%
 			 Statement stmt2 = conn.createStatement();

 		   String sql2 = "select count(search_title), search_title from tbl_search where userID='"+sessionID+"' group by(search_title) order by count(search_title) desc;";
 		   ResultSet rs2 = stmt2.executeQuery(sql2);
			 int k = 1;
				while(rs2.next()){
					String str2 = rs2.getString("search_title");
			%>
			<tr>
				<td><%=k%></td>
				<td colspan="4"><%=str2%></td>
			</tr>

			<%
			k++;
			if (k == 6) {
				break;
			}
				}
			%>
		</table>
    </form>
    <%
  }
    %>
  </div>
</div>



<script type="text/javascript">
    // Google Analytics
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-10723733-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();



</script>
<%
  session.setAttribute("userid", sessionID);
%>
</body>
</html>
