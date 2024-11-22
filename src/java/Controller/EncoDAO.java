/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mpfma
 */
public class EncoDAO {
    Connection conn=null;
    PreparedStatement st;
    ResultSet rs;
    

    
    //Conexão com o banco de dados
    public void listarEncomenda(String nome, String dataEntrega, String apartamento) throws Exception {
        try {
            Connection conn;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/senac_db", "root", "Raissa13022007");

            st = conn.prepareStatement("SELECT * FROM encomendas");
           ResultSet rs = st.executeQuery();
    
        } catch (Exception ex) {
            out.println("Erro ao conectar: " + ex.getMessage());
        }
    }
}
