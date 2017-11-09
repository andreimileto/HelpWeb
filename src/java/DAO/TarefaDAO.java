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
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;

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

    public byte[] gerarRelatorioResumoPorPeriodo(Date dataInicio, Date dataFim) {
        try {

            Connection conn = new ConexaoBD().getInstance().getConnection();

            JasperReport relatorio = JasperCompileManager.compileReport(getClass().getResourceAsStream("/relatorios/resumodetarefaspordatadeinclusao.jrxml"));

            //SimpleDateFormat formato = new SimpleDateFormat("yyyy/mm/dd");
            Date dataIni = new Date(Formatacao.ajustaDataDMAJCalendar(dataInicio));
            Date dataFi = new Date(Formatacao.ajustaDataDMAJCalendar(dataFim));

            Map parameters = new HashMap();
            parameters.put("datainclusaoinicio", dataIni);
            System.out.println("data =" + dataIni);
            parameters.put("datahorainclusaofinal", dataFi);

            byte[] bytes = JasperRunManager.runReportToPdf(relatorio, parameters, conn);

            return bytes;
        } catch (Exception e) {
            System.out.println("erro ao gerar relatorio: " + e);
        }
        return null;
    }

}
