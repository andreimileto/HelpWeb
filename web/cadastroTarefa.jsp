
<%@page import="DAO.FaseDAO"%>
<%@page import="entidade.Fase"%>
<%@page import="DAO.PrioridadeDAO"%>
<%@page import="entidade.Prioridade"%>
<%@page import="DAO.MotivoDAO"%>
<%@page import="entidade.Motivo"%>
<%@page import="DAO.ProjetoDAO"%>
<%@page import="entidade.Projeto"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="entidade.Usuario"%>
<%@page import="DAO.ClienteDAO"%>
<%@page import="entidade.Cliente"%>
<%@page import="entidade.Tarefa"%>



<!--<html>-->


<!--    <body class="hold-transition skin-blue sidebar-mini">-->
<%@include file = "topo.jsp"%>
<%@include file = "barraLateral.jsp"%>


<%
    // Cidade cid = new Cidade();
    Tarefa tar = (Tarefa) request.getAttribute("objtar");

    if (tar == null) {

        tar = new Tarefa();
        tar.setSituacao('A');
        Cidade cidade = new Cidade();
        Cliente cliente = new Cliente();
        cliente.setCidade(cidade);
        tar.setCliente(cliente);

    }
%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <!-- right column -->
            <div class="col-md-12">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Cadastro de tarefa</h3>
                    </div>

                    <form name="cadTarefa" class="form-horizontal" action="/HelpWeb/acao?parametro=cadTarefa" method="post">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="id" class="col-sm-1 control-label" >ID</label>

                                <div class="col-sm-1">
                                    <%                                                       if (tar.getId() > 0) {%>
                                    <input type="text" class="form-control" name="id" value="<%= tar.getId()%>" Use readonly="true" >
                                    <%} else {
                                    %>

                                    <input type="text" class="form-control" name="id" value="" Use readonly="true" >
                                    <%
                                        }
                                    %>

                                </div>
                                <label for="cliente" class="col-sm-0 control-label">Cliente</label>

                                <select class="form-control select2" style="width: 20%;" name="cliente">

                                    <%
                                        Cliente cliente = new Cliente();
                                        cliente.setRazaoSocial("");
                                        cliente.setSituacao('A');

                                        ArrayList<Cliente> clientes = new ClienteDAO().listar(cliente);

                                        for (int i = 0; i < clientes.size(); i++) {
                                            if (tar.getCliente().getId() == clientes.get(i).getId()) {
                                    %>
                                    <option value="<%=clientes.get(i).getId()%>" selected><%=clientes.get(i).getRazaoSocial()%> </option>

                                    <%
                                    } else {
                                    %>
                                    <option value="<%=clientes.get(i).getId()%>"><%=clientes.get(i).getRazaoSocial()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-xs-6 col-sm-3 col-md-8 col-lg-2" style="background-color: yellow;">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-3 col-sm-5">
                                                <label style="float: right;" for="autor" class="col-sm-1 control-label">Autor</label>
                                            </div>

                                            <div class="col-xs-7">
                                                <select  disabled="true" class="form-control select2" style="width: 100%;" name="autor" >

                                                    <%
                                                        Usuario autor = new Usuario();
                                                        if (tar.getId() == 0) {
                                                            autor.setId(Integer.parseInt(session.getAttribute("usuarioLogado").toString()));
                                                        }

                                                        // System.out.println(autor.getId()+"....id");
                                                        autor.setNome("");
                                                        autor.setLogin("");
                                                        autor.setSituacao('A');
                                                        tar.setUsuarioByIdUsuarioAutor(autor);

                                                        UsuarioDAO usuarioDAO = new UsuarioDAO();
                                                        ArrayList<Usuario> usuarios = usuarioDAO.listar(autor);

                                                        for (int i = 0; i < usuarios.size(); i++) {
                                                            //System.out.println(usuarios.size()+".. tamanho");
                                                            if (tar.getUsuarioByIdUsuarioAutor().getId() == usuarios.get(i).getId()) {
                                                    %>
                                                    <option  value="<%=usuarios.get(i).getId()%>"  selected ><%=usuarios.get(i).getNome()%>  </option>

                                                    <%
                                                    } else {
                                                    %>
                                                    <option  value="<%=usuarios.get(i).getId()%>" ><%=usuarios.get(i).getNome()%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="col-sm-3" style="background-color: aqua;">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <label for="responsavel" class="col-sm-1 control-label">Responsavel</label>

                                            </div>
                                            <div class="col-xs-9">
                                                <select class="form-control select2" style="width: 100%;" name="responsavel">

                                                    <%
                                                        Usuario responsavel = new Usuario();
                                                        responsavel.setNome("");
                                                        responsavel.setLogin("");
                                                        responsavel.setSituacao('A');
                                                        tar.setUsuarioByIdUsuarioResponsavel(responsavel);

                                                        UsuarioDAO responsavelDAO = new UsuarioDAO();
                                                        ArrayList<Usuario> responsaveis = usuarioDAO.listar(responsavel);

                                                        for (int i = 0; i < responsaveis.size(); i++) {
                                                            System.out.println(responsaveis.size() + ".. tamanho");
                                                            if (tar.getUsuarioByIdUsuarioResponsavel().getId() == responsaveis.get(i).getId()) {
                                                    %>
                                                    <option value="<%=responsaveis.get(i).getId()%>" selected><%=responsaveis.get(i).getNome()%> </option>

                                                    <%
                                                    } else {
                                                    %>
                                                    <option value="<%=responsaveis.get(i).getId()%>"><%=responsaveis.get(i).getNome()%></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>

                                            </div>


                                        </div>



                                    </div>

                                </div>
                            </div>







                            <div class="form-group">
                                <label for="projeto" class="col-sm-1 control-label">Projeto</label>

                                <select class="form-control select2" style="width: 20%;" name="projeto">

                                    <%
                                        Projeto projeto = new Projeto();
                                        projeto.setDescricao("");
                                        projeto.setSituacao('A');
                                        tar.setProjeto(projeto);

                                        ProjetoDAO projetoDAO = new ProjetoDAO();
                                        ArrayList<Projeto> projetos = projetoDAO.listar(projeto);

                                        for (int i = 0; i < projetos.size(); i++) {
                                            // System.out.println(projetos.size()+".. tamanho");
                                            if (tar.getProjeto().getId() == projetos.get(i).getId()) {
                                    %>
                                    <option value="<%=projetos.get(i).getId()%>" selected><%=projetos.get(i).getDescricao()%> </option>

                                    <%
                                    } else {
                                    %>
                                    <option value="<%=projetos.get(i).getId()%>"><%=projetos.get(i).getDescricao()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>



                            </div>

                            <div class="form-group">
                                <label for="motivo" class="col-sm-1 control-label">Motivo</label>

                                <select class="form-control select2" style="width: 20%;" name="motivo">

                                    <%
                                        Motivo motivo = new Motivo();
                                        motivo.setDescricao("");
                                        motivo.setSituacao('A');
                                        tar.setMotivo(motivo);

                                        MotivoDAO motivoDAO = new MotivoDAO();
                                        ArrayList<Motivo> motivos = motivoDAO.listar(motivo);

                                        for (int i = 0; i < motivos.size(); i++) {
                                            // System.out.println(projetos.size()+".. tamanho");
                                            if (tar.getMotivo().getId() == motivos.get(i).getId()) {
                                    %>
                                    <option value="<%=motivos.get(i).getId()%>" selected><%=motivos.get(i).getDescricao()%> </option>

                                    <%
                                    } else {
                                    %>
                                    <option value="<%=motivos.get(i).getId()%>"><%=motivos.get(i).getDescricao()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>    


                            <div class="form-group">
                                <label for="prioridade" class="col-sm-1 control-label">Prioridade</label>

                                <select class="form-control select2" style="width: 20%;" name="prioridade">

                                    <%
                                        Prioridade prioridade = new Prioridade();
                                        prioridade.setDescricao("");
                                        prioridade.setSituacao('A');
                                        tar.setPrioridade(prioridade);

                                        PrioridadeDAO prioridadeDAO = new PrioridadeDAO();
                                        ArrayList<Prioridade> prioridades = prioridadeDAO.listar(prioridade);

                                        for (int i = 0; i < prioridades.size(); i++) {
                                            // System.out.println(projetos.size()+".. tamanho");
                                            if (tar.getPrioridade().getId() == prioridades.get(i).getId()) {
                                    %>
                                    <option value="<%=prioridades.get(i).getId()%>" selected><%=prioridades.get(i).getDescricao()%> </option>

                                    <%
                                    } else {
                                    %>
                                    <option value="<%=prioridades.get(i).getId()%>"><%=prioridades.get(i).getDescricao()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>  

                            <div class="form-group">
                                <label for="fase" class="col-sm-1 control-label">Fase</label>

                                <select class="form-control select2" style="width: 20%;" name="fase">

                                    <%
                                        Fase fase = new Fase();
                                        fase.setDescricao("");
                                        fase.setSituacao('A');
                                        tar.setFase(fase);

                                        FaseDAO faseDAO = new FaseDAO();
                                        ArrayList<Fase> fases = faseDAO.listar(fase);

                                        for (int i = 0; i < fases.size(); i++) {
                                            // System.out.println(projetos.size()+".. tamanho");
                                            if (tar.getFase().getId() == fases.get(i).getId()) {
                                    %>
                                    <option value="<%=fases.get(i).getId()%>" selected><%=fases.get(i).getDescricao()%> </option>

                                    <%
                                    } else {
                                    %>
                                    <option value="<%=fases.get(i).getId()%>"><%=fases.get(i).getDescricao()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>



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
                            Cidade salva com sucesso!
                            <%
                            } else if (request.getParameter("m").equals("10")) {
                            %>
                            Cidade excluída com sucesso!
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
                            <h5>Erro ao salvar cidade!</h5><br>
                            <h5>Nome precisa ter de 3 até 45 caracteres.</h5>   
                            <% } else if (request.getParameter("m").equals("3")) {

                            %>

                            Erro ao salvar cidade!<br>  
                            Cidade já cadastrada.

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

    <%@include file = "listaCidades.jsp"%>
    <!-- /.content -->
</div>
<%@include file = "inferior.jsp"%>

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bower_components/select2/dist/js/select2.full.js"></script>
<script src="plugins/input-mask/jquery.inputmask.js"></script>
<script src="plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"></script>
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


<script>
    $(function () {
        //Initialize Select2 Elements
        $('.select2').select2()

        //Datemask dd/mm/yyyy
        $('#datemask').inputmask('dd/mm/yyyy', {'placeholder': 'dd/mm/yyyy'})
        //Datemask2 mm/dd/yyyy
        $('#datemask2').inputmask('mm/dd/yyyy', {'placeholder': 'mm/dd/yyyy'})
        //Money Euro
        $('[data-mask]').inputmask()

        //Date range picker
        $('#reservation').daterangepicker()
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'})
        //Date range as a button
        $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function (start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
                }
        )

        //Date picker
        $('#datepicker').datepicker({
            autoclose: true
        })

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        })
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
            checkboxClass: 'icheckbox_minimal-red',
            radioClass: 'iradio_minimal-red'
        })
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_flat-green'
        })

        //Colorpicker
        $('.my-colorpicker1').colorpicker()
        //color picker with addon
        $('.my-colorpicker2').colorpicker()

        //Timepicker
        $('.timepicker').timepicker({
            showInputs: false
        })
    })
</script>

