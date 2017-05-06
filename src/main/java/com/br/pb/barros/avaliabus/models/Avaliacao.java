package com.br.pb.barros.avaliabus.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.br.pb.barros.avaliabus.enuns.TipoClassificacao;
import com.br.pb.barros.avaliabus.util.Analise;


/**
 * 
 * @author Luciano Barros
 *
 */

@Entity
@Table(name="tb_avaliacao")
public class Avaliacao implements Analise {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "frequencia", nullable = true)
	private Integer frequencia;
	
	@Column(name = "limpeza", nullable = true)
	private Integer limpeza; 
	
	@Column(name = "pontualidade", nullable = true)
	private Integer pontualidade; 
	
	@Column(name = "condu_motorista", nullable = true)
	private Integer conducaoMotorista;
	
	@Column(name = "conserv_transporte", nullable = true)
	private Integer conservacaoTransporte;
	
	@Column(name = "lotacao", nullable = true)
	private Integer lotacao;
	
	@Column(name = "observacao", nullable = true, length = 255)
	private String observacao;
	
	@Transient
	@Enumerated(EnumType.STRING)
	private TipoClassificacao tipoClassificacao;
	
	@ManyToOne
	@JoinColumn(name = "empresa_idEmpresa")
	private Empresa empresa;
	
	@Column(name = "linha")
	private String linha;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "data_avaliacao", nullable = true)
	private Date dataAvaliacao;
	
	@Temporal(TemporalType.TIME)
	@Column(name = "hora_avaliacao", nullable = true)
	private Date horaAvaliacao;
	
	public Avaliacao() {
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getFrequencia() {
		return frequencia;
	}
	public void setFrequencia(Integer frequencia) {
		this.frequencia = frequencia;
	}
	public Integer getLimpeza() {
		return limpeza;
	}
	public void setLimpeza(Integer limpeza) {
		this.limpeza = limpeza;
	}
	public Integer getPontualidade() {
		return pontualidade;
	}
	public void setPontualidade(Integer pontualidade) {
		this.pontualidade = pontualidade;
	}
	public Integer getConducaoMotorista() {
		return conducaoMotorista;
	}
	public void setConducaoMotorista(Integer conducaoMotorista) {
		this.conducaoMotorista = conducaoMotorista;
	}
	public Integer getConservacaoTransporte() {
		return conservacaoTransporte;
	}
	public void setConservacaoTransporte(Integer conservacaoTransporte) {
		this.conservacaoTransporte = conservacaoTransporte;
	}
	public Integer getLotacao() {
		return lotacao;
	}
	public void setLotacao(Integer lotacao) {
		this.lotacao = lotacao;
	}
	public Empresa getEmpresa() {
		return empresa;
	}
	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}
	public String getLinha() {
		return linha;
	}
	public void setLinha(String linha) {
		this.linha = linha;
	}
	public TipoClassificacao getTipoClassificacao() {
		return tipoClassificacao;
	}
	public void setTipoClassificacao(TipoClassificacao tipoClassificacao) {
		this.tipoClassificacao = tipoClassificacao;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public Date getDataAvaliacao() {
		return dataAvaliacao;
	}
	public void setDataAvaliacao(Date dataAvaliacao) {
		this.dataAvaliacao = dataAvaliacao;
	}
	public Date getHoraAvaliacao() {
		return horaAvaliacao;
	}
	public void setHoraAvaliacao(Date horaAvaliacao) {
		this.horaAvaliacao = horaAvaliacao;
	}
	
	@Override
	public void dadosGerais(Empresa empresa, String linhaOnibus, Date dataHoraAvaliacao) {
		this.empresa = empresa;
		this.linha = linhaOnibus;
	}
	
}