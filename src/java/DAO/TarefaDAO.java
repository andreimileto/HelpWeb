/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import apoio.HibernateUtil;
import entidade.Tarefa;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import apoio.ConexaoBD;
import apoio.Formatacao;
import static com.sun.faces.facelets.util.Path.context;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import static sun.security.krb5.Confounder.bytes;

/**
 *
 * @author Mileto
 */
public class TarefaDAO extends DAO {

    Tarefa tarefa;

    public ArrayList<Tarefa> listar(Tarefa tarefa) {
        this.tarefa = tarefa;
        List resultado = null;

        ArrayList<Tarefa> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";

            sql = "from Tarefa  "
                    + "where "
                    + "situacao ='A'";

            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Tarefa tar = ((Tarefa) ((Object) o));
                lista.add(tar);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return lista;
    }

    public ArrayList<Tarefa> listarComParametro(Tarefa tarefa) {
        this.tarefa = tarefa;
        List resultado = null;

        ArrayList<Tarefa> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";

            //          if (tarefa.getId() == 0) {
            sql = "from Tarefa "
                    + "where 1=1 ";

            if (tarefa.getId() > 0) {
                sql = sql + " and id = " + tarefa.getId() + " ";
            }

            if (tarefa.getCliente().getId() > 0) {
                sql = sql + " and id_cliente = " + tarefa.getCliente().getId() + " ";
            }
            if (tarefa.getFase().getId() > 0) {
                sql = sql + " and id_fase = " + tarefa.getFase().getId() + " ";
            }

            if (tarefa.getModulo().getId() > 0) {
                sql = sql + " and id_modulo = " + tarefa.getModulo().getId() + " ";
            }
            if (tarefa.getMotivo().getId() > 0) {
                sql = sql + " and id_motivo = " + tarefa.getMotivo().getId() + " ";
            }

            if (tarefa.getPrioridade().getId() > 0) {
                sql = sql + " and id_prioridade = " + tarefa.getPrioridade().getId() + " ";
            }
            if (tarefa.getProjeto().getId() > 0) {
                sql = sql + " and id_projeto = " + tarefa.getProjeto().getId() + " ";
            }
            if (tarefa.getUsuarioByIdUsuarioAutor().getId() > 0) {
                sql = sql + " and id_usuario_autor = " + tarefa.getUsuarioByIdUsuarioAutor().getId() + " ";
            }
            if (tarefa.getUsuarioByIdUsuarioResponsavel().getId() > 0) {
                sql = sql + " and id_usuario_responsavel = " + tarefa.getUsuarioByIdUsuarioResponsavel().getId() + " ";
            }

            if (tarefa.getVersaoByIdVersaoBug().getId() > 0) {
                sql = sql + " and id_versao_bug = " + tarefa.getVersaoByIdVersaoBug().getId() + " ";
            }
            if (tarefa.getVersaoByIdVersaoCorrecao().getId() > 0) {
                sql = sql + " and id_versao_correcao = " + tarefa.getVersaoByIdVersaoCorrecao().getId() + " ";
            }
            sql = sql
                    + " and situacao = 'A' "
                    + "order by id";

            String sel = sql;

            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Tarefa tar = ((Tarefa) ((Object) o));
                lista.add(tar);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }

