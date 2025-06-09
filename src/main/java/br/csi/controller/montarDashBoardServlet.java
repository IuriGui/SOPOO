package br.csi.controller;

import br.csi.service.ClienteService;
import br.csi.service.ContratoService;
import br.csi.service.VendedorService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;


@WebServlet("dashboard")
public class montarDashBoardServlet extends HttpServlet {

    private static final ClienteService c = new ClienteService();
    private static final VendedorService vs = new VendedorService();
    public static final ContratoService cs = new ContratoService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //total vendido de todos os contratos, contratos ativos, novos clientes do mês -pegar clientes cuja data de entrada foi esse mës -, ranking da lista de clientes
        System.out.println("montei dashbvoar");
        req.setAttribute("totalVendido", cs.somaDosContratos());
        req.setAttribute("qtdContratos", cs.countContratos());
        req.setAttribute("clienteNovosMes", c.countClientesNovosMes());
        req.setAttribute("clientOrdenado",  c.listarClienteOrdenado());

        String msgSucesso = (String) req.getSession().getAttribute("msgSucesso");
        if (msgSucesso != null) {
            req.setAttribute("msgSucesso", msgSucesso);
            req.getSession().removeAttribute("msgSucesso");
        }

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/pages/home.jsp");
        rd.forward(req, resp);






    }
}
