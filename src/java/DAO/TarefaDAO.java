/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import apoio.HibernateUtil;
import entidade.Cliente;
import entidade.Tarefa;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author Mileto
 */
public class TarefaDAO extends DAO{
    Tarefa tarefa;
//     public ArrayList<Cliente> listar(Tarefa tarefa) {
//        this.tarefa = tarefa;
//        List resultado = null;
//
//        ArrayList<Tarefa> lista = new ArrayList<>();
//        try {
//            Session session = HibernateUtil.getSessionFactory().openSession();
//            session.beginTransaction();
//            String sql = "";
//            if (tarefa.getRazaoSocial().equals("") || tarefa.getRazaoSocial() == null) {
//                sql = "from Cliente  "
//                        + "where "
//                        + "situacao ='A'"
//                        + " order by razao_social";
//            } else {
//                sql = "from Cliente  "
//                        + "where "
//                        + "cpf_cnpj = '" + tarefa.getCpfCnpj()+"' "
//                        + "and situacao ='A'"
//                        + " order by razao_social";
//            }
//            String sel = sql;
//            System.out.println(sel);
//            org.hibernate.Query q = session.createQuery(sql);
//
//            resultado = q.list();
//
//            for (Object o : resultado) {
//                Cliente cli = ((Cliente) ((Object) o));
//                lista.add(cli);
//            }
//
//        } catch (HibernateException he) {
//            he.printStackTrace();
//        }// finally {
////            session.close();
////        }
//        return lista;
//    }
    
     
//        public ArrayList<Cliente> consultarId(int id) {
//        //this.projeto = projeto;
//        List resultado = null;
//
//        ArrayList<Cliente> listas = new ArrayList<>();
//        try {
//            Session session = HibernateUtil.getSessionFactory().openSession();
//            session.beginTransaction();
//            String sql = "";
//
//            sql = "from Cliente  "
//                    + "where "
//                    + " id =" + id;
//
//            String sel = sql;
//            System.out.println(sel);
//            org.hibernate.Query q = session.createQuery(sql);
//
//            resultado = q.list();
//
//            for (Object o : resultado) {
//                Cliente cliente = ((Cliente) ((Object) o));
//                listas.add(cliente);
//            }
//
//        } catch (HibernateException he) {
//            he.printStackTrace();
//        }// finally {
////            session.close();
////        }
//        return listas;
//
//    }
     
     
     
}
