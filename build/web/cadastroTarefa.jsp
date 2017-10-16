
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
            <div class="col-md-6">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Cadastro de tarefa</h3>
                    </div>

                    <form name="cadTarefa" class="form-horizontal" action="/HelpWeb/acao?parametro=cadTarefa" method="post">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="id" class="col-sm-2 control-label" >ID</label>

                                <div class="col-sm-2">
                                    <%                                                       if (tar.getId() > 0) {%>
                                    <input type="text" class="form-control" name="id" value="<%= tar.getId()%>" Use readonly="true" >
                                    <%} else {
                                    %>

                                    <input type="text" class="form-control" name="id" value="" Use readonly="true" >
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cliente" class="col-sm-2 control-label">Cliente</label>

                                <select class="form-control select2" style="width: 49%;" name="cliente">

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
                                    <option value="<%=clientes.get(i).getId()%>"><%=clientes.get(i).getRazaoSocial() %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                                
                                <div class="form-group">
                                <label for="responsavel" class="col-sm-2 control-label">Responsavel</label>

                                <select class="form-control select2" style="width: 49%;" name="responsavel">

                                    <%
                                        Usuario responsavel = new Usuario();
                                        responsavel.setNome("");
                                        responsavel.setLogin("");
                                        responsavel.setSituacao('A');
                                        tar.setUsuarioByIdUsuarioResponsavel(responsavel);
                                        
                                        UsuarioDAO usuarioDAO = new UsuarioDAO();
                                        ArrayList<Usuario> usuarios = usuarioDAO.listar(responsavel);

                                        for (int i = 0; i < usuarios.size(); i++) {
                                            System.out.println(usuarios.size()+".. tamanho");
                                            if (tar.getUsuarioByIdUsuarioResponsavel().getId() == usuarios.get(i).getId()) {
                                    %>
                                    <option value="<%=usuarios.get(i).getId()%>" selected><%=usuarios.get(i).getNome()%> </option>

                                    <%
                                    } else {
                                    %>
                                    <option value="<%=usuarios.get(i).getId()%>"><%=usuarios.get(i).getNome() %></option>
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

