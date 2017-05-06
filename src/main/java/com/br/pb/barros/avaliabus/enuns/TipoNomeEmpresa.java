package com.br.pb.barros.avaliabus.enuns;

public enum TipoNomeEmpresa {

	SANTA_MARIA(1,"Santa Maria"),
	MANDACARUENSE(2, "Mandacaruense"),
	MARCOS_SILVA(3, "Marcos da Silva"),
	TRANSNACIONAL(4, "Transnacional"),
	SAO_JORGE(5, "Sao Jorge"),
	REUNIDAS(6, "Reunidas");
	
	private final Integer chave;
	private final String valor;

	private TipoNomeEmpresa(Integer chave, String valor) {
		this.chave = chave;
		this.valor = valor;
	}

	public Integer getChave() {
		return chave;
	}
	
	public String getValor() {
		return valor;
	}
	
}