package br.csi.controller;

import br.csi.model.Vendedor;
import br.csi.service.VendedorService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("vendedor")
public class VendedorServlet extends HttpServlet {

    private static final VendedorService vendedorService = new VendedorService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");

        if ("editar".equals(op)) {
            int id = Integer.parseInt(req.getParameter("id"));
            int userId = Integer.parseInt(req.getParameter("userId"));
            String nome = req.getParameter("nome");
            String telefone = req.getParameter("telefone");
            String email = req.getParameter("email");

            Vendedor vendedor = new Vendedor();
            vendedor.setId(id);
            vendedor.setIdUser(userId);
            vendedor.setNome(nome);
            vendedor.setTelefone(telefone);
            vendedor.setEmail(email);

            boolean sucesso = vendedorService.editarUsuario(vendedor);
            if (sucesso) {
                req.setAttribute("msgSucesso", "Vendedor atualizado com sucesso!");
            } else {
                req.setAttribute("msg", "Erro ao atualizar vendedor.");
            }

            List<Vendedor> vendedores = vendedorService.listarVendedores();
            req.setAttribute("vendedores", vendedores);
            RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/pages/vendedores.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");
        RequestDispatcher rd;

       if(op != null){
           if(op.equals("editar")){
//               int id = Integer.parseInt(req.getParameter("info"));
//               Vendedor vendedor = vendedorService.buscaPorId(id);
//               req.setAttribute("vendedor", vendedor);
//               rd = req.getRequestDispatcher("/WEB-INF/pages/vendedores.jsp");
//               rd.forward(req, resp);
           }
       } else{
           List<Vendedor> vendedores = vendedorService.listarVendedores();
           req.setAttribute("vendedores", vendedores);
           rd = req.getRequestDispatcher("/WEB-INF/pages/vendedores.jsp");
           rd.forward(req, resp);
           return;
       }

    }
}
