<%@page import="DAO.VersaoDAO"%>
<%@page import="entidade.Versao"%>
<%@page import="entidade.Projeto"%>
<%@page import="DAO.ModuloDAO"%>
<%@page import="entidade.Modulo"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>



    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de versões</h3>
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
                            Versao ver = new Versao();
                            Projeto proj = new Projeto();
                            ver.setProjeto(proj);
                            ver.setDescricao("");
                            ArrayList<Versao> versoes = new VersaoDAO().listar(ver);

                            for (int i = 0; i < versoes.size(); i++) {
                        %>

                        <tr>
                            <td><%=versoes.get(i).getId()%></td>
                            <td><%=versoes.get(i).getDescricao()%></td>
                            <td><%=versoes.get(i).getProjeto().getDescricao()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edVersao&id=<%=versoes.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exVersao&id=<%=versoes.get(i).getId()%>"  onclick="return confirm('Tem certeza que deseja excluir a versão?');"><span class="label label-danger pull-right-container">Excluir</span></a>
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
