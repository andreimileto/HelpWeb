<%@page import="entidade.Projeto"%>
<%@page import="DAO.ModuloDAO"%>
<%@page import="entidade.Modulo"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>



    <section class="content-header">

        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Lista de módulos</h3>
            </div>

            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOME</th>
                            <th>PROJETO</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Modulo mod = new Modulo();
                            Projeto proj = new Projeto();
                            mod.setProjeto(proj);
                            mod.setDescricao("");
                            ArrayList<Modulo> modulos = new ModuloDAO().listar(mod);

                            for (int i = 0; i < modulos.size(); i++) {
                        %>

                        <tr>
                            <td><%=modulos.get(i).getId()%></td>
                            <td><%=modulos.get(i).getDescricao()%></td>
                            <td><%=modulos.get(i).getProjeto().getDescricao()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edModulo&id=<%=modulos.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exModulo&id=<%=modulos.get(i).getId()%>"><span class="label label-danger pull-right-container">Excluir</span></a>
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
