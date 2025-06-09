package br.csi.service;

import br.csi.dao.VendedorDao;
import br.csi.model.Vendedor;


import java.math.BigDecimal;
import java.util.List;



public class VendedorService {

    private static final VendedorDao v = new VendedorDao();

    public boolean atualizarTotalVendido(BigDecimal b, int id){
        return v.atualizarTotalVendido(b, id);
    }

    public boolean criarVendedor(Vendedor ve){
        return v.criarVendedor(ve);
    }

    public String AcharNomeVendedor(int id){
        return v.AcharNomeVendedor(id);
    }



    public List<Vendedor> listarVendedores() {
        List<Vendedor> list =  v.listarVendedores();
        for(Vendedor v : list){
            calcularComissao(v);
        }
        return list;
    }


    private BigDecimal calcularComissao(Vendedor ve){
        BigDecimal salario = ve.getSalario();
        BigDecimal comissao = BigDecimal.valueOf(ve.getComissao());

        BigDecimal valorComissao = salario.multiply(comissao);
        BigDecimal salarioTotal = salario.add(valorComissao);

        ve.setSalarioComComissao(salarioTotal);

        return salarioTotal;
    }



    public boolean editarUsuario(Vendedor ve){
        return v.updateVendedor(ve);
    }

    public Vendedor buscaPorId(int id){
        return v.buscarPorId(id);}


}
