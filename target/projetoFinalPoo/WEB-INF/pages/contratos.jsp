<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
  <title>Lista de Contratos</title>
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
          <a class="nav-link" href="vendedor">Vendedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="contratos">Contratos</a>
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
  <h2 class="mb-4">Contratos</h2>

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

    <c:if test="${not empty contratos}">
      <div class="table-responsive">
        <table class="table table-bordered table-hover bg-white">
          <thead class="table-primary">
          <tr>
            <th>Cliente</th>
            <th>Início</th>
            <th>Fim</th>
            <th>Descrição</th>
            <th>Valor</th>
            <th>Vendedor</th>
            <th>Ativo</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="contrato" items="${contratos}">
            <tr>
              <td><c:out value="${contrato.nomeCliente}"/></td>
              <td><fmt:formatDate value="${contrato.dataInicio}" pattern="dd/MM/yyyy" /></td>
              <td><fmt:formatDate value="${contrato.dataFim}" pattern="dd/MM/yyyy" /></td>
              <td><c:out value="${contrato.descricao}" /></td>
              <td>R$<fmt:formatNumber value="${contrato.valor}" type="currency" currencySymbol=""/></td>
              <td><c:out value="${contrato.nomeVendedor}" /></td>
              <td>
                <c:choose>
                  <c:when test="${contrato.ativo}">
                    <span class="badge bg-success">Sim</span>
                  </c:when>
                  <c:otherwise>
                    <span class="badge bg-secondary">Não</span>
                  </c:otherwise>
                </c:choose>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </c:if>

    <c:if test="${empty contratos}">
      <div class="alert alert-info" role="alert">
        Nenhum contrato cadastrado ainda.
      </div>
    </c:if>

    <a href="dashboard" class="btn btn-secondary mt-3">Voltar para o Dashboard</a>
    <a href="contratos?op=cadastrar" class="btn btn-primary mt-3">Registrar Contrato</a>
  </c:if>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
