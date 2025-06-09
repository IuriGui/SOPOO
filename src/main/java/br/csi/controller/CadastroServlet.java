    package br.csi.controller;

    import br.csi.model.Vendedor;
    import br.csi.service.CadastroUserService;
    import br.csi.service.VendedorService;
    import jakarta.servlet.RequestDispatcher;
    import jakarta.servlet.ServletException;
    import jakarta.servlet.annotation.WebServlet;
    import jakarta.servlet.http.HttpServlet;
    import jakarta.servlet.http.HttpServletRequest;
    import jakarta.servlet.http.HttpServletResponse;

    import java.io.IOException;

    @WebServlet("cadastroUser")
    public class CadastroServlet extends HttpServlet {


        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String op = req.getParameter("op");
            System.out.println(op);
            RequestDispatcher rd;

            try{
                if(op != null && op.equals("CadastrarDadosVendedor")){

                    Vendedor v = new Vendedor(req.getParameter("nomeVendedor"), req.getParameter("telefone"), Integer.parseInt(req.getParameter("user_id")));
                    boolean vendedorCriado = new VendedorService().criarVendedor(v);
                    boolean usuarioAtivado = false;

                    if(vendedorCriado){
                        System.out.println("vendedor criado");
                        usuarioAtivado = new CadastroUserService().ativarUsuario(v.getIdUser());
                    }

                    if(usuarioAtivado){
                        System.out.println("usuario ativo e vendedor criado");
                        req.setAttribute("msg", "Cadastro realizado com sucesso");
                        rd = req.getRequestDispatcher("index.jsp");
                        rd.forward(req, resp);
                    } else {
                        System.out.println("Erro total");
                        String erro = !vendedorCriado ? "Erro ao criar vendedor." : "Erro ao ativar usuário.";
                        System.out.println(erro);
                        req.setAttribute("msgErro", erro);
                        rd = req.getRequestDispatcher("/WEB-INF/pages/cadastroUsuario.jsp");
                        rd.forward(req, resp);
                    }

                } else{

                    String email = req.getParameter("email");
                    String senha = req.getParameter("senha");
                    int userId = new CadastroUserService().criarUser(email, senha, false);

                    if(userId > 0){
                        req.setAttribute("op", "CadastrarDadosVendedor");
                        req.setAttribute("id_user", userId);
                        req.setAttribute("msg", "Usuário criado, agora cadastre os dados do vendedor");
                        rd = req.getRequestDispatcher("cadastrarUsuario.jsp");
                        rd.forward(req, resp);
                    }
                }
            } catch (Exception e){
                req.setAttribute("msgErro", "Erro ao criar usuário." + e.getMessage());
                rd = req.getRequestDispatcher("/WEB-INF/pages/home.jsp");
                rd.forward(req, resp);
            }



        }

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String op = req.getParameter("op");
            RequestDispatcher rd;

            if(op != null && op.equals("apagar")){
                req.setAttribute("op", op);
                req.setAttribute("info", Integer.parseInt(req.getParameter("info")));
                rd = req.getRequestDispatcher("cadastroUser");
                rd.forward(req, resp);
                return;
            }


            System.out.println("rolou um get");
            rd = req.getRequestDispatcher("cadastrarUsuario.jsp");
            rd.forward(req, resp);
        }
    }
