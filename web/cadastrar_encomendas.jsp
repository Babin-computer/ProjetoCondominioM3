
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" %>


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
    String nome = request.getParameter("nomeMorador");
    String data_Entrega = request.getParameter("dataEntrega");
    String apartamento = request.getParameter("apartamento");

    if (nome == null || data_Entrega == null || apartamento == null) {
        out.println("Erro: Todos os campos devem ser preenchidos.");
    } else {
        try {
            Connection conn;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/senac_db", "root", "Raissa13022007");

            st = conn.prepareStatement("INSERT INTO encomendas (nome, data_entrega, apartamento) VALUES (?, ?, ?)");
            st.setString(1, nome);
            st.setString(2, data_Entrega);
            st.setString(3, apartamento);
            st.executeUpdate();
            out.println("Encomenda cadastrada com sucesso!");
        } catch (Exception ex) {
            out.println("Erro ao conectar: " + ex.getMessage());
        }
    }
%>
        </body>
    </html>
