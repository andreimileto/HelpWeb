/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.CidadeDAO;
import DAO.UsuarioDAO;
import entidade.Cidade;
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
        
        if (parametro.equals("edCidade")) {
            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));
            
            ArrayList<Cidade> cidades = new CidadeDAO().consultarId(id);
            Cidade cid = new Cidade();
            cid = cidades.get(0);
            request.setAttribute("objcid", cid);
            // request.setAttribute("cadastroCidade.jsp",cid);

            encaminharPagina("cadastroCidade.jsp", request, response);
        }
        
        if (parametro.equals("exCidade")) {
//            int id = Integer.parseInt(String.valueOf(request.getParameter("id")));
//
//            ArrayList<Cidade> cidades = new CidadeDAO().consultarId(id);
//            Cidade cid = new Cidade();
//            cid = cidades.get(0);
//            request.setAttribute("objcid", cid);
//            // request.setAttribute("cadastroCidade.jsp",cid);
//
//            encaminharPagina("cadastroCidade.jsp", request, response);
//            
            
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
//        processRequest(request, response);

//        String parametro = request.getParameter("parametro");
//        if (parametro.equals("cadUsuario")) {

    
        System.out.println("Entrei no POST!");
        
        String parametro = request.getParameter("parametro");
        
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
            }
            
            CidadeDAO cidDAO = new CidadeDAO();
            
            ArrayList<Cidade> cidades = cidDAO.listar(cid);
            for (int i = 0; i < cidades.size(); i++) {
                if (cidades.get(i).getDescricao().equalsIgnoreCase(cid.getDescricao())) {
                    retorno = false;
                }
            }
            
            if (retorno) {
                retorno = cidDAO.salvar(cid);
            }
            
            request.setAttribute("paginaOrigem", "cadastroCidade.jsp");
            
            if (retorno) {
                redirecionarPagina("cadastroCidade.jsp?m=1", request, response);
            } else {
                redirecionarPagina("cadastroCidade.jsp?m=2", request, response);
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
