package com.br.pb.barros.avaliabus.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.br.pb.barros.avaliabus.util.Analise;

@Entity
@Table(name="tb_sugestao")
public class Sugestao implements Analise {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "descricao", nullable = true, length = 255)
	private String descricao;

	@Column(name = "linha", nullable = true)
	private String linha;
	
	@ManyToOne
	@JoinColumn(name = "empresa_idEmpresa")
	private Empresa empresa;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getLinha() {
		return linha;
	}
	public void setLinha(String linha) {
		this.linha = linha;
	}
	public Empresa getEmpresa() {
		return empresa;
	}
	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	@Override
	public void dadosGerais(Empresa e, String linhaOnibus, Date dataAnalise) {
	}
	
}
