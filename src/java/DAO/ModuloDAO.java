/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import apoio.HibernateUtil;
import entidade.Cidade;
import entidade.Modulo;
import entidade.Projeto;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author Mileto
 */
public class ModuloDAO extends DAO {

    Modulo modulo;
    List<Object[]> listResult;

    public ArrayList<Modulo> listar(Modulo modulo) {
 this.modulo = modulo;
        List resultado = null;

        ArrayList<Modulo> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";
       
                sql = "from Modulo  "
                        + "where "
                        
                        + " situacao ='A'"
                        + " order by descricao";
            
            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Modulo mod = ((Modulo) ((Object) o));
                lista.add(mod);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return lista;
    }

    public ArrayList<Modulo> consultarId(int id) {
        //this.projeto = projeto;
        List resultado = null;

        ArrayList<Modulo> listas = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";

            sql = "from Modulo  "
                    + "where "
                    + " id =" + id;

            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Modulo modulo = ((Modulo) ((Object) o));
                listas.add(modulo);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return listas;

    }

}
