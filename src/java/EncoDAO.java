/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class EncoDAO {
    public void cadastrarEncomenda(String nome, String dataEntrega, String apartamento) throws Exception {
        Connection conn = null;
        PreparedStatement st = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/senac_db", "root", "Raissa13022007");

            String sql = "INSERT INTO encomendas (nome, data_entrega, apartamento) VALUES (?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, nome);
            st.setString(2, dataEntrega);
            st.setString(3, apartamento);
            st.executeUpdate();
        } finally {
            if (st != null) st.close();
            if (conn != null) conn.close();
        }
    }
}
