package com.br.pb.barros.avaliabus.enuns;

import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public enum TipoLinhaOnibusMandacaruense {

	// Mandacaruense
	
	TREZE_DE_MAIO(1, "503", "Treze de Maio - 503"),
	MANDACARU(2, "504", "Mandacaru - 504"),
	BAIRRO_DOS_IPES(3, "505", "Bairro dos Ipês - 505"),
	BAIRRO_DOS_ESTADOS(4, "506", "Bairro dos Estados - 506"),
	ILHA_DO_BISPO_VIA_EPITACIO(5, "516", "Ilha do Bispo via Epitácio - 516"),
	ILHA_DO_BISPO(6, "602", "Ilha do Bispo - 602"),
	BAIRRO_DOS_IPES_VIA_AYRTON_SENNA(7, "604", "Bairro dos Ipês via Ayrton Senna - 604"),
	BAIRRO_DAS_INDUSTRIAS_MANDACARU_MANDACARUENSE(8, "1001", "Bairro das Indústrias- Mandacaru - 1001");
	
	private final Integer chave;
	private final String linha;
	private final String bairro;
	
	public static final Map<Integer, String> ENUM_MAP;

	private TipoLinhaOnibusMandacaruense(Integer chave, String linha, String bairro) {
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
		for (TipoLinhaOnibusMandacaruense instance : TipoLinhaOnibusMandacaruense.values()) {
			map.put(instance.getChave(), instance.getBairro());
		}
		ENUM_MAP = Collections.unmodifiableMap(map);
	}

	public static String get(String name) {
		return ENUM_MAP.get(name);
	}
	
}