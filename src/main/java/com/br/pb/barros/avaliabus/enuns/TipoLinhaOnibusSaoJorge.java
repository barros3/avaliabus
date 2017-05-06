package com.br.pb.barros.avaliabus.enuns;

import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public enum TipoLinhaOnibusSaoJorge {
	
	// São Jorge
	
	BAIRRO_DAS_INDSTRIAS(1, "104", "Bairro das Indústrias - 104"),
	JARDIM_PLANALTO(2, "110", "Jardim Planalto - 110"),
	DISTRITO(3, "115", "Distrito - 115"),
	MUSSUMAGRO_PARATIBE(4, "118", "Mussumagro/ Paratibe - 118"),
	MUSSUMAGRO_PARQUE_DO_SOL(5, "120", "Mussumagro /Parque do Sol - 120"),
	ALTO_DO_MATEUS_ACESSO_OESTE(6, "701", "Alto do Mateus- Acesso Oeste - 701"),
	BAIRRO_DAS_INDUSTRIAS_MANDACARU_SJ(7, "1001", "Bairro das Indústrias – Mandacaru - 1001"),
	GEISEL_ALTO_DO_MATEUS(8, "1502", "Geisel / Alto do Mateus - 1502"),
	VALENTINA_CRUZ_DAS_ARMAS(9, "1519", "Valentina/Cruz das Armas - 1519"),
	CIRCULAR_DOIS_TRES_00(10, "2300", "Circular - 2300"),
	VALENTINA_EPITACIO(11, "5120", "Valentina/Epitácio - 5120"),
	VALENTINA_PRAIA_DO_SOL(12, "I004", "Valentina/Praia do Sol - I004"),
	VALENTINA_MANGABEIRA(68, "I008", "Valentina / Mangabeira - I008"),
	BOA_ESPERANCA_COLINAS_DO_SUL_II(13, "I009", "Boa Esperança / Colinas do Sul II - I009"),
	CIDADE_VERDE_SEGUNDA_ETAPA(14, "I012", "Cidade Verde / Segunda Etapa - I012");
	
	private final Integer chave;
	private final String linha;
	private final String bairro;
	
	public static final Map<Integer, String> ENUM_MAP;

	private TipoLinhaOnibusSaoJorge(Integer chave, String linha, String bairro) {
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
		for (TipoLinhaOnibusSaoJorge instance : TipoLinhaOnibusSaoJorge.values()) {
			map.put(instance.getChave(), instance.getBairro());
		}
		ENUM_MAP = Collections.unmodifiableMap(map);
	}

	public static String get(String name) {
		return ENUM_MAP.get(name);
	}
	
}