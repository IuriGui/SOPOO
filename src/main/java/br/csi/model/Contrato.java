package br.csi.model;

import javax.swing.text.StyledEditorKit;
import java.math.BigDecimal;
import java.util.Date;

public class Contrato {

    private int id;
    private java.sql.Date dataInicio;
    private java.sql.Date dataFim;
    private String descricao;
    private BigDecimal valor;
    private int id_vendedor;
    private int id_cliente;
    private String nomeCliente;
    private String nomeVendedor;
    private boolean ativo;

    public BigDecimal getPreco() {
        return valor;
    }


    public Contrato(Date dataInicio, Date dataFim, String descricao, BigDecimal preco, int id_vendedor, int id_cliente) {
        this.dataInicio = (java.sql.Date) dataInicio;
        this.dataFim = (java.sql.Date) dataFim;
        this.descricao = descricao;
        this.valor = preco;
        this.id_vendedor = id_vendedor;
        this.id_cliente = id_cliente;
    }

    public Contrato(java.sql.Date dataInicio, java.sql.Date dataFim, String descricao, BigDecimal valor, String nomeCliente, String nomeVendedor, boolean ativo) {
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.descricao = descricao;
        this.valor = valor;
        this.nomeCliente = nomeCliente;
        this.nomeVendedor = nomeVendedor;
        this.ativo = ativo;
    }



    public Contrato() {
    }


    public BigDecimal getValor() {
        return valor;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public String getNomeVendedor() {
        return nomeVendedor;
    }

    public boolean isAtivo() {
        return ativo;
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


    public java.sql.Date getDataFim() {
        return dataFim;
    }


    public String getDescricao() {
        return descricao;
    }


    public int getId_vendedor() {
        return id_vendedor;
    }


    public int getId_cliente() {
        return id_cliente;
    }

}
