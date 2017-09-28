/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import DAO.ClienteDAO;
import apoio.Validacao;
import entidade.Cliente;
import java.util.ArrayList;

/**
 *
 * @author Mileto
 */
public class ControleCliente {

    Cliente cliente;
    ClienteDAO clienteDAO = new ClienteDAO();

    public int salvar(Cliente cliente) {
        this.cliente = cliente;

        
        if (cliente.getSituacao()=='A') {
            
        
        if (cliente.getRazaoSocial().length() < 3 || cliente.getRazaoSocial().length() > 150) {
            return 2;
        }
        if (cliente.getTipoCadastro()=='0') {
            return 3;
        }
        if (!Validacao.validarCPFCNPJ(cliente.getCpfCnpj())) {
            return 4;
        }
        
         ArrayList<Cliente> clientes = new ArrayList<>();

            clientes = listar(cliente);

            //verifica se existe algum cadastro com o mesmo nome que seja um ID diferente do que está alterando.
            for (int i = 0; i < clientes.size(); i++) {
                if (this.cliente.getCpfCnpj().equalsIgnoreCase(clientes.get(i).getCpfCnpj()) && cliente.getId() != clientes.get(i).getId()) {
                    return 5;
                }
            }
            
        }
        if (clienteDAO.salvar(cliente)) {
            return 1;
        } else {
            return 6;
        }

    }
    
    
      public ArrayList<Cliente> listar(Cliente cliente) {
        this.cliente = cliente;
        
        return clienteDAO.listar(this.cliente);
    }

    public ArrayList<Cliente> consultarId(int id) {

        
        return clienteDAO.consultarId(id);

    }
    
    
    
}