        return lista;
    }

    public ArrayList<Tarefa> consultarId(int id) {
        //this.projeto = projeto;
        List resultado = null;

        ArrayList<Tarefa> listas = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";

            sql = "from Tarefa  "
                    + "where "
                    + " id =" + id;

            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Tarefa tarefa = ((Tarefa) ((Object) o));
                listas.add(tarefa);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return listas;

    }

    public byte[] gerarRelatorio() {
        try {

            Connection conn = new ConexaoBD().getInstance().getConnection();

            JasperReport relatorio = JasperCompileManager.compileReport(getClass().getResourceAsStream("/relatorios/listagemdetarefassimplificada.jrxml"));

            Map parameters = new HashMap();

            byte[] bytes = JasperRunManager.runReportToPdf(relatorio, parameters, conn);

            return bytes;
        } catch (Exception e) {
            System.out.println("erro ao gerar relatorio: " + e);
        }
        return null;
    }

    public byte[] gerarRelatorioResumoPorPeriodo(String dataInicio, String dataFim) {
        try {

            Connection conn = new ConexaoBD().getInstance().getConnection();

            JasperReport relatorio = JasperCompileManager.compileReport(getClass().getResourceAsStream("/relatorios/resumodetarefaspordatadeinclusao.jrxml"));

            //System.out.println("dataaaaaaaaaaa " + Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
            Map parameters = new HashMap();
            parameters.put("datainclusaoinicio", Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
//            System.out.println("data =" + dataIni);
            //    System.out.println("dataaaaaaaaaaa " + Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
            parameters.put("datahorainclusaofinal", Formatacao.formatacaoData2(dataFim.replace("-", "/")));

            byte[] bytes = JasperRunManager.runReportToPdf(relatorio, parameters, conn);

            return bytes;
        } catch (Exception e) {
            System.out.println("erro ao gerar relatorio: " + e);
        }
        return null;
    }

    public byte[] gerarRelatorioResumoPorPeriodoEProjeto(String dataInicio, String dataFim, int idProjeto) {
        try {

            Connection conn = new ConexaoBD().getInstance().getConnection();

            JasperReport relatorio = JasperCompileManager.compileReport(getClass().getResourceAsStream("/relatorios/resumodetarefaspordatadeinclusaoEProjetos.jrxml"));

            //System.out.println("dataaaaaaaaaaa " + Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
            Map parameters = new HashMap();
            parameters.put("datainclusaoinicio", Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
//            System.out.println("data =" + dataIni);
            //    System.out.println("dataaaaaaaaaaa " + Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
            parameters.put("datahorainclusaofinal", Formatacao.formatacaoData2(dataFim.replace("-", "/")));
            parameters.put("idprojeto", idProjeto);

            byte[] bytes = JasperRunManager.runReportToPdf(relatorio, parameters, conn);

            return bytes;
        } catch (Exception e) {
            System.out.println("erro ao gerar relatorio: " + e);
        }
        return null;
    }

    public byte[] gerarRelatorioResumoPorPeriodoEResponsavel(String dataInicio, String dataFim) {
        try {

            Connection conn = new ConexaoBD().getInstance().getConnection();

            JasperReport relatorio = JasperCompileManager.compileReport(getClass().getResourceAsStream("/relatorios/resumodetarefaspordatadeinclusaoFaseResponsavel.jrxml"));

            //System.out.println("dataaaaaaaaaaa " + Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
            Map parameters = new HashMap();
            parameters.put("datainclusaoinicio", Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
//            System.out.println("data =" + dataIni);
            //    System.out.println("dataaaaaaaaaaa " + Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
            parameters.put("datahorainclusaofinal", Formatacao.formatacaoData2(dataFim.replace("-", "/")));

            byte[] bytes = JasperRunManager.runReportToPdf(relatorio, parameters, conn);

            return bytes;
        } catch (Exception e) {
            System.out.println("erro ao gerar relatorio: " + e);
        }
        return null;
    }

    public ArrayList<Tarefa> gerarExcelResumoPorPeriodo(String dataInicio, String dataFim) {
//        try {
//
        Connection conn = new ConexaoBD().getInstance().getConnection();
        TarefaDAO tarefaDAO = new TarefaDAO();
        this.tarefa = tarefa;
        List resultado = null;

        ArrayList<Tarefa> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";

            sql
                    = " from Tarefa "
                    + "where datahora_criacao >='" + dataInicio + "' "
                    + "and datahora_criacao <= '" + dataFim + "' order by id";

            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Tarefa tar = ((Tarefa) ((Object) o));
                lista.add(tar);
            }
            //System.out.println(lista.toString());

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return lista;

    }

    public ArrayList<Tarefa> gerarExcelResumoPorPeriodoEProjeto(String dataInicio, String dataFim, int idProjeto) {
//        try {
//
        Connection conn = new ConexaoBD().getInstance().getConnection();
        TarefaDAO tarefaDAO = new TarefaDAO();
        this.tarefa = tarefa;
        List resultado = null;

        ArrayList<Tarefa> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";

            sql
                    = " from Tarefa "
                    + "where datahora_criacao >='" + dataInicio + "' "
                    + "and datahora_criacao <= '" + dataFim + "' "
                    + " and id_projeto =" + idProjeto + " order by id";

            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Tarefa tar = ((Tarefa) ((Object) o));
                lista.add(tar);
            }
            //System.out.println(lista.toString());

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return lista;

    }

}
