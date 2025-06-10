<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<meta charset="UTF-8">
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <c:if test="${not empty msg}">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" c aria-current="page" href="dashboard">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cliente">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="vendedor">Vendedores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contratos">Contratos</a>
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
        </c:if>
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

<c:if test="${not empty msgSuccess}">
    <div class="container mt-3">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${msgSuccess}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>



<c:if test="${not empty user}">
    <div class="container mt-4">
        <div class="card p-4 shadow-sm">
            <div class="row text-center mb-4">
                <div class="col-md-4">
                    <div class="bg-light p-3 rounded shadow-sm">
                        <h6>Total Vendido</h6>
                        <h3 class="text-success">
                            <c:if test="${not empty totalVendido}">
                                R$${totalVendido}
                            </c:if></h3>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="bg-light p-3 rounded shadow-sm">
                        <h6>Contratos Ativos</h6>
                        <h3 class="text-primary">
                            <c:if test="${not empty totalVendido}">
                                ${qtdContratos}
                            </c:if></h3>

                        </h3>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="bg-light p-3 rounded shadow-sm">
                        <h6>Novos Clientes Este Mês</h6>
                        <h3 class="text-warning">
                            <c:if test="${not empty totalVendido}">
                                ${clienteNovosMes}
                            </c:if></h3>
                        </h3>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card shadow">
                        <div class="card-header bg-secondary text-white">
                            <h5 class="mb-0">🏆 Ranking de Clientes</h5>
                        </div>
                        <div class="card-body table-responsive">
                            <table class="table table-hover text-center align-middle">
                                <thead class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Nome</th>
                                    <th>Gasto Total</th>
                                        <%--                                <th>Nº Contratos</th>--%>
                                        <%--                                <th>Média por Contrato</th>--%>
                                        <%--                                <th>Última Compra</th>--%>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="cliente" items="${clientOrdenado}" varStatus="status">
                                    <tr>
                                        <td><strong>${status.index + 1}</strong></td>
                                        <td>${cliente.nome}</td>
                                        <td>R$ ${cliente.gastoTotal}</td>
                                            <%--                                    <td>${cliente.qtdContratos}</td>--%>
                                            <%--                                    <td>R$ ${cliente.mediaGasto}</td>--%>
                                            <%--                                    <td>${cliente.ultimaCompra}</td>--%>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
<%--                            <p class="text-muted mt-2"></p>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${empty user}">
    <div class="container mt-4">
        <div class="alert alert-warning">
            Você precisa estar logado para ver o dashboard. <a href="index.jsp">Clique aqui para entrar</a>.
        </div>
    </div>
</c:if>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>
</body>
</html>
