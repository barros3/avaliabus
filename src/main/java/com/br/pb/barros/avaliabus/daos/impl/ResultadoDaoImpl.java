package com.br.pb.barros.avaliabus.daos.impl;

import java.sql.SQLDataException;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.daos.ResultadoDao;
import com.fasterxml.jackson.core.JsonProcessingException;

@Repository
public class ResultadoDaoImpl implements ResultadoDao {

	@PersistenceContext private EntityManager manager;

	public Map<String, Integer> denunciaChart() throws SQLDataException, JsonProcessingException {

		Integer quantidadeDenunciaSantaMaria = 0;
		Integer quantidadeDenunciaMandacaruense = 0;
		Integer quantidadeDenunciaReunidas = 0;
		Integer quantidadeDenunciaSaoJorge = 0;
		Integer quantidadeDenunciaTransnacional = 0;
		Integer quantidadeDenunciaMarcosDaSilva = 0;

		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer countId = 1;

		while (countId <= 6) {

			Query result = manager.createQuery("SELECT COUNT(*) FROM Denuncia WHERE empresa.id = :empresa")
					.setParameter("empresa", countId.longValue());
			
			Long count = ((long) result.getResultList().iterator().next());

			if (countId.intValue() == 1) {
				quantidadeDenunciaSantaMaria = quantidadeDenunciaSantaMaria + count.intValue();
			}

			if (countId.intValue() == 2) {
				quantidadeDenunciaMandacaruense = quantidadeDenunciaMandacaruense + count.intValue();
			}

			if (countId.intValue() == 3) {
				quantidadeDenunciaReunidas = quantidadeDenunciaReunidas + count.intValue();
			}

			if (countId.intValue() == 4) {
				quantidadeDenunciaSaoJorge = quantidadeDenunciaSaoJorge + count.intValue();
			}

			if (countId.intValue() == 5) {
				quantidadeDenunciaTransnacional = quantidadeDenunciaTransnacional + count.intValue();
			}

			if (countId.intValue() == 6) {
				quantidadeDenunciaMarcosDaSilva = quantidadeDenunciaMarcosDaSilva + count.intValue();
			}

			hashCountFreq.put("quantidadeDenunciaSantaMaria", quantidadeDenunciaSantaMaria);
			hashCountFreq.put("quantidadeDenunciaMandacaruense", quantidadeDenunciaMandacaruense);
			hashCountFreq.put("quantidadeDenunciaReunidas", quantidadeDenunciaReunidas);
			hashCountFreq.put("quantidadeDenunciaSaoJorge", quantidadeDenunciaSaoJorge);
			hashCountFreq.put("quantidadeDenunciaTransnacional", quantidadeDenunciaTransnacional);
			hashCountFreq.put("quantidadeDenunciaMarcosDaSilva", quantidadeDenunciaMarcosDaSilva);

			countId++;
		}

		return hashCountFreq;
	}
	
