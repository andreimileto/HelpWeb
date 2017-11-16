<%@page import="DAO.FaseDAO"%>
<%@page import="entidade.Fase"%>
<%@page import="DAO.CidadeDAO"%>
<%@page import="entidade.Cidade"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>



    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de fases</h3>
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
                            Fase fas = new Fase();
                            fas.setDescricao("");
                            ArrayList<Fase> fases = new FaseDAO().listar(fas);

                            for (int i = 0; i < fases.size(); i++) {
                        %>

                        <tr>
                            <td><%=fases.get(i).getId()%></td>
                            <td><%=fases.get(i).getDescricao()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edFase&id=<%=fases.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exFase&id=<%=fases.get(i).getId()%>"  onclick="return confirm('Tem certeza que deseja excluir a fase??');"><span class="label label-danger pull-right-container">Excluir</span></a>
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
