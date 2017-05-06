package com.br.pb.barros.avaliabus.enuns;

import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public enum TipoLinhaOnibusReunidas {

	// Reunidas
	
	GROTAO(1, "101", "Grotão"),
	COSTA_E_SILVA(2, "102", "Costa e Silva - 102"),
	GEISEL_VIA_CRUZ_DAS_ARMAS(3, "106", "Geisel via Cruz das Armas - 106"),
	JOSE_AMERICO(4, "107", "Jose Américo - 107"),
	GROTAO_VIA_FUNCIONARIOS(5, "114", "Grotão via Funcionários - 114"),
	TORRE(6, "402", "Torre - 402"),
	TAMBAU_BESSA(7, "513", "Tambaú/Bessa - 513"),
	BESSA_CINCO_DOIS_UM(8, "521", "Bessa - 521"),
	BESSA_SEIS_0_TRES(9, "603", "Bessa - 603"),
	MANGABEIRA_VIA_EPITACIO_REUNIDAS(10, "2515", "Mangabeira - 2515"),
	CIDADE_VERDE_REUNIDAS(11, "302", "Cidade Verde - 302"),
	MANGABEIRA_VIA_CRISTO_REUNIDAS(12,"5210", "Mangabeira - 5210"),
	CIDADE_VERDE(13, "5307", "Cidade Verde - 5307"),
	MANGABEIRA_SHOPPING_O(14, "5600", "Mangabeira – Shopping - 5600"),
	MANGABEIRA_VII_III(15,"5603", "Mangabeira VII - 5603"),
	MANGABEIRA_VII_V(16, "5605", "Mangabeira Shopping - 5605"),
	GROTAO_JOAO_PAULO_II(17, "A101", "Grotão João Paulo II - A101");
	
	private final Integer chave;
	private final String linha;
	private final String bairro;
	
	public static final Map<Integer, String> ENUM_MAP;

	private TipoLinhaOnibusReunidas(Integer chave, String linha, String bairro) {
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
		for (TipoLinhaOnibusReunidas instance : TipoLinhaOnibusReunidas.values()) {
			map.put(instance.getChave(), instance.getBairro());
		}
		ENUM_MAP = Collections.unmodifiableMap(map);
	}

	public static String get(String name) {
		return ENUM_MAP.get(name);
	}
	
}