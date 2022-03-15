<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>     
       
        <h1>Videojuegos</h1>
        <h2>Listado de videojuegos</h2>
        <%  Class.forName("com.mysql.jdbc.Driver").newInstance();
            String username = "juegos";
            String password = "aK%sJual2M@GihI782";
            String url = "jdbc:mysql://localhost/simbadatabase";
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt=conn.createStatement();
            String sqlStr="select * from viewjuegos";
            
            ResultSet rset=stmt.executeQuery(sqlStr);     
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Modalidad</th>
                    <th>Nombre_empresa</th>
                    <th>Precio</th>
                </tr>
            </thead>
            <tbody>
            <%
                while (rset.next()){                                 
            %>
                <tr>
                    <td><%=rset.getInt("id")%></td>
                    <td><%=rset.getString("nombre")%></td>
                    <td><%=rset.getString("modalidad")%></td>
                    <td><%=rset.getString("nombre_empresa")%></td>
                    <td><%=rset.getInt("precio")%></td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/ServletControlador">
                            <input type="button" value="Editar">
                            <input type="hidden" name="op" value="Editar">
                            <input type="hidden" name="id" value="<%=rset.getInt("id")%>">
                            
                        </form>
                    </td>
                </tr>
        <%
            }
            rset.close();
            conn.close();
        %>
            </tbody>
        </table>
    </body>
</html>
