    <%-- 
    Document   : barraLateral.jsp
    Created on : 12/09/2017, 11:48:32
    Author     : pc04
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="entidade.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <%
                    Usuario logad = new Usuario();

                    logad.setId(Integer.parseInt(session.getAttribute("usuarioLogado").toString()));

                    System.out.println(logad.getId() + "....id");
                    logad.setNome("");
                    logad.setLogin("");
                    logad.setSituacao('A');
                    //tar.setUsuarioByIdUsuarioAutor(autor);
                    //System.out.println(" id do autor.... "+tar.getUsuarioByIdUsuarioAutor().getId());

                    UsuarioDAO usDAO = new UsuarioDAO();
                    ArrayList<Usuario> usrs = usDAO.listar(logad);

                %>




                <p><%=usrs.get(0).getNome()%></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header"><h4>Menu principal</h4>
            </li>
            <li class="treeview">
                <a href="">
                    <i class="fa fa-address-card"></i> 
                    <span>Cadastros</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="cadastroCliente.jsp"><i class="fa fa-circle-o"></i> Clientes</a></li>
                    <!-- <li class="active"><a href="cadastroCidade.jsp"><i class="fa fa-circle-o"></i> Cidades</a></li>-->  
                    <li><a href="cadastroCidade.jsp"><i class="fa fa-circle-o"></i> Cidades</a></li>

                </ul>
            </li>

            <li class="treeview">
                <a href="">
                    <i class="fa fa-cogs"> </i>
                    <span>Gerência</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="cadastroVersao.jsp"><i class="fa fa-vimeo"></i> Cadastro de Versão</a></li>
                    <li><a href="cadastroMotivo.jsp"><i class="fa fa-commenting-o"></i> Cadastro de Motivo</a></li>
                    <li><a href="cadastroProjeto.jsp"><i class="fa fa-cogs"></i> Cadastro de Projeto</a></li>
                    <li><a href="cadastroModulo.jsp"><i class="fa fa-cubes"></i> Cadastro de Módulo</a></li>
                    <li><a href="cadastroPrioridade.jsp"><i class="fa fa-cubes"></i> Cadastro de Prioridade</a></li>
                    <li><a href="cadastroFase.jsp"><i class="fa fa-cubes"></i> Cadastro de Fase</a></li>
                    <li><a href="cadastroUsuario.jsp"><i class="fa fa-cubes"></i> Cadastro de Usuário</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="">
                    <i class="fa fa-cogs"> </i>
                    <span>Tarefa</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="cadastroTarefa.jsp"><i class="fa fa-vimeo"></i> Cadastro de Tarefa</a></li>
                    <li><a href="listaTarefas1.jsp"><i class="fa fa-vimeo"></i> Listagem de Tarefas</a></li>

                </ul>
            </li>

            <li class="treeview">
                <a href="">
                    <i class="fa fa-cogs"> </i>
                    <span>Relatórios</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li><a href="relTarefas.jsp"><i class="fa fa-vimeo"></i>Geral de Tarefas</a></li>
                    
                    <li><a href="relTarefasPorResponsavel.jsp"><i class="fa fa-vimeo"></i>Resumo Tarefas<BR>&nbsp&nbsp&nbsp&nbsp por responsável</a></li>
                    <li><a href="relTarefasResumo.jsp"><i class="fa fa-vimeo"></i>Resumo Tarefas<BR>&nbsp&nbsp&nbsp&nbsp por período</a></li>
                    <li><a href="relTarefasPorProjeto.jsp"><i class="fa fa-vimeo"></i>Resumo Tarefas <BR>&nbsp &nbsp &nbspde um Projeto</a></li>
                    <li><a href="ExcelTarefasResumo.jsp"><i class="fa fa-vimeo"></i>Excel Tarefas por período</a></li>
                    <li><a href="ExcelTarefasResumoPorProjeto.jsp"><i class="fa fa-vimeo"></i>Excel Tarefas <BR>&nbsp &nbsp &nbsp por período e de um projeto</a></li>
                    

                </ul>
            </li>

            <!--            <li>
                            <a href="pages/widgets.html">
                                <i class="fa fa-th"></i> <span>Widgets</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-green">new</small>
                                </span>
                            </a>
                        </li>-->

            <!--            <li class="treeview">
                            <a href="#">
                                <i class="fa fa-laptop"></i>
                                <span>UI Elements</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
                                <li><a href="pages/UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
                                <li><a href="pages/UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
                                <li><a href="pages/UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
                                <li><a href="pages/UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
                                <li><a href="pages/UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>
                            </ul>
                        </li>-->
            <!--            <li class="treeview">
                            <a href="#">
                                <i class="fa fa-edit"></i> <span>Forms</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a href="general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>
                                <li><a href="advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
                                <li><a href="editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>
                            </ul>
                        </li>-->
            <!--            <li class="treeview">
                            <a href="#">
                                <i class="fa fa-table"></i> <span>Tables</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                                <li><a href="pages/tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>
                            </ul>
                        </li>-->
            <!--            <li>
                            <a href="pages/calendar.html">
                                <i class="fa fa-calendar"></i> <span>Calendar</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-red">3</small>
                                    <small class="label pull-right bg-blue">17</small>
                                </span>
                            </a>
                        </li>-->
            <!--            <li>
                            <a href="pages/mailbox/mailbox.html">
                                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-yellow">12</small>
                                    <small class="label pull-right bg-green">16</small>
                                    <small class="label pull-right bg-red">5</small>
                                </span>
                            </a>
                        </li>-->
            <!--            <li class="treeview">
                            <a href="#">
                                <i class="fa fa-folder"></i> <span>Examples</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>
                                <li><a href="pages/examples/profile.html"><i class="fa fa-circle-o"></i> Profile</a></li>
                                <li><a href="pages/examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>
                                <li><a href="pages/examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>
                                <li><a href="pages/examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
                                <li><a href="pages/examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>
                                <li><a href="pages/examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>
                                <li><a href="pages/examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>
                                <li><a href="pages/examples/pace.html"><i class="fa fa-circle-o"></i> Pace Page</a></li>
                            </ul>
                        </li>-->
            <!--            <li class="treeview">
                            <a href="#">
                                <i class="fa fa-share"></i> <span>Multilevel</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                                <li class="treeview">
                                    <a href="#"><i class="fa fa-circle-o"></i> Level One
                                        <span class="pull-right-container">
                                            <i class="fa fa-angle-left pull-right"></i>
                                        </span>
                                    </a>
                                    <ul class="treeview-menu">
                                        <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                                        <li class="treeview">
                                            <a href="#"><i class="fa fa-circle-o"></i> Level Two
                                                <span class="pull-right-container">
                                                    <i class="fa fa-angle-left pull-right"></i>
                                                </span>
                                            </a>
                                            <ul class="treeview-menu">
                                                <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                                <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                            </ul>
                        </li>-->
            <!--            <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentation</span></a></li>-->
            <!--            <li class="header">LABELS</li>
                        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
                        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
                        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>-->
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>


