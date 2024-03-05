<%@page import="java.sql.*"%>
<html>
    <button><a href="MediGuide.html">HOME</a></button>
    <form>
        <table>
            <%
            String s=request.getParameter("q");
           // out.println(s);
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
//Statement st=conn.createStatement();
PreparedStatement ps = (PreparedStatement)conn.prepareStatement("select * from medical1 WHERE DISEASES= ?");
ps.setString(1,s);
ResultSet rs=ps.executeQuery();

ResultSetMetaData rsmd=rs.getMetaData();
//String a = rs.getString("Disease");
int cc=rsmd.getColumnCount();
out.println("<table align=center cellspacing=10 cellpadding=10 border=1 bgcolor=pink>");
out.println("<tr>");
for(int i=1;i<=cc;i++)
{
out.println("<td>"+rsmd.getColumnName(i)+"</td>"); 
//out.println("<td>a</td>"); 
}
out.println("</tr>");

while(rs.next( ))
{
out.println("<tr>");
for(int i=1;i<=cc;i++)
{
out.println("<td>"+rs.getString(i)+"</td>");
}
out.println("</tr>");

}

out.println("</table>");

conn.close( );
%>

        </table>
        </form>
        </html>