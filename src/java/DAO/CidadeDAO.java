/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import apoio.ConexaoBD;
import apoio.HibernateUtil;
import entidade.Cidade;
import entidade.Usuario;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Mileto
 */
public class CidadeDAO extends DAO {

    Cidade cidade;

    public ArrayList<Cidade> listar(Cidade cidade) {
        this.cidade = cidade;
        List resultado = null;

        ArrayList<Cidade> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";
            if (cidade.getDescricao().equals("") || cidade.getDescricao() == null) {
                sql = "from Cidade  "
                        + "where "
                        + "situacao ='A'"
                        + " order by descricao";
            } else {
                sql = "from Cidade  "
                        + "where "
                        + "descricao  like '%" + cidade.getDescricao() + "%' "
                        + "and situacao ='A'"
                        + " order by descricao";
            }
            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Cidade cid = ((Cidade) ((Object) o));
                lista.add(cid);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return lista;
    }

    public ArrayList<Cidade> consultarId(int id) {
        this.cidade = cidade;
        List resultado = null;

        ArrayList<Cidade> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "";

            sql = "from Cidade  "
                    + "where "
                    + " id =" + id;

            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Cidade cid = ((Cidade) ((Object) o));
                lista.add(cid);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return lista;

//            ResultSet resultado = ConexaoBD.getInstance().getConnection().createStatement().executeQuery(sql);
//
//            if (resultado.next()) {
//
//                u.setId(resultado.getInt("id"));
//                u.setNome(resultado.getString("nome"));
//                u.setEmail(resultado.getString("e_mail"));
//                u.setSituacao(resultado.getString("situacao").charAt(0));
//            }
//
//        } catch (Exception e) {
//            System.out.println("erro ao consultar usuário: " + e);
//        }
//
//        return u;
//    }
    }

}
