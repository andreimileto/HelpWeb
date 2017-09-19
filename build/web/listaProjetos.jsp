<%@page import="DAO.ProjetoDAO"%>
<%@page import="entidade.Projeto"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>



    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de projetos</h3>
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
                            Projeto projeto = new Projeto();
                            projeto.setDescricao("");
                            ArrayList<Projeto> projetos = new ProjetoDAO().listar(projeto);

                            for (int i = 0; i < projetos.size(); i++) {
                        %>

                        <tr>
                            <td><%=projetos.get(i).getId()%></td>
                            <td><%=projetos.get(i).getDescricao()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edProjeto&id=<%=projetos.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exProjeto&id=<%=projetos.get(i).getId()%>"><span class="label label-danger pull-right-container">Excluir</span></a>
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
