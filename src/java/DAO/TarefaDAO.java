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

            sql = "select count(t.*),f.descricao descricaofase,p.descricao descricaoprojeto,m.descricao descricaomodulo"
                    + " from tarefa t, fase f, projeto p, MODULO M\n "
                    + "where t.id_fase = f.id\n "
                    + "and t.id_projeto = p.id\n "
                    + "and t.id_modulo = m.id\n "
                    + "and t.datahora_criacao >='" + dataInicio+"' "
                    + "and t.datahora_criacao <= '" + dataFim+"' "
                    + "group by f.id, p.id, m.id\n"
                    + "order by  count(t.*) desc";

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
}