	public Map<String, Integer> avaliacaoChart() throws SQLDataException, JsonProcessingException {

		Integer quantidadeAvaliacaoSantaMaria = 0;
		Integer quantidadeAvaliacaoMandacaruense = 0;
		Integer quantidadeAvaliacaoReunidas = 0;
		Integer quantidadeAvaliacaoSaoJorge = 0;
		Integer quantidadeAvaliacaoTransnacional = 0;
		Integer quantidadeAvaliacaoMarcosDaSilva = 0;

		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer countId = 1;

		while (countId <= 6) {

			Query result = manager.createQuery("SELECT COUNT(*) FROM Avaliacao WHERE empresa.id = :empresa")
					.setParameter("empresa", countId.longValue());
			
			Long count = ((long) result.getResultList().iterator().next());

			if (countId.intValue() == 1) {
				quantidadeAvaliacaoSantaMaria = quantidadeAvaliacaoSantaMaria + count.intValue();
			}

			if (countId.intValue() == 2) {
				quantidadeAvaliacaoMandacaruense = quantidadeAvaliacaoMandacaruense + count.intValue();
			}

			if (countId.intValue() == 3) {
				quantidadeAvaliacaoReunidas = quantidadeAvaliacaoReunidas + count.intValue();
			}

			if (countId.intValue() == 4) {
				quantidadeAvaliacaoSaoJorge = quantidadeAvaliacaoSaoJorge + count.intValue();
			}

			if (countId.intValue() == 5) {
				quantidadeAvaliacaoTransnacional = quantidadeAvaliacaoTransnacional + count.intValue();
			}

			if (countId.intValue() == 6) {
				quantidadeAvaliacaoMarcosDaSilva = quantidadeAvaliacaoMarcosDaSilva + count.intValue();
			}

			hashCountFreq.put("quantidadeAvaliacaoSantaMaria", quantidadeAvaliacaoSantaMaria);
			hashCountFreq.put("quantidadeAvaliacaoMandacaruense", quantidadeAvaliacaoMandacaruense);
			hashCountFreq.put("quantidadeAvaliacaoReunidas", quantidadeAvaliacaoReunidas);
			hashCountFreq.put("quantidadeAvaliacaoSaoJorge", quantidadeAvaliacaoSaoJorge);
			hashCountFreq.put("quantidadeAvaliacaoTransnacional", quantidadeAvaliacaoTransnacional);
			hashCountFreq.put("quantidadeAvaliacaoMarcosDaSilva", quantidadeAvaliacaoMarcosDaSilva);

			countId++;
		}

		return hashCountFreq;
	}
	
	public Map<String, Integer> sugestaoChart() throws SQLDataException, JsonProcessingException {

		Integer quantidadeSugestaoSantaMaria = 0;
		Integer quantidadeSugestaoMandacaruense = 0;
		Integer quantidadeSugestaoReunidas = 0;
		Integer quantidadeSugestaoSaoJorge = 0;
		Integer quantidadeSugestaoTransnacional = 0;
		Integer quantidadeSugestaoMarcosDaSilva = 0;

		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer countId = 1;

		while (countId <= 6) {

			Query result = manager.createQuery("SELECT COUNT(*) FROM Sugestao WHERE empresa.id = :empresa")
					.setParameter("empresa", countId.longValue());
			
			Long count = ((long) result.getResultList().iterator().next());

			if (countId.intValue() == 1) {
				quantidadeSugestaoSantaMaria = quantidadeSugestaoSantaMaria + count.intValue();
			}

			if (countId.intValue() == 2) {
				quantidadeSugestaoMandacaruense = quantidadeSugestaoMandacaruense + count.intValue();
			}

			if (countId.intValue() == 3) {
				quantidadeSugestaoReunidas = quantidadeSugestaoReunidas + count.intValue();
			}

			if (countId.intValue() == 4) {
				quantidadeSugestaoSaoJorge = quantidadeSugestaoSaoJorge + count.intValue();
			}

			if (countId.intValue() == 5) {
				quantidadeSugestaoTransnacional = quantidadeSugestaoTransnacional + count.intValue();
			}

			if (countId.intValue() == 6) {
				quantidadeSugestaoMarcosDaSilva = quantidadeSugestaoMarcosDaSilva + count.intValue();
			}

			hashCountFreq.put("quantidadeSugestaoSantaMaria", quantidadeSugestaoSantaMaria);
			hashCountFreq.put("quantidadeSugestaoMandacaruense", quantidadeSugestaoMandacaruense);
			hashCountFreq.put("quantidadeSugestaoReunidas", quantidadeSugestaoReunidas);
			hashCountFreq.put("quantidadeSugestaoSaoJorge", quantidadeSugestaoSaoJorge);
			hashCountFreq.put("quantidadeSugestaoTransnacional", quantidadeSugestaoTransnacional);
			hashCountFreq.put("quantidadeSugestaoMarcosDaSilva", quantidadeSugestaoMarcosDaSilva);

			countId++;
		}

		return hashCountFreq;
	}


}
