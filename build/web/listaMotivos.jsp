<%@page import="DAO.MotivoDAO"%>
<%@page import="entidade.Motivo"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>



    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de motivos</h3>
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
                            Motivo motivo = new Motivo();
                            motivo.setDescricao("");
                            ArrayList<Motivo> motivos = new MotivoDAO().listar(motivo);

                            for (int i = 0; i < motivos.size(); i++) {
                        %>

                        <tr>
                            <td><%=motivos.get(i).getId()%></td>
                            <td><%=motivos.get(i).getDescricao()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edMotivo&id=<%=motivos.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exMotivo&id=<%=motivos.get(i).getId()%>"><span class="label label-danger pull-right-container">Excluir</span></a>
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
