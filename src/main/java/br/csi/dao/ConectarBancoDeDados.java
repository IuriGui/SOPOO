package br.csi.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectarBancoDeDados{

    public static Connection conectarPostgres() throws SQLException, ClassNotFoundException {
        Class.forName("org.postgresql.Driver");


        String url = "jdbc:postgresql://postgres:5432/radio";
        String user = "postgres";
        String senha = "1234";

        return DriverManager.getConnection(url, user, senha);
    }

}
