<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>

<%
String driver = "com.mysql.jdbc.Driver";
Class.forName(driver).newInstance();

Connection con=null;
PreparedStatement ps=null;
int result = 0;

try {
    con=DriverManager.getConnection("jdbc:mysql://localhost/testDB", "ubuntu", "test");
    if(con.isClosed()) {
        System.out.println("Could not establish connection to database.");
    } else {
      	CallableStatement cstmt = null;
	String SQL = "{call isQualified(?,?)}";
	cstmt = con.prepareCall(SQL);
        cstmt.setString(1, request.getParameter("worker"));
	cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
	cstmt.execute();
	result = cstmt.getInt(2);
	out.write(Integer.toString(result));
    }
}
catch (Exception e) {
    System.err.println("Exception: " + e.getMessage());
} finally {
    try {
        if(con != null)
            con.close();
    } catch(SQLException e) {}
}
%>
