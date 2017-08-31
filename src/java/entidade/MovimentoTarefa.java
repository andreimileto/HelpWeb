package entidade;
// Generated 24/08/2017 21:27:39 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * MovimentoTarefa generated by hbm2java
 */
public class MovimentoTarefa  implements java.io.Serializable {


     private int id;
     private Tarefa tarefa;
     private String descricao;
     private Date datahoraMovimento;
     private char situacao;
     private String anexo;

    public MovimentoTarefa() {
    }

	
    public MovimentoTarefa(int id, Tarefa tarefa, String descricao, Date datahoraMovimento, char situacao) {
        this.id = id;
        this.tarefa = tarefa;
        this.descricao = descricao;
        this.datahoraMovimento = datahoraMovimento;
        this.situacao = situacao;
    }
    public MovimentoTarefa(int id, Tarefa tarefa, String descricao, Date datahoraMovimento, char situacao, String anexo) {
       this.id = id;
       this.tarefa = tarefa;
       this.descricao = descricao;
       this.datahoraMovimento = datahoraMovimento;
       this.situacao = situacao;
       this.anexo = anexo;
    }
   
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    public Tarefa getTarefa() {
        return this.tarefa;
    }
    
    public void setTarefa(Tarefa tarefa) {
        this.tarefa = tarefa;
    }
    public String getDescricao() {
        return this.descricao;
    }
    
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    public Date getDatahoraMovimento() {
        return this.datahoraMovimento;
    }
    
    public void setDatahoraMovimento(Date datahoraMovimento) {
        this.datahoraMovimento = datahoraMovimento;
    }
    public char getSituacao() {
        return this.situacao;
    }
    
    public void setSituacao(char situacao) {
        this.situacao = situacao;
    }
    public String getAnexo() {
        return this.anexo;
    }
    
    public void setAnexo(String anexo) {
        this.anexo = anexo;
    }




}


