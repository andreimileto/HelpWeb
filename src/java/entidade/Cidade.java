package entidade;
// Generated 18/09/2017 19:03:04 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Cidade generated by hbm2java
 */
@Entity
@Table(name="cidade"
    ,schema="public"
)
public class Cidade  implements java.io.Serializable {


     private int id;
     private String descricao;
     private char situacao;
     private Set clientes = new HashSet(0);

    public Cidade() {
    }

	
    public Cidade(int id, char situacao) {
        this.id = id;
        this.situacao = situacao;
    }
    public Cidade(int id, String descricao, char situacao, Set clientes) {
       this.id = id;
       this.descricao = descricao;
       this.situacao = situacao;
       this.clientes = clientes;
    }
   
     @Id 

    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    
    @Column(name="descricao", length=150)
    public String getDescricao() {
        return this.descricao;
    }
    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    
    @Column(name="situacao", nullable=false, length=1)
    public char getSituacao() {
        return this.situacao;
    }
    
    public void setSituacao(char situacao) {
        this.situacao = situacao;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="cidade")
    public Set getClientes() {
        return this.clientes;
    }
    
    public void setClientes(Set clientes) {
        this.clientes = clientes;
    }




}


