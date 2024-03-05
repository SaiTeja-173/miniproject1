import java.sql.*;
class JdbcDemo1
{
    public static void main(String x[])throws Exception 
    {
        Class.forName("com.mysql.jdbc.Driver");
        System.out.println("Drivers Loaded");

        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
        System.out.println("Connection Established");

        Statement stmt=conn.createStatement();
        System.out.println("Statement created");

        ResultSet rs=stmt.executeQuery("select *from medical");
        ResultSetMetaData rsmd=rs.getMetaData();
        int cc=rsmd.getColumnCount();
        for(int i=1;i<=cc;i++)
        {
            System.out.print(rsmd.getColumnName(i)+"\t");
        }
        System.out.println();
        while(rs.next())
        {
            for(int i=1;i<=cc;i++)
            {
                System.out.print(rs.getString(i)+"\t");
            }
            System.out.println();
        } 
    }
}