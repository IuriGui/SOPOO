### Sobre o projeto
- Este projeto visa implementar um sistema que permita o gerenciamento total de uma rádio.

### Futuras mudanças

No momento o sistema de permissão por usuário não funciona, sendo todos os usuários registrados vendedores. Pretendo adicionar admin, gestor de venda, financeiro, secretária, operador de áudio e locutores.
Cada um tendo suas próprias views. Talvez integrar com os emails dos usuários.

## ✅ URGENTE
- [-]  Criar sistema de permissões por tipo de usuário.
- [X] Terminar o cadastro de contrato. Se precisar, acabar com a ideia.
- [X] Realizar o calculo de comissão após registrar o contrato.
- [X] Exibir algo na primeira página (ranking de cliente, gráfico do mês).
- [X] Montar consulta que retorne as vendas do mês.
- [-] Alerta de contratos que vão vencer nos próximos 30 dias.
- [-] Adicionar gráfico de vendas por mês com Chart.js ou Google Charts.
- [X] 🏆 Exibir posição no ranking de gastos (ex: 1°, 2°, 3°).
- [x] Criar dashboard com métricas (total vendido, contratos ativos, etc).

---

## 📌 NORMAL

- [x] Login sem autenticar corretamente a senha. Modificar LoginService.
- [x] Montar consultas para retornar os clientes com seus contatos.
- [x] Registro de contatos.
- [x] Cadastro de clientes.
- [ ] Exportar dados de contratos ou clientes em CSV/Excel.
- [ ] Gerar PDF do contrato com iText ou JasperReports.
- [ ] Filtro de contratos por período, cliente, vendedor, valor mínimo/máximo.
- [ ] Exibir histórico de alterações em contratos/clientes.

---

## 🐢 BAIXO

- [ ] Criar um objeto "Página" que tem o nome e quem pode acessar.
- [ ] Definir tipos nos usuários (admin, vendedor, cliente).
- [X] DAO do usuário, foco no service para autenticar sessão.
- [ ] Exibir dados dos clientes corretamente.
- [X] Pensar em como exibir os dados.
- [ ] Cadastro de vendedores.
- [ ] Registro de contratos.
- [ ] DAOs de vendedores, contratos.
- [ ] Remodelar as classes que herdam User.
- [-] Adicionar comentários internos em contratos.
- [-] Sugerir valores baseados no histórico de contratos do cliente.

---

## 💡 IDEIAS FUTURAS / BONUS

- []  Relatório mensal automático por e-mail (com JavaMail).
- [-]  Criar portal do cliente para consultar seus contratos.
- [-]  Importar clientes de arquivo CSV.
- [-]  Implementar recomendação simples com base nos contratos anteriores.