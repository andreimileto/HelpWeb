<%@page import="DAO.UsuarioDAO"%>
<%@page import="entidade.Usuario"%>
<%@page import="DAO.CidadeDAO"%>
<%@page import="entidade.Cidade"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>



    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de usu�rios</h3>
            </div>

            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOME</th>
                            <th>LOGIN</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Usuario user = new Usuario();
                            user.setNome("");
                            user.setLogin("");
                            UsuarioDAO usuarioDAO = new UsuarioDAO();
                            
                            ArrayList<Usuario> usuarios =usuarioDAO.listar(user);

                            for (int i = 0; i < usuarios.size(); i++) {
                        %>

                        <tr>
                            <td><%=usuarios.get(i).getId()%></td>
                            <td><%=usuarios.get(i).getNome()%></td>
                            <td><%=usuarios.get(i).getLogin()%></td>
                            <td><a href="/HelpWeb/acao?parametro=edUsuario&id=<%=usuarios.get(i).getId()%>"><span class="label label-primary pull-left-container">Editar</span></a>
                                <a href="/HelpWeb/acao?parametro=exUsuario&id=<%=usuarios.get(i).getId()%>" onclick="return confirm('Tem certeza que deseja excluir o usu�rio?');"><span class="label label-danger pull-right-container">Excluir</span></a>
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
