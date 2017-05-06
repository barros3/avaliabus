package com.br.pb.barros.avaliabus.models;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.br.pb.barros.avaliabus.util.Analise;

@Entity
@Table(name="tb_denuncia")
public class Denuncia implements Analise {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "descricao", nullable = true, length = 255)
	private String descricao;
	
	@Transient
	private MultipartFile imagemTransiente;	
	
	@Lob
	@Column(name = "imagem")
	private Blob imagem;
	
	@Column(name = "linha")
	private String linha;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "data_denuncia", nullable = true)
	private Date dataDenuncia;
	
	@Temporal(TemporalType.TIME)
	@Column(name = "hora_denuncia", nullable = true)
	private Date horaDenuncia;
	
	@ManyToOne
	@JoinColumn(name = "empresa_idEmpresa", referencedColumnName = "id")
	private Empresa empresa;
	
	public Denuncia() {
	}
	
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

	public Blob getImagem() {
		return imagem;
	}
	
	public void setImagem(Blob imagem) {
		this.imagem = imagem;
	}
	
	public MultipartFile getImagemTransiente() {
		return imagemTransiente;
	}
	
	public void setImagemTransiente(MultipartFile imagemTransiente) {
		this.imagemTransiente = imagemTransiente;
	}

	public String getLinha() {
		return linha;
	}

	public void setLinha(String linha) {
		this.linha = linha;
	}

	public Date getDataDenuncia() {
		return dataDenuncia;
	}
	
	public void setDataDenuncia(Date dataDenuncia) {
		this.dataDenuncia = dataDenuncia;
	}
	
	public Date getHoraDenuncia() {
		return horaDenuncia;
	}
	
	public void setHoraDenuncia(Date horaDenuncia) {
		this.horaDenuncia = horaDenuncia;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	@Override
	public void dadosGerais(Empresa e, String linhaOnibus, Date dataAnalise) {
		// TODO Auto-generated method stub
		
	}
	
	
}
