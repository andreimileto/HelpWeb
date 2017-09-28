<%@page import="DAO.ClienteDAO"%>
<%@page import="entidade.Cliente"%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>



    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de clientes</h3>
            </div>

            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOME</th>
                            <th>CPF/CNPJ</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Cliente clien = new Cliente();
                            clien.setRazaoSocial("");
                            clien.setTelefone("");
                            clien.setCpfCnpj("");
                            clien.setEndereco("");
                            ArrayList<Cliente> clientes = new ClienteDAO().listar(clien);

                            for (int i = 0; i < clientes.size(); i++) {
                        %>

                        <tr>
                            <td><%=clientes.get(i).getId()%></td>
                            <td><%=clientes.get(i).getRazaoSocial() %></td>
                            <td><%=clientes.get(i).getCpfCnpj()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edCliente&id=<%=clientes.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exCliente&id=<%=clientes.get(i).getId()%>"><span class="label label-danger pull-right-container">Excluir</span></a>
                            </td>

                        </tr>
                        <%

                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

    </section>


<aside class="control-sidebar control-sidebar-dark">

</aside>

<div class="control-sidebar-bg">

</div>

