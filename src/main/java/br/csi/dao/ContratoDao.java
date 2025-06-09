package br.csi.dao;

import br.csi.model.Contrato;


import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ContratoDao {


    public boolean createContrato(Contrato contrato) {
        String sql = "INSERT INTO contrato (data_inicial, data_final, descricao, valor, id_cliente, id_vendedor, ativo) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = ConectarBancoDeDados.conectarPostgres()) {

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, contrato.getDataInicio());
            ps.setDate(2, contrato.getDataFim());
            ps.setString(3, contrato.getDescricao());
            ps.setBigDecimal(4, contrato.getPreco());
            ps.setInt(5, contrato.getId_cliente());
            ps.setInt(6, contrato.getId_vendedor());
            ps.setBoolean(7, true);


            return ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public BigDecimal somaDosContratos() {
        BigDecimal soma = new BigDecimal(0);
        String sql = "SELECT SUM(valor) FROM contrato WHERE ativo = true";

        try (Connection conn = ConectarBancoDeDados.conectarPostgres()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BigDecimal valor = rs.getBigDecimal(1);
                if (valor != null) {
                    soma = soma.add(valor);
                }
            }

            return soma;

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }

    public int countContratos() {
        int count = 0;
        String sql = "SELECT count(*) FROM contrato WHERE ativo = true";

        try (Connection conn = ConectarBancoDeDados.conectarPostgres()) {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }

            return count;

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

    }


}
