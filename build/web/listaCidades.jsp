<%@page import="DAO.CidadeDAO"%>
<%@page import="entidade.Cidade"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--  <title>AdminLTE 2 | Data Tables</title>-->

        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

        <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">

        <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">

        <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">

        <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">

        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--  [if lt IE 9]>
        -->  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><!--
        <![endif]-->

        <!-- Google Font -->

    </head>


    <section class="content-header">


        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Data Table With Full Features</h3>
            </div>


            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th></th>
                            <!--                            <th>Platform(s)</th>
                                                        <th>Engine version</th>-->

                        </tr>
                    </thead>


                    <tbody>
                        <%
                            Cidade cidade = new Cidade();
                            cidade.setDescricao("");
                            ArrayList<Cidade> cidades = new CidadeDAO().listar(cidade);

                            for (int i = 0; i < cidades.size(); i++) {
                        %>

                        <tr>
                            <td><%=cidades.get(i).getId()%></td>
                            <td><%=cidades.get(i).getDescricao()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edCidade&id=<%=cidades.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                            <a href="/HelpWeb/acao?parametro=exCidade&id=<%=cidades.get(i).getId()%>"><span class="label label-danger pull-right-container">Excluir</span></a>
                            </td>
                            
                        </tr>
                        <%

                            }
                        %>



                    </tbody>
                    <!--                        <tr>
                                                <td>Trident</td>
                                                <td>Internet
                                                    Explorer 5.0
                                                </td>
                                                <td>Win 95+</td>
                                                <td>5</td>
                                                <td>C</td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Other browsers</td>
                                                <td>All others</td>
                                                <td>-</td>
                                                <td>-</td>
                                                <td>U</td>
                                            </tr>-->

                    <!--                    <tfoot>
                                            <tr>
                                                <th>Rendering engine</th>
                                                <th>Browser</th>
                                                <th>Platform(s)</th>
                                                <th>Engine version</th>
                                                
                                            </tr>
                                        </tfoot>-->
                </table>
            </div>
            <!--             /.box-body -->
        </div>
        <!--           /.box -->
    </div>
    <!--         /.col -->
</div>
<!--       /.row -->
</section>
<!--     /.content -->
</div>
<aside class="control-sidebar control-sidebar-dark">
</ul>
</ul>


</div>

<!--          <h3 class="control-sidebar-heading">Chat Settings</h3>-->

<!--          <div class="form-group">
            <label class="control-sidebar-subheading">
              Show me as online
              <input type="checkbox" class="pull-right" checked>
            </label>
          </div>-->
<!-- /.form-group -->

<!--          <div class="form-group">
            <label class="control-sidebar-subheading">
              Turn off notifications
              <input type="checkbox" class="pull-right">
            </label>
          </div>-->
<!-- /.form-group -->

<!--          <div class="form-group">
            <label class="control-sidebar-subheading">
              Delete chat history
              <a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>
            </label>
          </div>-->
<!-- /.form-group -->
</form>
</div>
<!-- /.tab-pane -->
</div>
</aside>
<!-- /.control-sidebar -->
<!-- Add the sidebar's background. This div must be placed
     immediately after the control sidebar -->
<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

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
</body>
</html>
