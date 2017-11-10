<%@page import="DAO.CidadeDAO"%>
<%@page import="DAO.ProjetoDAO"%>

<%@page import="java.util.ArrayList"%>

<%@page import="entidade.Cidade"%>
<%@page import="entidade.Cliente"%>


<!DOCTYPE html>

<%@include file = "topo.jsp"%>
<%@include file = "barraLateral.jsp"%>


<%
    // Cidade cid = new Cidade();
    Cliente cliente = (Cliente) request.getAttribute("objcli");

    if (cliente == null) {
        cliente = new Cliente();
        cliente.setSituacao('A');
        cliente.setRazaoSocial("");
        cliente.setCpfCnpj("");
        cliente.setEndereco("");
        cliente.setTelefone("");

        Cidade cidade = new Cidade();

        cliente.setCidade(cidade);
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
                        <h3 class="box-title">Cadastro de clientes</h3>
                    </div>

                    <form name="cadCliente" class="form-horizontal" action="/HelpWeb/acao?parametro=cadCliente" method="post">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="id" class="col-sm-2 control-label" >ID</label>


                                <div class="col-md-3 control-label">
                                    <%                                                       if (cliente.getId() > 0) {%>
                                    <input type="text" class="col-md-2 form-control" name="id" value="<%= cliente.getId()%>" Use readonly="true" >

                                    <%} else {
                                    %>

                                    <input type="text" class="form-control" name="id" value="" Use readonly="true" >

                                    <%
                                        }
                                    %>


                                </div>
                            </div>
                            <div class="form-group">
                                <label for="nome" class="col-sm-2 control-label">Nome*</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="nome" value="<%=cliente.getRazaoSocial()%>">

                                </div>
                            </div>
                           


                            <div class="form-group">
                                <label class="col-sm-2 control-label">Tipo*</label>
                                <div class="col-sm-3">
                                    <!-- select -->
                                    <select class="form-control" id="tipo" name="tipo" required >
                                        <%
                                            if (cliente.getId() == 0) {%>
                                        <option value="0" >Selecione</option>
                                         <option value="F" >Pessoa f�sica</option>
                                         <option value="J">Pessoa jur�dica</option>
                                        <%} else if (cliente.getTipoCadastro() == 'F') {
                                        %>
                                        <option value="F" <%= cliente.getCpfCnpj().trim().equals("") ? "selected" : ""%>>Pessoa f�sica</option>
                                        <%} else if (cliente.getTipoCadastro() == 'J') {
                                        %>
                                        <option value="J" <%= cliente.getCpfCnpj().trim().equals("") ? "selected" : ""%>>Pessoa jur�dica</option>
                                       <%
                                        }
                                        %>
                                      



                                    </select>
                                    <!-- /.select -->
                                </div>

                                <div id="grupo_cnpj">
                                    <label class="col-sm-1 control-label">CNPJ*</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="cnpj" id="cnpj" value="<%= cliente.getCpfCnpj()%>" data-inputmask='"mask": "99.999.999/9999-99"' data-mask>
                                    </div>
                                </div>

                                <div id="grupo_cpf">
                                    <label class="col-sm-1 control-label">CPF*</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="cpf" id="cpf" value="<%= cliente.getCpfCnpj()%>" data-inputmask='"mask": "999.999.999-99"' data-mask>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="telefone" class="col-sm-2 control-label">Telefone</label>

                                <div class="col-sm-3">
                                    <%
                                        if (cliente.getTelefone() != null || cliente.getTelefone() != "") {
                                    %>
                                    <input type="text" class="form-control" name="telefone" value="<%=cliente.getTelefone()%>" data-inputmask="'mask': ['(99) 9999-9999[9]']" data-mask>        
                                    <%
                                    } else {
                                    %>
                                    <input type="text" class="form-control"  data-inputmask="'mask': ['(99) 9999-9999[9]']" data-mask>        

                                    <%    }
                                    %>

                                </div>

                            </div>


                            <div class="form-group">
                                <label for="cidade" class="col-sm-2 control-label">Cidade*</label>

                                <select class="form-control select2" style="width: 65%;" name="cidade">
                                    <option value="0" selected>Selecione </option>
                                    <%
                                        Cidade cid = new Cidade();
                                        cid.setDescricao("");
                                        cid.setSituacao('A');

                                        ArrayList<Cidade> cidades = new CidadeDAO().listar(cid);

                                        for (int i = 0; i < cidades.size(); i++) {
                                            if (cliente.getCidade().getId() == cidades.get(i).getId()) {
                                    %>
                                    <option value="<%=cidades.get(i).getId()%>" selected><%=cidades.get(i).getDescricao()%> </option>

                                    <%
                                    } else {
                                    %>
                                    <option value="<%=cidades.get(i).getId()%>"><%=cidades.get(i).getDescricao()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>



                            <div class="form-group">
                                <label for="endereco" class="col-sm-2 control-label">Endere�o</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="endereco" value="<%=cliente.getEndereco()%>">

                                </div>
                            </div>




                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">

                                </div>
                            </div>
                        </div>
                        <%                            if (request.getParameterMap().containsKey("m") && (request.getParameter("m").equals("1") || request.getParameter("m").equals("10"))) {
                        %>
                        <div class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h4><i class="icon fa fa-check"></i> Sucesso!</h4>
                            <%if (request.getParameter("m").equals("1")) {
                            %>
                            Cliente salvo com sucesso!
                            <%
                            } else if (request.getParameter("m").equals("10")) {
                            %>
                            Cliente exclu�do com sucesso!
                            <%
                                }
                            %>

                        </div>
                        <%                                        }
                        %>

                        <%
                            if (request.getParameterMap().containsKey("m") && (request.getParameter("m").equals("2") || request.getParameter("m").equals("3")
                                    || request.getParameter("m").equals("4") || request.getParameter("m").equals("5") || request.getParameter("m").equals("6"))) {
                        %>
                        <div class="alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <h4><i class="icon fa fa-ban"></i> Erro ao salvar cliente!</h4>
                            <%if (request.getParameter("m").equals("2")) {
                            %>
                            <h5>Nome precisa ter de 3 at� 150 caracteres.</h5>   
                            <% } else if (request.getParameter("m").equals("3")) {
                            %>                           
                            � preciso selecionar um tipo.

                            <%} else if (request.getParameter("m").equals("4")) {
                            %> 
                            CPF/CNPJ inv�lido
                            <%
                            } else if (request.getParameter("m").equals("5")) {
                            %> 
                            CPF/CNPJ j� utilizado em outro cadastro.
                            <%
                                }
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

    <%@include file = "listaClientes.jsp"%>

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
<!--
<script>
//        function verificarTipoCadastro() {
//            var x = document.getElementById("tipo").value;
//            if (x == 0) {
//                document.getElementById("cpfcnpj").innerHTML = ""
//            }
//            if (x == 1) {
//                document.getElementById("cpfcnpj").innerHTML = "Voc� n�o � um belo"
//                mask = "99.999.999/9999-99";
//            }
//            if (x == 2) {
//                document.getElementById("cpfcnpj").innerHTML = "Voc� � um belo"
//                mask = "999.999.999-99";
//            }
//            $("input[name=cpf/cnpj]").mask(mask);
//        }





    function verificarTipoCadastro() {

    //$("#tipo").change(function () { //Quando houver uma mudan�a no select
    var x = document.getElementById("tipo").value;
//        var opt = $("#tipo option:selected").val(); //Recupera o valor do option selecionado
            var mask = "";
            if (x == 'J') {
    mask = "99.999.999/9999-99";
            $("input[name=cpfcnpj]").data - Inputmask("999.999.999-99");
    } else if (x == 'J') {
    mask = "999.999.999-99";
            $("input[name=cpfcnpj]").data - Inputmask("999.999.999-99");
//                } else if (x =='0') {
//                    
//                }
    } else {
    mask = "999.999.999-99";
            $("input[name=cpfcnpj]").data - Inputmask(mask);
    }
    );
    }
    );</script>-->

<script>
    $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
        //Money Euro
        $("[data-mask]").inputmask();
        //Desabilita e habilita conforme a manutencao
        $(document).ready(ajustaInterface);
        $(document).ready(habilitarCampos);
        //Ajusta o CNPJ/CPF conforme o tipo de pessoa
        $("#tipo").on("change", ajustaInterface);
    });
    function ajustaInterface() {
        if ($("#tipo").val() === 'F') {
            $("#grupo_cnpj").hide();
            $("#grupo_cpf").show();
            $("#cnpj").prop('required', false);
            $("#cpf").prop('required', true);
        } else {
            $("#grupo_cnpj").show();
            $("#grupo_cpf").hide();
            $("#cnpj").prop('required', true);
            $("#cpf").prop('required', false);
        }
    }

    function habilitarCampos() {
        if ($("#id").val() == 0) {
            $("#tipo").prop("disabled", false);
        } else {
            $("#tipo").prop("disabled", false);
        }
    }
</script>