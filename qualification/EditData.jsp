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
	 String query = "";
        query = "INSERT INTO Qualifications(workerID, entry) VALUES (?, ?);";
        ps = con.prepareStatement(query);
        ps.setString(1, request.getParameter("worker"));
        ps.setString(2, request.getParameter("entry"));
	    result = ps.executeUpdate();
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
if (result > 0)
	out.write("true");
else
	out.write("false");
%>
