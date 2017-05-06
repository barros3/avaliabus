package com.br.pb.barros.avaliabus.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;

/**
 * 
 * @author Luciano Barros
 *
 */

@Entity
@Table(name = "tb_empresa")
public class Empresa {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "email", nullable = false)
	private String email;
	
	@Column(name = "endereco", nullable = false)
	private String endereco;
	
	@Column(name = "telefone", nullable = false)
	private String telefone;
	
	@Column(name = "responsavel", nullable = false)
	private String nomeResponsavel;
	
	@Enumerated(EnumType.STRING)
	@Column(name = "nome_empresa", nullable = false)
	private TipoNomeEmpresa tipoNomeEmpresa;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = Avaliacao.class, mappedBy = "empresa")
	private List<Avaliacao> avaliacao;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = Denuncia.class, mappedBy = "empresa")
	private List<Denuncia> listDenuncia;
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER, targetEntity = Sugestao.class, mappedBy = "empresa")
	private List<Sugestao> listSusgetao;
	
	@Transient
	private Denuncia denuncia;

	
	public Empresa(){
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getNomeResponsavel() {
		return nomeResponsavel;
	}

	public void setNomeResponsavel(String nomeResponsavel) {
		this.nomeResponsavel = nomeResponsavel;
	}

	public List<Avaliacao> getAvaliacao() {
		return avaliacao;
	}
	
	public void setAvaliacao(List<Avaliacao> avaliacao) {
		this.avaliacao = avaliacao;
	}

	public TipoNomeEmpresa getTipoNomeEmpresa() {
		return tipoNomeEmpresa;
	}

	public void setTipoNomeEmpresa(TipoNomeEmpresa tipoNomeEmpresa) {
		this.tipoNomeEmpresa = tipoNomeEmpresa;
	}

	public Denuncia getDenuncia() {
		return denuncia;
	}
	
	public void setDenuncia(Denuncia denuncia) {
		this.denuncia = denuncia;
	}
	
	public List<Denuncia> getListDenuncia() {
		return listDenuncia;
	}
	
	public void setListDenuncia(List<Denuncia> listDenuncia) {
		this.listDenuncia = listDenuncia;
	}
	
	public List<Sugestao> getListSusgetao() {
		return listSusgetao;
	}
	
	public void setListSusgetao(List<Sugestao> listSusgetao) {
		this.listSusgetao = listSusgetao;
	}
}
