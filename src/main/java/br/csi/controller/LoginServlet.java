package br.csi.controller;

import br.csi.service.ClienteService;
import br.csi.service.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String pass = req.getParameter("senha");

        RequestDispatcher dispatcher;

        if (new LoginService().autenticar(email, pass)) {
            HttpSession session = req.getSession();
            String nome = new LoginService().retornarNomeDoUsuario(email);
            session.setAttribute("user", nome);
            System.out.println("Logamos");
            resp.sendRedirect("dashboard");

        } else {
            dispatcher = req.getRequestDispatcher("index.jsp");
            req.setAttribute("msg", "Login ou senha incorreto!");
            dispatcher.forward(req, resp);
        }


    }
}
