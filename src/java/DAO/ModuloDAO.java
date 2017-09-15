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
import org.hibernate.Session;

/**
 *
 * @author Mileto
 */
public class ModuloDAO extends DAO {

    Modulo modulo;

    public ArrayList<Modulo> listar(Modulo modulo) {
        this.modulo = modulo;
        List resultado = null;

        ArrayList<Modulo> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";
            if (modulo.getDescricao().equals("") || modulo.getDescricao() == null) {
                sql = "from Modulo m  left join  m.projeto  "
                        + "where "
                        + "m.situacao ='A'"
                        + " order by m.descricao";
                
//                
//                sql = "select * from modulo m, projeto p where p.id = m.id  "
//                        + "and" 
//                        + "  m.situacao = 'A'"
//                        + "order by m.descricao";

//                sql = "from Modulo m , Projeto p "
//                        + "where p.id = m.id and "
//                        + "m.situacao ='A'"
//                        + " order by m.descricao";
            } else {
                sql = "from Modulo m  left join  m.Projeto p  "
                        + "where "
                        + "upper (m.descricao)  like '%" + modulo.getDescricao().toUpperCase() + "%' "
                        + "and m.situacao ='A'"
                        + " order by m.descricao";

//                sql = "from Modulo m , Projeto p "
//                        + "where p.id = m.id and "
//                        + "upper (m.descricao)  like '%" + modulo.getDescricao().toUpperCase() + "%' "
//                        + "and m.situacao ='A'"
//                        + " order by m.descricao";
//                sql = "select * from modulo m, projeto p where p.id = m.id  "
//                        + "and descricao like '%" + modulo.getDescricao() + "%'"
//                        + " and m.situacao = 'A'"
//                        + "order by m.descricao";

            }
            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Modulo modul = ((Modulo) ((Object) o));
                lista.add(modul);
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
