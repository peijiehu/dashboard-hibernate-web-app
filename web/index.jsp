<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLClassLoader" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: phu
  Date: 10/28/14
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Dashboard</title>
  </head>
  <body>
  <ul>
      <li><a href="index.jsp">Dashboard</a></li>
      <li><a href="hotleads.jsp">Leads</a></li>
      <li><a href="renterRegistration.jsp">RR</a></li>
  </ul>
  <%
      double num = Math.random();
      if (num > 0.3) {
  %>
  <h1>Sometimes, I am a dashboard!</h1>
  <%
      }
  %>
  <div class="login">
      <form method="POST" action="userLogin" name="user_login">
          <input type="text" placeholder="Username"><br>
          <input type="password" placeholder="Password"><br>
          <input type="submit" value="Login">
      </form>
  </div>
  <div class="all_stats">
      <%
          Connection conn = null;
          Statement stmt = null;
          String sqlQuery = null;
          ResultSet rs = null;
          // load the sqlite-JDBC driver using the current class loader
          try {
              Class.forName("org.sqlite.JDBC");
          } catch (ClassNotFoundException e) {
              System.err.print("ClassNotFoundException: ");
              System.err.println(e.getMessage());
          }
          try {
              conn = DriverManager.getConnection("jdbc:sqlite:/Users/phu/dashboard.db");
              stmt = conn.createStatement();

              sqlQuery = "SELECT * FROM Webstats;";
              System.out.println(sqlQuery); // for debugging
              rs = stmt.executeQuery(sqlQuery);

              ResultSetMetaData rsmd = rs.getMetaData();
              String col1 = rsmd.getColumnName(1);
              String col2 = rsmd.getColumnName(2);
              String col3 = rsmd.getColumnName(3);
              String col4 = rsmd.getColumnName(4);
              int colCount = rsmd.getColumnCount();
      %>
      <table border="1">
          <tr>
              <td><%=col1%></td><td><%=col2%></td><td><%=col3%></td><td><%=col4%></td>
          </tr>
          <%
              while(rs.next()){
          %>
          <tr>
              <td><%=rs.getString(1)%></td><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(4)%></td>
          </tr>
          <%}
          }
          catch (Exception e) {
              e.printStackTrace();
          }
          finally {
              try { if (rs != null) rs.close(); } catch (Exception e) {};
              try { if (stmt != null) stmt.close(); } catch (Exception e) {};
              try { if (conn != null) conn.close(); } catch (Exception e) {};
          }
          %>
      </table>
      <table>
          <tr>
              <%--<td><%= str1%></td>--%>
              <%--<td><%= str2%></td>--%>
              <%--<td><%= str3%></td>--%>
              <%--<td><%= str4%></td>--%>
          <%--</tr>--%>
          <%--<tr>--%>
              <%--<td><%= resultSet%></td>--%>
              <%--<td><%= resultSet%></td>--%>
              <%--<td><%= resultSet%></td>--%>
              <%--<td><%= resultSet%></td>--%>
          <%--</tr>--%>
          <%--<tr>--%>
              <%--<td><%= resultSet%></td>--%>
              <%--<td><%= resultSet%></td>--%>
              <%--<td><%= resultSet%></td>--%>
              <%--<td><%= resultSet%></td>--%>
          </tr>
      </table>
  </div>
  </body>
</html>
