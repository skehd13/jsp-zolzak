<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email1 = request.getParameter("email1");
  	String email2 = request.getParameter("email2");

	String sql = null;			//sql문 저장
	Connection conn = null;		//DB연결을 위한 객체
    Statement st = null;		//sql문을 실행하기위한 객체
    ResultSet rs = null;		//select문으로 가져온 데이터를 저장할 공간
	int cnt = 0;

	//jdbc driver 로딩(등록)
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
		sql = "select * from tbl_user where userID = '"+id+"'";
		rs = st.executeQuery(sql);
		//rs에 데이터 값이없다(select문을 실했했을때 나오는 데이터가 없다)
		if(!rs.next()){
			//Statement 객체 생성
			st = conn.createStatement();
			//sql문 생성
			sql = "insert into tbl_user(userID, password, email)";
			sql = sql + "value('"+id+"','"+password+"','"+email1 + "@" + email2+"');";
			//sql문 실행
			//st.executeUpdate(sql) = 등록된 데이터수를 반환
			cnt = st.executeUpdate(sql);
			if(cnt > 0){
				out.println("회원정보가 등록되었습니다");
			} else{
				out.println("회원정보가 등록되지 않았습니다.");
			}
		}
		//rs에 값이 있다(select문을 실했했을때 나오는 값이있다)
		else {
			out.println("이미 존재하는 ID입니다.");
		}
		//연결 해제
		rs.close();
		st.close();
		conn.close();
	} catch (SQLException e) {
		out.println(e);
	}
%>
<p>
[<a href="index.jsp">main으로</a>]
&nbsp [<a href="sign.jsp">회원등록</a>]
