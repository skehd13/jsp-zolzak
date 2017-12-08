<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
String log_id = request.getParameter("id");
String log_pwd = request.getParameter("password");

Class.forName("org.gjt.mm.mysql.Driver");

Connection conn = DriverManager.getConnection("skehd13.dothome.co.kr/myadmin/skehd13?useUnicode=true&characterEncoding=utf-8", "skehd13", "ehdrb1994");

Statement stmt = conn.createStatement();

String sql = "select userid, password from tbl_user where userid='"+log_id+"'";
ResultSet rs = stmt.executeQuery(sql);
if (!rs.next()) {
  stmt.close();
  conn.close();
  out.println("error");
  } else {
    String goodId = rs.getString("userid");
	  String goodPwd = rs.getString("password");
	  boolean real = goodPwd!=log_pwd;
        rs.close();
        stmt.close();
        conn.close();

     if (!(goodPwd.equals(log_pwd))) {
%>
		<script language="javascript">
        alert("로그인실패");
        </script>
<%
     } else {
            session.setAttribute("userid", goodId);
            response.sendRedirect("index.jsp");
     }
}
%>
