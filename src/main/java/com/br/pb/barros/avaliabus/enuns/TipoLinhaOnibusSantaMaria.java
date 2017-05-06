package com.br.pb.barros.avaliabus.enuns;

import java.io.Serializable;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public enum TipoLinhaOnibusSantaMaria implements Serializable {

	// Santa Maria

	ROGER(1, "002", "Roger - 002"), GRMAME(2, "103", "Gramame - 103"), CID_FUNCIONARIOS(3, "105",
			"Cidade dos Funcionários - 105"), RUA_DO_RIO(4, "109", "Rua do Rio - 109"), GRAMAME(5, "113",
					"Gramame- 113"), COLINAS_DO_SUL(6, "116", "Colinas do Sul - 116"), COLINAS_DO_SUL_CEHAP(7, "501",
							"Colinas do Sul - CEHAP - 501"), CIRCULAR_VIA_EPITACIO(8, "5110",
									"Circular - 5110"), CIRCULAR_VIA_COLINAS(9, "1510",
											"Circular - 1510"), A_ROGER(10, "A002", "Alto Roger - A002");

	private final Integer chave;
	private final String linha;
	private final String bairro;

	public static final Map<Integer, String> ENUM_MAP;

	private TipoLinhaOnibusSantaMaria(Integer chave, String linha, String bairro) {
		this.chave = chave;
		this.linha = linha;
		this.bairro = bairro;
	}

	public Integer getChave() {
		return chave;
	}

	public String getLinha() {
		return linha;
	}

	public String getBairro() {
		return bairro;
	}

	static {
		
		Map<Integer, String> map = new ConcurrentHashMap<Integer, String>();
		for (TipoLinhaOnibusSantaMaria instance : TipoLinhaOnibusSantaMaria.values()) {
			map.put(instance.getChave(), instance.getBairro());
		}
		ENUM_MAP = Collections.unmodifiableMap(map);
	}

	public static String get(String name) {
		return ENUM_MAP.get(name);
	}

}