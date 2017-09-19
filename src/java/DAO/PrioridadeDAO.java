/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import apoio.HibernateUtil;
import entidade.Cidade;
import entidade.Prioridade;

import entidade.Projeto;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author Mileto
 */
public class PrioridadeDAO extends DAO {

    Prioridade prioridade;

    public ArrayList<Prioridade> listar(Prioridade prioridade) {
        this.prioridade = prioridade;
        List resultado = null;

        ArrayList<Prioridade> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
             String sql = "";
            if (prioridade.getDescricao().equals("") || prioridade.getDescricao() == null) {
                sql = "from Prioridade  "
                        + "where "
                        + "situacao ='A'"
                        + " order by descricao";
            } else {
                sql = "from Prioridade  "
                        + "where "
                        + "upper (descricao)  like '%" + prioridade.getDescricao().toUpperCase() + "%' "
                        + "and situacao ='A'"
                        + " order by descricao";
            }
            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Prioridade prior = ((Prioridade) ((Object) o));
                lista.add(prior);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return lista;
    }
    
     public ArrayList<Prioridade> consultarId(int id) {
        //this.projeto = projeto;
        List resultado = null;

        ArrayList<Prioridade> listas = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";

            sql = "from Prioridade  "
                    + "where "
                    + " id =" + id;

            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {    
                Prioridade prior = ((Prioridade) ((Object) o));
                listas.add(prior);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return listas;


    }
    

}
