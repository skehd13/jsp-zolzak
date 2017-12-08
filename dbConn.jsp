<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import = "java.sql.*" %>
<html>
<head></head>
<body>
<table width="550" border="1">
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		String url = "jdbc:mysql://localhost:3306/test";
		String id = "root";
		String pw = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection(url,id,pw);

		String sql = "select * from testTable";
		stmt = conn.createStatement();

		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			String column1 = rs.getString("column1");
			String column2 = rs.getString("column2");
			String column3 = rs.getString("column3");
%>
	<tr>
		<td width="100"><%=column1%></td>
		<td width="100"><%=column2%></td>
		<td width="100"><%=column3%></td>
	</tr>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
		out.println("testTable 테이블 호출에 실패했습니다.<br />");
		out.println(e.toString());

	} finally {
		if(rs != null) try{ rs.close(); } catch(SQLException sqle){}
		if(stmt != null) try{ stmt.close(); } catch(SQLException sqle){}
		if(conn != null) try{ conn.close(); } catch(SQLException sqle){}
	}
%>
</table>
</body>
</html>
