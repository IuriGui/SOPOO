package br.csi.controller;

import br.csi.model.Cliente;
import br.csi.model.Contrato;
import br.csi.model.Vendedor;
import br.csi.service.ContratoService;
import br.csi.service.VendedorService;
import br.csi.util.ValidateInput;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("contratos")
public class ContratosServlet extends HttpServlet {

    private static final ContratoService contratoService = new ContratoService();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd;

        String opcao = req.getParameter("op");
        System.out.printf("foi POST");

        if (!ValidateInput.isEmpty(opcao)) {
            if (opcao.equals("cadastrar")) {
                String dataInicioStr = req.getParameter("dataInicio");
                String dataFimStr = req.getParameter("dataFim");
                String descricao = req.getParameter("descricao");
                String valorStr = req.getParameter("valor");

                if (dataInicioStr == null || dataFimStr == null || dataInicioStr.isEmpty() || dataFimStr.isEmpty()) {
                    req.setAttribute("msg", "Datas não podem ser vazias.");
                    req.getRequestDispatcher("/WEB-INF/pages/cadastrarContrato.jsp").forward(req, resp);
                    return;
                }

                if (ValidateInput.isEmpty(dataInicioStr, dataFimStr, descricao, valorStr)) {
                    req.setAttribute("msg", "Existem campos preenchidos incorretamente.");
                    req.getRequestDispatcher("/WEB-INF/pages/cadastrarContrato.jsp").forward(req, resp);
                    resp.sendRedirect("contratos");
                }

                try {
                    java.sql.Date dataInicio;
                    java.sql.Date dataFim;

                    dataInicio = java.sql.Date.valueOf(dataInicioStr);
                    dataFim = java.sql.Date.valueOf(dataFimStr);
                    BigDecimal valor = new BigDecimal(valorStr);
                    int id_cliente = Integer.parseInt(req.getParameter("clientes"));
                    int id_vendedor = Integer.parseInt(req.getParameter("vendedor"));

                    Contrato c = new Contrato(dataInicio, dataFim, descricao, valor, id_vendedor, id_cliente);


                    boolean contratoCriado = contratoService.criarContrato(c);
                    boolean vendedorAtualizado = contratoCriado && new VendedorService().atualizarTotalVendido(valor, id_vendedor);

                    if (contratoCriado && vendedorAtualizado) {
                        req.getSession().setAttribute("msgSucesso", "Contrato criado com sucesso!");
                        System.out.println("Contrato criado com sucesso!");
                        resp.sendRedirect("contratos");
                        return;
                    } else {
                        throw new RuntimeException("Contrato criado, mas erro ao atualizar total vendido");
                    }


                } catch (Exception e) {
                    System.out.println("Erro ao criar contrato: " + e.getMessage());
                    req.setAttribute("msg", "Erro ao criar contrato: " + e.getMessage());
                    resp.sendRedirect("contratos");
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd;
        String opcao = req.getParameter("op");


        switch (!ValidateInput.isEmpty(opcao) ? opcao : "") {
            case "cadastrar":
                carregarClientesEVendedores(req);
                rd = req.getRequestDispatcher("/WEB-INF/pages/cadastrarContrato.jsp");
                break;
            default:
                req.setAttribute("contratos", contratoService.listarContratos());
                rd = req.getRequestDispatcher("/WEB-INF/pages/contratos.jsp");

        }
        rd.forward(req, resp);


    }


    private void carregarClientesEVendedores(HttpServletRequest req) {
        List<Cliente> clientes = contratoService.listarClientes();
        List<Vendedor> vendedores = contratoService.listarVendedores();
        req.setAttribute("clientela", clientes);
        req.setAttribute("vendedores", vendedores);
    }

}


