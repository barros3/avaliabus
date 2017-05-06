package com.br.pb.barros.avaliabus.enuns;

import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public enum TipoLinhaOnibusMarcusDaSilva {

	
	// Marcos da Silva
	
	JAGUARIBE(1, "003", "Jaguaribe - 003"),
	ALTIPLANO(2, "401", "Altiplano - 401"),
	CABO_BRANCO(3, "507", "Cabo Branco"),
	JOAO_AGRIPINO(4, "509", "João Agripino - 509"),
	BAIRRO_SAO_JOSÉ(5, "512", "Bairro São José - 512"),
	PENHA_ALTIPLANO(6, "528", "Penha Altiplano - 528"),
	CABO_BRANCO_B(7, "502", "Cabo Branco - 507"),
	PENHA_CABO_BRANCO(8, "I007", "Penha/Cabo Branco - I007");
	
	private final Integer chave;
	private final String linha;
	private final String bairro;
	
	public static final Map<Integer, String> ENUM_MAP;

	private TipoLinhaOnibusMarcusDaSilva(Integer chave, String linha, String bairro) {
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
		for (TipoLinhaOnibusMarcusDaSilva instance : TipoLinhaOnibusMarcusDaSilva.values()) {
			map.put(instance.getChave(), instance.getBairro());
		}
		ENUM_MAP = Collections.unmodifiableMap(map);
	}

	public static String get(String name) {
		return ENUM_MAP.get(name);
	}
}