<%@page import="entidade.MovimentoTarefa"%>
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



    <section class="content-header">

        <div class="box box-info">
            <div class="box-header">
                <h3 class="box-title">Lista de movimentacoes</h3>
            </div>

            <div class="box-body">
                <table id="example1" class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DESCRIÇÃO</th>
                            <th>USUÁRIO</th>
                            <th>DATA DA MOVIMENTAÇÃO</th>
                            
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
                             Tarefa taref = (Tarefa) request.getAttribute("objtar");
                            
                            MovimentoTarefa movimentoTarefa = new MovimentoTarefa();
                            Tarefa tarefa = new Tarefa();
                        movimentoTarefa.setTarefa(taref);
                        System.out.println("id..." +movimentoTarefa.getTarefa().getId());
                            
                        

                            
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
                            <td><%=tarefas.get(i).getTitulo() %></td>
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


<aside class="control-sidebar control-sidebar-dark">

</aside>

<div class="control-sidebar-bg">

</div>

