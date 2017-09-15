/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.CidadeDAO;
import DAO.ModuloDAO;
import DAO.MotivoDAO;
import DAO.ProjetoDAO;
import DAO.UsuarioDAO;
import apoio.Formatacao;
import entidade.Cidade;
import entidade.Modulo;
import entidade.Motivo;
import entidade.Projeto;
import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mileto
 */
public class acao extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    int idRetorno;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet acaoCidade  </title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet acao at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);

        String parametro = request.getParameter("parametro");
        System.out.println(parametro);
        
        if (parametro.equals("logout")) {
            System.out.println("LOGOUTTTTTT");
            HttpSession sessao = request.getSession();
            sessao.invalidate();
            response.sendRedirect("index.jsp");
        }

        if (parametro.equals("edCidade")) {
            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));

            ArrayList<Cidade> cidades = new CidadeDAO().consultarId(id);
            Cidade cid = new Cidade();
            cid = cidades.get(0);
            request.setAttribute("objcid", cid);
            // request.setAttribute("cadastroCidade.jsp",cid);

            encaminharPagina("cadastroCidade.jsp", request, response);
        }

        if (parametro.equals("edProjeto")) {
            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));

            ArrayList<Projeto> projetos = new ProjetoDAO().consultarId(id);
            Projeto proj = new Projeto();
            proj = projetos.get(0);
            request.setAttribute("objproj", proj);
            // request.setAttribute("cadastroCidade.jsp",cid);

            encaminharPagina("cadastroProjeto.jsp", request, response);
        }

        if (parametro.equals("edMotivo")) {
            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));

            ArrayList<Motivo> motivos = new MotivoDAO().consultarId(id);
            Motivo motiv = new Motivo();
            motiv = motivos.get(0);
            request.setAttribute("objmot", motiv);
            // request.setAttribute("cadastroCidade.jsp",cid);

            encaminharPagina("cadastroMotivo.jsp", request, response);
        }

        if (parametro.equals("edModulo")) {
            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));

            ArrayList<Modulo> modulos = new ModuloDAO().consultarId(id);
            Modulo modulo = new Modulo();
            modulo = modulos.get(0);
            request.setAttribute("objmod", modulo);
            // request.setAttribute("cadastroCidade.jsp",cid);

            encaminharPagina("cadastroModulo.jsp", request, response);
        }

        if (parametro.equals("exCidade")) {

            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));
            Cidade cid = new Cidade();
            cid.setId(id);
            cid.setId(id);

            cid.setSituacao('I');

            boolean retorno;

            retorno = new CidadeDAO().salvar(cid);

            request.setAttribute("paginaOrigem", "cadastroCidade.jsp");

            if (retorno) {
                encaminharPagina("cadastroCidade.jsp?m=10", request, response);
            } else {
                encaminharPagina("cadastroCidade.jsp?m=11", request, response);
            }

        }

        if (parametro.equals("exProjeto")) {

            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));
            Projeto proj = new Projeto();
            proj.setId(id);

            proj.setDescricao("");
            proj.setSituacao('I');

            boolean retorno;

            retorno = new ProjetoDAO().salvar(proj);

            request.setAttribute("paginaOrigem", "cadastroProjeto.jsp");

            if (retorno) {
                redirecionarPagina("cadastroProjeto.jsp?m=10", request, response);
            } else {
                redirecionarPagina("cadastroProjeto.jsp?m=11", request, response);
            }

        }

        if (parametro.equals("exMotivo")) {

            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));
            Motivo motiv = new Motivo();
            motiv.setId(id);

            motiv.setDescricao("");
            motiv.setSituacao('I');

            boolean retorno;

            retorno = new MotivoDAO().salvar(motiv);

            request.setAttribute("paginaOrigem", "cadastroMotivo.jsp");

            if (retorno) {
                redirecionarPagina("cadastroMotivo.jsp?m=10", request, response);
            } else {
                redirecionarPagina("cadastroMotivo.jsp?m=11", request, response);
            }

        } else {
            if (parametro.equals("exModulo")) {

                int id = Integer.parseInt(String.valueOf(request.getParameter("id")));
                Modulo mod = new Modulo();
                mod.setId(id);
                mod.setId(id);

                mod.setSituacao('I');

                boolean retorno;

                retorno = new ModuloDAO().salvar(mod);

                request.setAttribute("paginaOrigem", "cadastroModulo.jsp");

                if (retorno) {
                    encaminharPagina("cadastroModulo.jsp?m=10", request, response);
                } else {
                    encaminharPagina("cadastroModulo.jsp?m=11", request, response);
                }

            }
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String parametro = request.getParameter("parametro");

        /*---------------------------------
        //verifica se o parametro é para cadastrar cidade
        ----------------
         */
        if (parametro.equals("login")) {
            Usuario user = new Usuario();
            user.setLogin(request.getParameter("login"));
            user.setSenha(Formatacao.get_SHA_512_SecurePassword(request.getParameter("senha")));
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            ArrayList<Usuario> usuarios = usuarioDAO.listar(user);
            
            boolean retorno = false;
            try {
                if (usuarios.size()>0) {
                    if ((user.getLogin().equalsIgnoreCase(usuarios.get(0).getLogin()) && user.getSenha().equals(usuarios.get(0).getSenha()))) {
                         retorno = true;
                         
                    }else{
                        retorno = false;
                    }
                }
            } catch (Exception e) {
                retorno = false;
            }
            
            if (retorno) {
                if (user != null) {
            HttpSession sessao = request.getSession();
            sessao.setAttribute("usuarioLogado", user);
            
            
        }
                response.sendRedirect("inicio.jsp");
            }else{
                 redirecionarPagina("index.jsp?m=2", request, response);
            }
            
            
            
        }
        
        
        
        if (parametro.equals("cadCidade")) {
            Cidade cid = new Cidade();
            int id;
            if (request.getParameter("id").equals("")) {
                id = 0;
            } else {
                id = Integer.parseInt(String.valueOf(request.getParameter("id")));
            }
            cid.setId(id);
            cid.setDescricao(request.getParameter("descricao"));
            cid.setSituacao('A');

            boolean retorno = true;

            if (cid.getDescricao().length() < 2) {
                retorno = false;
                idRetorno = 2;
            }

            CidadeDAO cidDAO = new CidadeDAO();
            ArrayList<Cidade> cidades = cidDAO.listar(cid);
            for (int i = 0; i < cidades.size(); i++) {
                if (cidades.get(i).getDescricao().equalsIgnoreCase(cid.getDescricao())) {
                    retorno = false;
                    idRetorno = 3;
                }
            }

            if (retorno) {
                retorno = cidDAO.salvar(cid);
            }

            request.setAttribute("paginaOrigem", "cadastroCidade.jsp");

            if (retorno) {
                redirecionarPagina("cadastroCidade.jsp?m=1", request, response);
            } else {
                redirecionarPagina("cadastroCidade.jsp?m=" + idRetorno, request, response);
            }

        } else {

            /*-------------------
        Verifica se a ação é cadastrr um projeto
        -------------------
             */
            if (parametro.equals("cadProjeto")) {
                Projeto proj = new Projeto();
                int id;
                if (request.getParameter("id").equals("")) {
                    id = 0;
                } else {
                    id = Integer.parseInt(String.valueOf(request.getParameter("id")));
                }
                proj.setId(id);
                proj.setDescricao(request.getParameter("descricao"));
                proj.setSituacao('A');

                boolean retorno = true;

                if (proj.getDescricao().length() < 2) {
                    retorno = false;
                    idRetorno = 2;
                }

                ProjetoDAO projDAO = new ProjetoDAO();
                ArrayList<Projeto> projetos = projDAO.listar(proj);
                for (int i = 0; i < projetos.size(); i++) {
                    if (projetos.get(i).getDescricao().equalsIgnoreCase(proj.getDescricao())) {
                        retorno = false;
                        idRetorno = 3;
                    }
                }

                if (retorno) {
                    retorno = projDAO.salvar(proj);
                }

                request.setAttribute("paginaOrigem", "cadastroProjeto.jsp");

                if (retorno) {
                    redirecionarPagina("cadastroProjeto.jsp?m=1", request, response);
                } else {
                    redirecionarPagina("cadastroProjeto.jsp?m=" + idRetorno, request, response);
                }

            } else {

                if (parametro.equals("cadMotivo")) {
                    Motivo motiv = new Motivo();
                    int id;
                    if (request.getParameter("id").equals("")) {
                        id = 0;
                    } else {
                        id = Integer.parseInt(String.valueOf(request.getParameter("id")));
                    }
                    motiv.setId(id);
                    motiv.setDescricao(request.getParameter("descricao"));
                    motiv.setSituacao('A');

                    boolean retorno = true;

                    if (motiv.getDescricao().length() < 2) {
                        retorno = false;
                        idRetorno = 2;
                    }

                    MotivoDAO motivDAO = new MotivoDAO();
                    ArrayList<Motivo> motivos = motivDAO.listar(motiv);
                    for (int i = 0; i < motivos.size(); i++) {
                        if (motivos.get(i).getDescricao().equalsIgnoreCase(motiv.getDescricao())) {
                            retorno = false;
                            idRetorno = 3;
                        }
                    }

                    if (retorno) {
                        retorno = motivDAO.salvar(motiv);
                    }

                    request.setAttribute("paginaOrigem", "cadastroProjeto.jsp");

                    if (retorno) {
                        redirecionarPagina("cadastroMotivo.jsp?m=1", request, response);
                    } else {
                        redirecionarPagina("cadastroMotivo.jsp?m=" + idRetorno, request, response);
                    }

                } else {
                    if (parametro.equals("cadModulo")) {
                        String id = request.getParameter("projeto");
                        System.out.println(".i.d"+id);
//                        Modulo modulo = new Modulo();
//                        int id;
//                        if (request.getParameter("id").equals("")) {
//                            id = 0;
//                        } else {
//                            id = Integer.parseInt(String.valueOf(request.getParameter("id")));
//                        }
//                        modulo.setId(id);
//                        modulo.setDescricao(request.getParameter("descricao"));
//                        modulo.setSituacao('A');
//
//                        boolean retorno = true;
//
//                        if (modulo.getDescricao().length() < 2) {
//                            retorno = false;
//                            idRetorno = 2;
//                        }
//
//                        ModuloDAO moduloDAO = new ModuloDAO();
//                        ArrayList<Modulo> modulos = moduloDAO.listar(modulo);
//                        for (int i = 0; i < modulos.size(); i++) {
//                            if (modulos.get(i).getDescricao().equalsIgnoreCase(modulo.getDescricao())) {
//                                retorno = false;
//                                idRetorno = 3;
//                            }
//                        }
//
//                        if (retorno) {
//                            retorno = moduloDAO.salvar(modulo);
//                        }
//
//                        request.setAttribute("paginaOrigem", "cadastroModulo.jsp");
//
//                        if (retorno) {
//                            redirecionarPagina("cadastroModulo.jsp?m=1", request, response);
//                        } else {
//                            redirecionarPagina("cadastroModulo.jsp?m=" + idRetorno, request, response);
//                        }

                    }
                    
                    
                    
                }
            }

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void encaminharPagina(String pagina, HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(pagina);
            rd.forward(request, response);

            // response.sendRedirect(pagina);
        } catch (Exception e) {
            System.out.println("Erro ao encaminhar: " + e);
        }
    }

    private void redirecionarPagina(String pagina, HttpServletRequest request, HttpServletResponse response) {
        try {
            // RequestDispatcher rd = request.getRequestDispatcher(pagina);
            // rd.forward(request, response);

            response.sendRedirect(pagina);
        } catch (Exception e) {
            System.out.println("Erro ao encaminhar: " + e);
        }
    }

}
