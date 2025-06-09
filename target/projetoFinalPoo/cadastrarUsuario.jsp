        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@page isELIgnored="false"%>
        <html>
        <head>
            <title>Home</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        </head>
        <body>
        <div class="p-3 m-0 border-0 bd-example m-0 border-0">
            <h2>Cadastrar</h2>

            <c:if test="${op != 'CadastrarDadosVendedor'}">
                <form method="post" action="cadastroUser">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="mb-3">
                        <label for="senha" class="form-label">Senha</label>
                        <input type="password" class="form-control" id="senha" name="senha">
                    </div>
                    <button type="submit" class="btn btn-primary" value="cadastrar">Criar conta</button>
                    <div class="text-center">
                    </div>
                </form>
            </c:if>



            <c:if test="${op == 'CadastrarDadosVendedor'}">

                <form action="cadastroUser" method="post">
                    <fieldset>
                        <legend>Dados pessoais</legend>
                        <div class="mb-3">
                            <label for="nomeVendedor" class="form-label">Nome</label>
                            <input type="text" class="form-control" id="nomeVendedor" name="nomeVendedor">
                        </div>
                        <div class="mb-3">
                            <label for="telefone" class="form-label">Telefone</label>
                            <input type="text" class="form-control" id="telefone" name="telefone">
                        </div>
                        <input type="hidden" value="${id_user}" name="user_id">
                    </fieldset>
                    <button type="submit" class="btn btn-primary" name="op" value="CadastrarDadosVendedor">Criar conta</button>
                </form>
            </c:if>




            <c:if test="${not empty msg}">
                <span>${msg}</span>
            </c:if>
        </div>
        </body>
        </html>
