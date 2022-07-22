
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 

<%
Connection connection=null ;
ResultSet rs = null;
PreparedStatement psmnt = null;
InputStream sImage;
try {
Class.forName("com.mysql.jdbc.Driver");

 connection = DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadbtest", "javadbtest", "GFW5sdwfxt");

psmnt = connection.prepareStatement("SELECT photo FROM contacts WHERE contact_id = ?");
psmnt.setString(1, "1"); // here integer number '11' is image id from the table
rs = psmnt.executeQuery();
if(rs.next()) {
byte[] bytearray = new byte[1048576];
int size=0;
sImage = rs.getBinaryStream(1);
response.reset();
response.setContentType("image/jpeg");
while((size=sImage.read(bytearray))!= -1 ){
response.getOutputStream().write(bytearray,0,size);
}
}
}
catch(Exception ex){
out.println("error :"+ex);
}
finally {
// close all the connections.
rs.close();
psmnt.close();
connection.close();
}
%>


<%-- <html>
<body>
    <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="com.mysql.*"%>
 <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page language="java"%>
 <%@ page session="true"%>
 <%@ page import="java.sql.*"%>
<% 
Blob image = null;
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
String iurl1=null;

try {
Class.forName("com.mysql.jdbc.Driver");
con =           DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadbtest","javadbtest","GFW5sdwfxt");
stmt = con.createStatement();
rs = stmt.executeQuery("select photo from contacts where contact_id = 2");%>
<table border="2">
<tr><th>DISPLAYING IMAGE</th></tr>
<tr><td>Image 2</td></tr>
<tr><td>
<%while(rs.next()){%>
 <img src="<%=rs.getString("photo") %>" width="500" height="500"/>
 <%}%>
</td></tr>
</table>
<%}
catch (Exception e) {
out.println("DB problem"); 
return;
}
finally {
try {
rs.close();
stmt.close();
con.close();
}
catch (SQLException e) {
e.printStackTrace();
}
}
%>
</body>
</html> --%>