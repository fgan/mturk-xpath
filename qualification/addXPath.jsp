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
	String SQL = "{call addXPATH(?,?,?)}";
	cstmt = con.prepareCall(SQL);
        cstmt.setString(1, request.getParameter("worker"));
	String site = URLDecoder.decode(request.getParameter("site"), "UTF-8");
	cstmt.setString(2, site);
	String xpath = URLDecoder.decode(request.getParameter("xpath"), "UTF-8");
	cstmt.setString(3, xpath);
	cstmt.execute();
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
