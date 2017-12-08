<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<% request.setCharacterEncoding("utf-8");%>
<%
	String search	= request.getParameter("title");
	String log_id = (String)session.getAttribute("userid");
	if (search == null) search = "";

	String sql = null;			//sql문 저장
	Connection conn = null;		//DB연결을 위한 객체
    Statement st = null;		//sql문을 실행하기위한 객체
    ResultSet rs = null;		//select문으로 가져온 데이터를 저장할 공간
	int cnt = 0;

	try{
		Class.forName("org.gjt.mm.mysql.Driver");
	} catch(ClassNotFoundException e ) {
		out.println(e);
	}

	//connection 객체 생성(DB연결)
	//connection 객체 mysql사용시 첫번째매개변수 jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf-8
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/www_relationmm_co_kr?useUnicode=true&characterEncoding=utf-8", "root", "1234");
		st = conn.createStatement();

		//sql 문 실행 & 처리결과 리턴
		sql = "select * from tbl_user where userID = '"+log_id+"'";
		rs = st.executeQuery(sql);
		//rs에 데이터 값이없다(select문을 실했했을때 나오는 데이터가 없다)
		if(rs.next()){
			//Statement 객체 생성
			st = conn.createStatement();
			//sql문 생성
			sql = "insert into tbl_search(search_title, userid)";
			sql = sql + "value('"+search+"','"+log_id+"');";
			//sql문 실행
			//st.executeUpdate(sql) = 등록된 데이터수를 반환
			cnt = st.executeUpdate(sql);
			if(cnt > 0){
				// out.println("검색어가 저장 되었습니다.");
			} else{
				// out.println("검색어가 저장 되지않았습니다.");
			}
		}
		//rs에 값이 있다(select문을 실했했을때 나오는 값이있다)
		else {
			sql = "insert into tbl_search(search_title)";
			sql = sql + "value('"+search+"');";
			cnt = st.executeUpdate(sql);
			// out.println("ID가 존재하지 않습니다.");
		}
		//연결 해제
		rs.close();
		st.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Mindmap Surch</title>
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
		<style type="text/css">
    #wrap{
      width: 100%; height: 10%;
    }
		#wrap>div{
			justify-content: flex-end;
		}
		div>#logo {
			width: 200px; height: 150px;
			background: url('img/MMM_logo2.png') no-repeat;
			background-size: contain;
			margin-left: auto;
			margin-right: auto;
			display: absolute;
			position: fixed;
			bottom: 0;
			right: 0;
	 }
		</style>

</head>
<body>
	<div id = "search">
<form action="#" class="form-wrapper" METHOD=post> <input id="title" name="title" value='<%= search %>' onkeypress="if(event.keyCode == 13) {search()}" type="text"/><button id="searchbt" type="submit" onclick=search() value="">
	<img src="img/search.png" style="width:40px;height:40px;"/>
</button></form>
</div>
<div>
	<a href="index.jsp" id = "logo"></a>
</div>
  <h1 id="item0"></h1>
  <p id="item0desc"></p>
  <p><a id="item0link" href="//www.youtube.com/embed/{{videoid}}"></a></p>
  <h2 id="item1"></h2>
  <p id="item1desc"></p>
  <p><a id="item1link" href="//www.youtube.com/embed/{{videoid}}"></a></p>
	<h2 id="item2"></h2>
  <p id="item2desc"></p>
  <p><a id="item2ink" href="//www.youtube.com/embed/{{videoid}}"></a></p>
	<h2 id="item3"></h2>
  <p id="item3desc"></p>
  <p><a id="item3link" href="//www.youtube.com/embed/{{videoid}}"></a></p>
	<h2 id="item4"></h2>
  <p id="item4desc"></p>
  <p><a id="item4link" href="//www.youtube.com/embed/{{videoid}}"></a></p>

<script src="js/search.js"></script>
<script src="https://apis.google.com/js/client.js?onload=init"></script>

<script src="js/script.js" type="text/javascript"></script>

</body>
</html>
