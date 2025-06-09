package br.csi.service;


import br.csi.dao.ContratoDao;
import br.csi.dao.VendedorDao;
import br.csi.model.Cliente;
import br.csi.model.Contrato;
import br.csi.model.Vendedor;


import java.math.BigDecimal;
import java.util.List;

public class ContratoService {

    private static final VendedorService v = new VendedorService();
    private static final ClienteService c = new ClienteService();
    private static final ContratoDao vd = new ContratoDao();

    public List<Vendedor> listarVendedores() {
        return v.listarVendedores();
    }

    public List<Cliente> listarClientes(){
        return c.listar();
    }

    public boolean criarContrato(Contrato c){
        return vd.createContrato(c);
    }


    public BigDecimal somaDosContratos(){
        return vd.somaDosContratos();
    }

    public int countContratos(){
        return vd.countContratos();
    }


}
