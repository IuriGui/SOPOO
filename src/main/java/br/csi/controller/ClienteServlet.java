package br.csi.controller;
import br.csi.model.Cliente;
import br.csi.model.Contato;
import br.csi.service.ClienteService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("cliente")
public class ClienteServlet extends HttpServlet {

    private static final ClienteService clienteService = new ClienteService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = null;
        Cliente c = new Cliente();
        String op = req.getParameter("op");
        if(op != null && op.equals("update")) {
            System.out.println("Entrei no update");
            c.setNome(req.getParameter("razao"));
            System.out.println("Nome: " + c.getNome());
            c.setCpf(req.getParameter("doc"));
            c.setId(Integer.parseInt(req.getParameter("info")));
            try{
                if(clienteService.updateCliente(c)){
                    req.getSession().setAttribute("msgSucesso", "Dados do cliente atualizados com sucesso!");
                    System.out.println("Deu bom");
                } else {
                    req.getSession().setAttribute("msg", "Erro ao atualizar dados do cliente!");
                    System.out.println("Deu ruim");
                }
            } catch(Exception e){
                req.getSession().setAttribute("msg", "Erro ao atualizar dados do cliente!" + e.getMessage());
            }

            resp.sendRedirect("cliente");
            return;
        } else if(op != null && op.equals("apagar")) {
            try {
                System.out.println("Mandei pra ca por get");
                if(clienteService.deleteCliente(Integer.parseInt(req.getParameter("info")))){
                    req.getSession().setAttribute("msgSucesso", "Dados do cliente atualizados com sucesso!");
                } else{
                    req.getSession().setAttribute("msg", "Erro ao apagar o cliente!");
                }
            }
             catch (Exception e) {
                 req.getSession().setAttribute("msg", "Erro ao Apagar o cliente!" + e.getMessage());

             }
            resp.sendRedirect("cliente");

        } else if(op != null && op.equals("cadastrar")) {

            c.setNome(req.getParameter("razao"));
            c.setCpf(req.getParameter("doc"));

            Contato cc = new Contato();
            System.out.println("Chegamos a algum lugar");
            cc.setNome(req.getParameter("nome"));
            cc.setTelefone(req.getParameter("telefone"));
            cc.setEmail(req.getParameter("email"));

            try {
                if(clienteService.cadastrarClienteComContato(c, cc)){
                    req.getSession().setAttribute("msgSucesso", "Cliente adicionado com sucesso!");
                } else {
                    req.getSession().setAttribute("msgErro", "Erro ao cadastrar cliente.");
                }
            } catch (Exception e) {
                req.getSession().setAttribute("msgErro", "Erro inesperado: " + e.getMessage());
            }

            resp.sendRedirect("cliente");
        }



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher rd = null;
        String op = req.getParameter("op");

        if(op != null && op.equals("editar")) {
            try {
                System.out.println("tenei pegaar cliente");
                req.setAttribute("cliente", clienteService.listarClientePeloId(Integer.parseInt(req.getParameter("info"))));
            } catch (SQLException | ClassNotFoundException e) {
                System.out.println("Erro ao sla cliente: " + e.getMessage());
                req.setAttribute("msgErro", "Erro inesperado: " + e.getMessage());
                rd = req.getRequestDispatcher("/WEB-INF/pages/clientes.jsp");
                rd.forward(req, resp);
                return;
            }
            req.setAttribute("op", "editar");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/cadastrarCliente.jsp");
            dispatcher.forward(req, resp);

        } else if(op != null && op.equals("apagar")) {
            try {
                req.setAttribute("cliente", clienteService.listarClientePeloId(Integer.parseInt(req.getParameter("info"))));
                int id = Integer.parseInt(req.getParameter("info"));
                req.setAttribute("op", "apagar");
                req.setAttribute("info", id);
                System.out.println("Mandei pra ca por post");
                rd = req.getRequestDispatcher("/WEB-INF/pages/cadastrarCliente.jsp");
                rd.forward(req, resp);
                return;
            } catch (Exception e) {
                req.setAttribute("msgErro", "Erro ao apagar cliente: " + e.getMessage());
            }

            rd = req.getRequestDispatcher("/WEB-INF/pages/clientes.jsp");
            rd.forward(req, resp);
        } else if(op != null && op.equals("cadastrar")) {
            req.setAttribute("op", "cadastrar");
            RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/pages/cadastrarCliente.jsp");
            dispatcher.forward(req, resp);
            return;
        }

            String msgSucesso = (String) req.getSession().getAttribute("msgSucesso");
            String msgErro = (String) req.getSession().getAttribute("msg");

            if (msgSucesso != null) {
                req.setAttribute("msgSucesso", msgSucesso);
                req.getSession().removeAttribute("msgSucesso");
            } else if (msgErro != null) {
                req.setAttribute("msg", msgErro);
                req.getSession().removeAttribute("msg");
            }
            try {
                req.setAttribute("clientes", clienteService.listarClientesComContato());
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            rd = req.getRequestDispatcher("/WEB-INF/pages/clientes.jsp");
            rd.forward(req, resp);
        }



    }
