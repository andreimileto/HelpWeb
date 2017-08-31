/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import apoio.HibernateUtil;
import entidade.Fase;
import entidade.Motivo;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;

/**
 *
 * @author Mileto
 */
public class FaseDAO extends DAO{

    Fase fase;
     public ArrayList<Fase> listar(Fase fase) {
        this.fase = fase;
        List resultado = null;

        ArrayList<Fase> lista = new ArrayList<>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "from Fase  "                    
                    + "where upper(descricao)  like '" + fase.getDescricao().toUpperCase() + "%' "
                    + "and situacao ='A'"
                    + " order by descricao";
            String sel = sql;
            System.out.println(sel);
            org.hibernate.Query q = session.createQuery(sql);

            resultado = q.list();

            for (Object o : resultado) {
                Fase fas = ((Fase) ((Object) o));
                lista.add(fas);
            }

        } catch (HibernateException he) {
            he.printStackTrace();
        }// finally {
//            session.close();
//        }
        return lista;
    }
    
}
