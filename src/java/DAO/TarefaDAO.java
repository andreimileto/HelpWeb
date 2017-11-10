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

    public byte[] gerarExcelResumoPorPeriodo(String dataInicio, String dataFim) {
//        try {
//
        Connection conn = new ConexaoBD().getInstance().getConnection();
//
        try {
            JasperReport relatorio = JasperCompileManager.compileReport(getClass().getResourceAsStream("/relatorios/resumodetarefaspordatadeinclusao.jrxml"));
        } catch (Exception e) {
        }

//
//
//   //System.out.println("dataaaaaaaaaaa " + Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
//            Map parameters = new HashMap();
//            parameters.put("datainclusaoinicio", Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
////            System.out.println("data =" + dataIni);
//        //    System.out.println("dataaaaaaaaaaa " + Formatacao.formatacaoData2(dataInicio.replace("-", "/")));
//            parameters.put("datahorainclusaofinal", Formatacao.formatacaoData2(dataFim.replace("-", "/")));
//
//            byte[] bytes = JasperRunManager.runReportToPdf(relatorio, parameters, conn);
//
//            return bytes;
//        } catch (Exception e) {
//            System.out.println("erro ao gerar relatorio: " + e);
//        }
//        return null;
        FacesContext context = FacesContext.getCurrentInstance();
        HttpServletResponse response = (HttpServletResponse) context.getExternalContext().getResponse();
        byte[] bytes;
        try {
            JRXlsExporter exporter = new JRXlsExporter();
            ByteArrayOutputStream xlsReport = new ByteArrayOutputStream();
            //exporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, impressao);  
            exporter.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, xlsReport);
            exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
            exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.TRUE);
            exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);
            exporter.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, "c:/relatorio.xls");
            exporter.exportReport();
            bytes = xlsReport.toByteArray();
            response.setContentType("application/vnd.ms-excel");
            response.setContentLength(bytes.length);
            xlsReport.close();
            OutputStream ouputStream = response.getOutputStream();
            ouputStream.write(bytes, 0, bytes.length);
            ouputStream.flush();
            ouputStream.close();
            return bytes;
        } catch (Exception e) {
            System.out.println("erro excel" + e);

        }
        return null;
    }

}
