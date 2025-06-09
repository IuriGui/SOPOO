<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
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
                    <a class="nav-link" href="cliente">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="vendedor">Vendedores</a>
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

<div class="container mt-5">
    <h2 class="mb-4">Vendedores</h2>

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

    <c:if test="${op == 'editar' && not empty vendedor}">
        <div class="card mt-5">
            <div class="card-header bg-primary text-white">
                Editar Vendedor
            </div>
            <div class="card-body">
                <form action="vendedor" method="post">
                    <input type="hidden" name="op" value="editar"/>
                    <input type="hidden" name="id" value="${vendedor.id}"/>

                    <div class="mb-3">
                        <label class="form-label">Nome</label>
                        <input type="text" name="nome" class="form-control" value="${vendedor.nome}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Telefone</label>
                        <input type="text" name="telefone" class="form-control" value="${vendedor.telefone}" required>
                    </div>
                    <button type="submit" class="btn btn-success">Atualizar</button>
                    <a href="vendedor" class="btn btn-secondary">Cancelar</a>
                </form>
            </div>
        </div>
    </c:if>



    <c:if test="${not empty vendedores && op != 'editar'}">
        <div class="table-responsive">
            <table class="table table-bordered table-hover bg-white">
                <thead class="table-primary">
                <tr>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>Salário base</th>
                    <th>Comissão</th>
                    <th>Salário Total</th>
                    <th>Total Vendido</th>
<%--                    <th>Ações</th>--%>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="vendedor" items="${vendedores}">
                    <tr>
                        <td>${vendedor.nome}</td>
                        <td>${vendedor.telefone}</td>
                        <td><fmt:formatNumber value="${vendedor.salario}" pattern="#,##0.00" /></td>
                        <td>${(vendedor.comissao * 100)}%</td>
                        <td>R$<fmt:formatNumber value="${vendedor.salarioComComissao}" pattern="#,##0.00" /></td>
                        <td>R$<fmt:formatNumber value="${vendedor.totalVendido != null ? vendedor.totalVendido : 0}" pattern="#,##0.00" /></td>
<%--                        <td>--%>
<%--                            <a href="vendedor?op=editar&info=${vendedor.id}">Editar </a>--%>
<%--                            <a href="vendedor?op=apagar&info=${vendedor.id}">Apagar</a>--%>
<%--                        </td>--%>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>

    <c:if test="${empty vendedores}">
        <div class="alert alert-info" role="alert">
            Nenhum vendedor cadastrado ainda.
        </div>
    </c:if>

    <a href="dashboard" class="btn btn-secondary mt-3">Voltar para o Dashboard</a>

</div>
</c:if>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</body>
</html>
