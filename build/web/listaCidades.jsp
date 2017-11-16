<%@page import="DAO.CidadeDAO"%>
<%@page import="entidade.Cidade"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>



    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de cidades</h3>
            </div>

            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOME</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Cidade cidade = new Cidade();
                            cidade.setDescricao("");
                            ArrayList<Cidade> cidades = new CidadeDAO().listar(cidade);

                            for (int i = 0; i < cidades.size(); i++) {
                        %>

                        <tr>
                            <td><%=cidades.get(i).getId()%></td>
                            <td><%=cidades.get(i).getDescricao()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edCidade&id=<%=cidades.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exCidade&id=<%=cidades.get(i).getId()%>" onclick="return confirm('Tem certeza que deseja excluir a cidade?');"><span class="label label-danger pull-right-container">Excluir</span></a>
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

<!--</body>-->
