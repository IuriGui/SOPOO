<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>Adicionar cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="..." crossorigin="anonymous"></script>

</head>
<%--<body class=""> p-3 m-0 border-0 bd-example m-0 border-0--%>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="dashboard">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="cliente">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="vendedor">Vendedores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contratos?op=cadastrar">Contratos</a>
                </li>
            </ul>
            <div class="dropdown ms-auto">
                <button class="btn btn-secondary dropdown-toggle" type="button"
                        id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    <c:out value="${user}" default="Login"/>
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="#">Perfil</a></li>
                    <li><a class="dropdown-item" href="logout">Sair</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<c:if test="${not empty msg}">
    <div class="container mt-3">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${msg}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>
<c:if test="${not empty msgSucesso}">
    <div class="container mt-3">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${msgSucesso}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>


<c:if test="${not empty user}">

    <div class="container mt-5">
        <div class="card shadow-lg rounded-4">
            <div class="card-body">
                <h3 class="card-title text-center mb-4">
                        ${op == 'editar' ? 'Editar Cliente' : 'Cadastrar Novo Cliente'}
                </h3>

                <form action="cliente" method="post">
                    <fieldset>
                        <legend class="mb-3">Dados do Cliente</legend>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="${op == 'editar' ? 'razaoE' : 'razao'}" class="form-label">Razão
                                    Social</label>
                                <input
                                        type="text"
                                        class="form-control"
                                        id="${op == 'editar' ? 'razaoE' : 'razao'}"
                                        name="razao"
                                        value="${(op == 'editar' || op == 'apagar') ? cliente.nome : ''}"
                                        placeholder="Digite a razão social"
                                        ${op == 'apagar' ? 'readonly' : ''}
                                >
                            </div>
                            <div class="col-md-6">
                                <label for="${op == 'editar' ? 'docE' : 'doc'}" class="form-label">CPF/CNPJ</label>
                                <input
                                        type="text"
                                        class="form-control"
                                        id="${op == 'editar' ? 'docE' : 'doc'}"
                                        name="doc"
                                        value="${(op == 'editar' || op == 'apagar') ? cliente.cpf : ''}"
                                        placeholder="Digite o CPF ou CNPJ"
                                        ${op == 'apagar' ? 'readonly' : ''}
                                >
                                <input type="hidden" value="${cliente.id}" name="info">
                            </div>
                        </div>
                    </fieldset>

                    <c:if test="${op != 'editar' && op != 'apagar'}">
                        <fieldset>
                            <legend class="mb-3">Contato</legend>

                            <div class="row mb-3">
                                <div class="col-md-4">
                                    <label for="nome" class="form-label">Nome</label>
                                    <input type="text" class="form-control" id="nome" name="nome"
                                           placeholder="Digite o nome do contato">
                                </div>
                                <div class="col-md-4">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                           placeholder="Digite o email do contato">
                                </div>
                                <div class="col-md-4">
                                    <label for="telefone" class="form-label">Telefone</label>
                                    <input type="text" class="form-control" id="telefone" name="telefone"
                                           placeholder="Digite o telefone">
                                </div>
                            </div>
                        </fieldset>
                    </c:if>

                    <div class="text-end mt-4">
                        <button
                                type="submit"
                                class="btn ${op == 'apagar' ? "btn-danger" : "btn-primary"} px-4 py-2"
                                name="op"
                                value="${op == 'editar' ? 'update' : (op == 'apagar' ? 'apagar' : 'cadastrar')}"
                        >
                                ${op == 'editar' ? 'Salvar alterações' : (op == 'apagar' ? 'Confirmar exclusão' : 'Adicionar cliente')}
                        </button>
                        <a href="cliente" class="btn btn-secondary text-decoration-none">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</c:if>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>
</body>
</html>
