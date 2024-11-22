
<%@page import= "java.sql.Connection"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <link rel="stylesheet" href="style.css">
            <title>JSP Page</title>
        </head>
        <body>
            
           <nav>
        <div class="logo">CondoSystem</div>
        <div class="menu">
        <a href="index.html">Início</a>
        <a href="cadastrom.html">Moradores</a>
        <a href="lista_escomendas.jsp">Ver Encomendas</a>
        <a href="reservas.html">Reservas</a>
        <a href="cadastroe.html">Cadastrar Encomendas</a>
    </nav>
            
            <%
                try{
  Connection conn;
  PreparedStatement st;
  Class.forName("com.mysql.cj.jdbc.Driver");
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/senac_db","root","Raissa13022007");
  
  
    st = conn.prepareStatement("SELECT * FROM encomendas");
    ResultSet rs = st.executeQuery();
    
    %>
    <table border="1">
        <tr>
            <th>Nome</th><th>Data de Entrega</th><th>Apartamento</th>
        </tr>
    <%
    while (rs.next()){
    %>
    
        
        <tr>
            <td><%= rs.getString("nome")%></td>
            <td><%= rs.getString("data_entrega")%></td>
            <td><%= rs.getString("apartamento")%></td>
        </tr>
    
    <%
                }
%>
</table>
    <%
                }catch (Exception ex) {
            out.println("Erro ao conectar: " + ex.getMessage());
                }


                %>
        </body>
    </html>
