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
     
     
     
}
