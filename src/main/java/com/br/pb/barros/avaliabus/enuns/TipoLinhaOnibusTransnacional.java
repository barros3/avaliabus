package com.br.pb.barros.avaliabus.enuns;

import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public enum TipoLinhaOnibusTransnacional {

	// Transnacional

	CEASA(1, "201", "Ceasa"), ERNESTO_GEISEL(2, "202", "Ernesto Geise - 202"), MANGABEIRA(3, "203",
			"Mangabeira - 203"), CRISTO(4, "204", "Cristo - 204"), PENHA(5, "207",
					"Penha - 207"), CRISTO_VALE_DAS_PALMEIRAS(6, "208",
							"Cristo-Vale das Palmeiras - 208"), CIDADE_VERDE_VIA_RANGEL(7, "209",
									"Cidade Verde via Rangel - 209"), MANGABEIRA_PEDRO_II_UM(8, "301",
											"Mangabeira/ Pedro II - 301"), CIDADE_VERDE_TRANSNACIONAL(9, "302",
													"Cidade Verde -302"), MANGABEIRA_PEDRO_TRES_TRES(10, "303",
															"Mangabeira/ Pedro II - 303"), CASTELO_BRANCO_PEDRO(11,
																	"304",
																	"Castelo Branco /Pedro II - 304"), TAMBAU_VIA_TAMANDARE(
																			12, "510",
																			"Tambaú via Tamandaré - 510"), TAMBAU_RUI_CARNEIRO(
																					13, "511",
																					"Tambaú Rui Carneiro - 511"), MANGABEIRA_SETE(
																							14, "514",
																							"Mangabeira VII - 514"), CASTELO_BRANCO(
																									15, "517",
																									"Castelo Branco - 517"), BESSA_TRANSNACIONAL(
																											16, "601",
																											"Bessa - 601"), CIRCULAR(
																													17,
																													"1500",
																													"Circular - 1500"), PENHA_RANGEL_PEDRO(
																															18,
																															"2307",
																															"Penha Rangel / Pedro II - 2317"), MANGABEIRA_VIA_EPIACIO_TRANSNACIONAL(
																																	19,
																																	"2514",
																																	"Mangabeira - 2514"), CIRCULAR_VIA_PEDRO_II(
																																			19,
																																			"3200",
																																			"Circular - 3200"), PENHA_PEDRO_II_RANGEL(
																																					20,
																																					"3207",
																																					"Penha Pedro II / Rangel - 3207"), BANCARIOS_VIA_PEDRO_II(
																																							21,
																																							"3510",
																																							"Bancários - 3510"), CIRCULAR_SHOPPING(
																																									22,
																																									"5100",
																																									"Circular - 5100"), CRISTO_SHOPPING(
																																											23,
																																											"5204",
																																											"Cristo Shopping - 5204"), MANGABEIRA_VIA_CRISTO_TRANSNACIONAL(
																																													24,
																																													"5206",
																																													"Mangabeira - 5206"), BANCARIOS_VIA_EPITACIO(
																																															25,
																																															"5310",
																																															"Bancários - 5310"), ANATOLIA(
																																																	26,
																																																	"I006",
																																																	"Anatólia - I006");

	private final Integer chave;
	private final String linha;
	private final String bairro;
	
	public static final Map<Integer, String> ENUM_MAP;

	private TipoLinhaOnibusTransnacional(Integer chave, String linha, String bairro) {
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
		for (TipoLinhaOnibusTransnacional instance : TipoLinhaOnibusTransnacional.values()) {
			map.put(instance.getChave(), instance.getBairro());
		}
		ENUM_MAP = Collections.unmodifiableMap(map);
	}

	public static String get(String name) {
		return ENUM_MAP.get(name);
	}

}