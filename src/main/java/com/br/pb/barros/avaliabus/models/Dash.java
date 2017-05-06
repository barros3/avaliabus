package com.br.pb.barros.avaliabus.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 
 * @author Luciano Barros
 *
 */

@Entity
@Table(name="tb_dash")
public class Dash {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; 
	
	@Column(name = "nome_admin")
	private String nomeAdmin;
	
	@Column(name = "fone_admin")
	private String foneAdmin;
	
	@Column(name = "foto_admin")
	private String fotoAdmin;

	@Column(name = "email_orgao_fiscal") //semob
	private String emailOrgaoFiscal;
	
	@Column(name = "respon_orgao_fiscal")
	private String responsavelOrgaoFiscal; // responsavel da semob

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNomeAdmin() {
		return nomeAdmin;
	}

	public void setNomeAdmin(String nomeAdmin) {
		this.nomeAdmin = nomeAdmin;
	}

	public String getFoneAdmin() {
		return foneAdmin;
	}

	public void setFoneAdmin(String foneAdmin) {
		this.foneAdmin = foneAdmin;
	}

	public String getFotoAdmin() {
		return fotoAdmin;
	}

	public void setFotoAdmin(String fotoAdmin) {
		this.fotoAdmin = fotoAdmin;
	}

	public String getEmailOrgaoFiscal() {
		return emailOrgaoFiscal;
	}

	public void setEmailOrgaoFiscal(String emailOrgaoFiscal) {
		this.emailOrgaoFiscal = emailOrgaoFiscal;
	}

	public String getResponsavelOrgaoFiscal() {
		return responsavelOrgaoFiscal;
	}

	public void setResponsavelOrgaoFiscal(String responsavelOrgaoFiscal) {
		this.responsavelOrgaoFiscal = responsavelOrgaoFiscal;
	}
	
}
