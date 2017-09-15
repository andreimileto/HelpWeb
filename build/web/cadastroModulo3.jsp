<%@page import="DAO.ProjetoDAO"%>

<%@page import="java.util.ArrayList"%>

<%@page import="entidade.Projeto"%>
<%@page import="entidade.Modulo"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file = "topo.jsp"%>
<%@include file = "barraLateral.jsp"%>
<%
    // Cidade cid = new Cidade();
    Modulo modulo = (Modulo) request.getAttribute("objmod");

    if (modulo == null) {
        modulo = new Modulo();
        modulo.setSituacao('A');
        modulo.setDescricao("");

        Projeto projeto = new Projeto();

        modulo.setProjeto(projeto);
    }
%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <!-- right column -->
            <div class="col-md-6">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Cadastro de módulos</h3>
                    </div>

                    <form name="cadCidade" class="form-horizontal" action="/HelpWeb/acao?parametro=cadModulo" method="post">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="id" class="col-sm-2 control-label" >ID</label>

                                <div class="col-sm-2">
                                    <%                                                       if (modulo.getId() > 0) {%>
                                    <input type="text" class="form-control" name="id" value="<%= modulo.getId()%>" Use readonly="true" >
                                    <%} else {
                                    %>

                                    <input type="text" class="form-control" name="id" value="" Use readonly="true" >
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Nome</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="descricao" value="<%= modulo.getDescricao()%>">

                                </div>
                            </div>
                                    
                                     <label for="projeto" class="col-sm-2 control-label">Projeto</label>
                            <select class="form-control select2" style="width: 49%;">
                                <%

                                    Projeto projeto = new Projeto();
                                    projeto.setDescricao("");
                                    projeto.setSituacao('A');

                                    ArrayList<Projeto> projetos = new ProjetoDAO().listar(projeto);

                                    for (int i = 0; i < projetos.size(); i++) {
                                %>
                                <option><%=projetos.get(i).getDescricao()%></option>
                                <%
                                    }

                                %>
                            </select>
                                    
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">

                                </div>
                            </div>
                        </div>
                        <%
                            if (request.getParameterMap().containsKey("m") && (request.getParameter("m").equals("1") || request.getParameter("m").equals("10"))) {
                        %>
                        <div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h4><i class="icon fa fa-check"></i> Sucesso!</h4>
                            <%if (request.getParameter("m").equals("1")) {
                            %>
                            Módulo salvo com sucesso!
                            <%
                            } else if (request.getParameter("m").equals("10")) {
                            %>
                            Módulo excluído com sucesso!
                            <%
                                }
                            %>

                        </div>
                        <%                                        }
                        %>

                        <%
                            if (request.getParameterMap().containsKey("m") && (request.getParameter("m").equals("2") || request.getParameter("m").equals("3"))) {
                        %>
                        <div class="alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h4><i class="icon fa fa-ban"></i> Erro!</h4>
                            <%if (request.getParameter("m").equals("2")) {
                            %>
                            <h5>Erro ao salvar módulo!</h5><br>
                            <h5>Nome precisa ter de 3 até 150 caracteres.</h5>   
                            <% } else if (request.getParameter("m").equals("3")) {

                            %>

                            Erro ao salvar módulo!<br>  
                            Módulo já cadastrado.

                            <%                                }

                            %>

                        </div>
                        <%                                        }
                        %>

                        <div class="box-footer">

                            <input type="submit" class="btn btn-dropbox pull-right-container" name="enviar" value="Salvar"> 

                        </div>

                    </form>

                </div>

            </div>
            <!--/.col (right) -->
        </div>
        <!-- /.row -->
    </section>

    <%//@include file = "listaModulos.jsp"%>
    <!-- /.content -->
</div>
<%@include file = "inferior.jsp"%>

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
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


