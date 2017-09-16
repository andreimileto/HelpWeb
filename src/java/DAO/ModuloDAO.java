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
        
        ArrayList<Modulo> listaModulo = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
          
            String hql;
            if (modulo.getDescricao().equals("") || modulo.getDescricao() == null) {
//                sql = session.createSQLQuery(" select m.id idmodulo, m.id_projeto, m.descricao descricaomodulo, m.situacao,p.id idprojeto, p.descricao descricaoprojeto,p.situacao projeto from modulo m, projeto p  "
//                        + "where p.id = m.id_projeto and "
//                        + "m.situacao ='A'"
//                        + " order by m.descricao");
//                

                hql = "from Modulo m , Projeto p "
                        + "where p.id = m.id and "
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
//                sql = session.createSQLQuery("select m.id idmodulo, m.id_projeto, m.descricao descricaomodulo, m.situacao,p.id idprojeto, p.descricao descricaoprojeto,p.situacao projeto from modulo m, projeto p  "
//                        + "where p.id = m.id_projeto and "
//                        + "m.descricao  like '%" + modulo.getDescricao().toUpperCase() + "%' "
//                        + "and m.situacao = 'A'"
//                        + " order by m.descricao");

                hql = "from Modulo m , Projeto p "
                        + "where p.id = m.id and "
                        + "m.situacao ='A'"
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

            Query query = session.createQuery(hql);
            List<Object[]> listResult = query.list();

            for (Object[] aRow : listResult) {
                Modulo modu = (Modulo) aRow[0];
                Projeto proj = (Projeto) aRow[1];
                System.out.println(modu.getDescricao() + " - " + proj.getDescricao());
                
                listaModulo.add(modu);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {

//            session.close();
//        }
        return listaModulo;
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
