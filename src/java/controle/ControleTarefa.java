/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import DAO.ClienteDAO;
import DAO.TarefaDAO;
import apoio.Validacao;
import entidade.Cliente;
import entidade.Tarefa;
import java.util.ArrayList;

/**
 *
 * @author Mileto
 */
public class ControleTarefa {

    Tarefa tarefa;
    TarefaDAO tarefaDAO = new TarefaDAO();

    public int salvar(Tarefa tarefa) {
        this.tarefa = tarefa;

        if (tarefa.getSituacao() == 'A') {

            if (tarefa.getTitulo().length() < 3 || tarefa.getTitulo().length() > 150) {
                return 2;
            }
            if (tarefa.getDescricao().length() < 3) {
                return 3;
            }
            


        }
        if (tarefaDAO.salvar(tarefa)) {
            return 1;
        } else {
            return 6;
        }

    }

    public ArrayList<Tarefa> listar(Tarefa tarefa) {
        this.tarefa= tarefa;

        return tarefaDAO.listar(this.tarefa);
    }

    public ArrayList<Tarefa> consultarId(int id) {

        return tarefaDAO.consultarId(id);

    }

}
