package com.br.pb.barros.avaliabus.enuns;

public enum TipoClassificacao {

	PESSIMO(1, "Péssimo"), RUIM(2, "Ruim"), REGULAR(3, "Regular"), BOM(4, "Bom"), EXCELENTE(5, "Excelente");
	
	private final Integer chave;
	private final String valor;

	private TipoClassificacao(Integer chave, String valor) {
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