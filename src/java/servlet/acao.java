/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.CidadeDAO;
import DAO.ProjetoDAO;
import DAO.UsuarioDAO;
import entidade.Cidade;
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
                encaminharPagina("sucesso.jsp", request, response);
            } else {
                encaminharPagina("erro.jsp", request, response);
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
                redirecionarPagina("cadastroCidade.jsp?m="+idRetorno, request, response);
            }
            
        }else{
        
        
        
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
                redirecionarPagina("cadastroProjeto.jsp?m="+idRetorno, request, response);
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
