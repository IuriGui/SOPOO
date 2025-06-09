<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <title>Adicionar contrato</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous" />
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

<div class="container mt-5 mb-5">
  <c:if test="${not empty msg}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        ${msg}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fechar"></button>
    </div>
  </c:if>
  <c:if test="${not empty msgSuccess}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${msgSuccess}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fechar"></button>
    </div>
  </c:if>

  <c:if test="${not empty user}">
    <div class="card shadow rounded-4">
      <div class="card-body">
        <h3 class="card-title mb-4 text-center">Cadastrar Novo Contrato</h3>

        <form action="contratos" method="post" novalidate>
          <fieldset class="mb-4">
            <legend class="h5 mb-3">Cliente</legend>
            <label for="clientes" class="form-label">Cliente</label>
            <select class="form-select" name="clientes" id="clientes" required>
              <option value="" disabled selected>Selecione um Cliente</option>
              <c:forEach var="client" items="${clientela}">
                <option value="${client.id}">${client.nome}</option>
              </c:forEach>
            </select>
          </fieldset>

          <fieldset class="mb-4">
            <legend class="h5 mb-3">Dados do Contrato</legend>

            <div class="row g-3 mb-3">
              <div class="col-md-6">
                <label for="dataInicio" class="form-label">Data Início</label>
                <input type="date" class="form-control" id="dataInicio" name="dataInicio" required />
              </div>
              <div class="col-md-6">
                <label for="dataFim" class="form-label">Data Fim</label>
                <input type="date" class="form-control" id="dataFim" name="dataFim" required />
              </div>
            </div>

            <div class="mb-3">
              <label for="descricao" class="form-label">Descrição</label>
              <input type="text" class="form-control" id="descricao" name="descricao" placeholder="Descrição do contrato" required />
            </div>

            <div class="input-group mb-3">
              <span class="input-group-text">R$</span>
              <input type="number" class="form-control" id="valor" name="valor" step="0.01" min="0" placeholder="0,00" required />
            </div>

            <div>
              <label for="vendedor" class="form-label">Vendedor</label>
              <select class="form-select" name="vendedor" id="vendedor" required>
                <option value="" disabled selected>Selecione um vendedor</option>
                <c:forEach var="vendedor" items="${vendedores}">
                  <option value="${vendedor.id}">${vendedor.nome}</option>
                </c:forEach>
              </select>
            </div>
          </fieldset>

          <div class="d-flex justify-content-end gap-2">
            <button type="submit" class="btn btn-primary px-4" value="cadastrar">Registrar contrato</button>
            <a href="contratos" class="btn btn-secondary px-4 text-decoration-none">Cancelar</a>
          </div>
          <input type="hidden" name="op" value="cadastrar"/>
        </form>
      </div>
    </div>
  </c:if>

  <c:if test="${empty user}">
    <div class="alert alert-warning mt-4" role="alert">
      Você precisa estar logado para ver o dashboard. <a href="login.jsp" class="alert-link">Clique aqui para entrar</a>.
    </div>
  </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO"
        crossorigin="anonymous"></script>
</body>
</html>
