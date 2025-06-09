package br.csi.model;

import java.math.BigDecimal;
import java.util.Date;

public class Contrato {

    private int id;
    private java.sql.Date dataInicio;
    private java.sql.Date dataFim;
    private String descricao;
    private BigDecimal preco;
    private int id_vendedor;
    private int id_cliente;

    public BigDecimal getPreco() {
        return preco;
    }

    public void setPreco(BigDecimal preco) {
        this.preco = preco;
    }

    public Contrato(Date dataInicio, Date dataFim, String descricao, BigDecimal preco, int id_vendedor, int id_cliente) {
        this.dataInicio = (java.sql.Date) dataInicio;
        this.dataFim = (java.sql.Date) dataFim;
        this.descricao = descricao;
        this.preco = preco;
        this.id_vendedor = id_vendedor;
        this.id_cliente = id_cliente;
    }

    public Contrato() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public java.sql.Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = (java.sql.Date) dataInicio;
    }

    public java.sql.Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = (java.sql.Date) dataFim;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }



    public int getId_vendedor() {
        return id_vendedor;
    }

    public void setId_vendedor(int id_vendedor) {
        this.id_vendedor = id_vendedor;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }
}
