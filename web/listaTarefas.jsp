<%@page import="entidade.Cidade"%>
<%@page import="DAO.TarefaDAO"%>
<%@page import="entidade.Fase"%>
<%@page import="entidade.Usuario"%>
<%@page import="entidade.Modulo"%>
<%@page import="entidade.Tarefa"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="entidade.Cliente"%>

<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<%@include file = "topo.jsp"%>
<%@include file = "barraLateral.jsp"%>

<div class="content-wrapper">
    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de tarefas</h3>
            </div>

            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>TÍTULO</th>
                            <th>AUTOR</th>
                            <th>RESPONSÁVEL</th>
                            <th>FASE</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            //Cliente clien = new Cliente();
                            // clien.setRazaoSocial("");
                            //  clien.setTelefone("");
                            //clien.setCpfCnpj("");
                            //clien.setEndereco("");

                            Tarefa tarefa = new Tarefa();
                            Cidade cid = new Cidade();
                            Cliente cli = new Cliente();
                            cli.setCidade(cid);
                            Usuario aut = new Usuario();
                            Usuario respons = new Usuario();

                            Fase fas = new Fase();
                            tarefa.setCliente(cli);
                            tarefa.setUsuarioByIdUsuarioAutor(aut);
                            tarefa.setUsuarioByIdUsuarioResponsavel(respons);
                            tarefa.setFase(fas);

                            ArrayList<Tarefa> tarefas = new TarefaDAO().listar(tarefa);

//                            tarefas.get(0).getUsuarioByIdUsuarioAutor()
                            for (int i = 0; i < tarefas.size(); i++) {
                        %>

                        <tr>
                            <td><%=tarefas.get(i).getId()%></td>
                            <td><%=tarefas.get(i).getTitulo()%></td>
                            <td><%=tarefas.get(i).getUsuarioByIdUsuarioAutor().getNome()%></td>
                            <td><%=tarefas.get(i).getUsuarioByIdUsuarioResponsavel().getNome()%></td>
                            <td><%=tarefas.get(i).getFase().getDescricao()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edTarefa&id=<%=tarefas.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exTarefa&id=<%=tarefas.get(i).getId()%>"><span class="label label-danger pull-right-container">Excluir</span></a>
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
</div>
                    <%@include file = "inferior.jsp"%>

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bower_components/select2/dist/js/select2.full.js"></script>

<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="plugins/timepicker/bootstrap-timepicker.min.js"></script>
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="plugins/iCheck/icheck.min.js"></script>
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<script src="dist/js/adminlte.min.js"></script>
<script src="dist/js/demo.js"></script>

<script>
    $(function () {
        $('#example1').DataTable()
        $('#example2').DataTable({
            'paging': true,
            'lengthChange': false,
            'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': false
        })
    })
</script> 


<aside class="control-sidebar control-sidebar-dark">

</aside>

<div class="control-sidebar-bg">

</div>

