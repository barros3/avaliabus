package com.br.pb.barros.avaliabus.daos.impl;

import java.sql.SQLDataException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.br.pb.barros.avaliabus.daos.EmpresaDao;
import com.br.pb.barros.avaliabus.daos.PaginatorQueryHelper;
import com.br.pb.barros.avaliabus.enuns.TipoNomeEmpresa;
import com.br.pb.barros.avaliabus.models.Empresa;
import com.br.pb.barros.avaliabus.models.PaginatedList;
import com.fasterxml.jackson.core.JsonProcessingException;

@Repository
public class EmpresaDaoImpl implements EmpresaDao {

	@PersistenceContext
	private EntityManager manager;

	public List<Empresa> all() {
		return manager.createQuery("select c from Empresa c", Empresa.class).getResultList();
	}

	public void save(Empresa empresa) {
		manager.persist(empresa);
	}

	public Empresa findById(Long id) {
		return manager.find(Empresa.class, id);
	}

	public void remove(Empresa empresa) {
		manager.remove(empresa);
	}

	public void update(Empresa empresa) {
		manager.merge(empresa);
	}

	@Override
	public Empresa findByTipoName(TipoNomeEmpresa tipoNomeEmpresa) {

		Query query = manager.createQuery("select c from Empresa c where c.tipoNomeEmpresa = :tipoNomeEmpresa")
				.setParameter("tipoNomeEmpresa", tipoNomeEmpresa);
		Empresa empresa = (Empresa) query.getSingleResult();

		return empresa;
	}

	public PaginatedList paginated(int page, int max) {
		return new PaginatorQueryHelper().list(manager, Empresa.class, page, max);
	}

	public Map<String, Integer> avalieChartFrequencia(Empresa empresa)
			throws SQLDataException, JsonProcessingException {

		Integer frequenciaPessimo = 0;
		Integer frequenciaRuim = 0;
		Integer frequenciaRegular = 0;
		Integer frequenciaBom = 0;
		Integer frequenciaExcelente = 0;
		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer frequencia = 1;

		while (frequencia <= 5) {

			Query frequenciaTemp = manager
					.createQuery(
							"SELECT COUNT(frequencia) FROM Avaliacao WHERE empresa.id = :empresa AND frequencia = :frequencia")
					.setParameter("empresa", empresa.getId()).setParameter("frequencia", frequencia);

			Long count = ((long) frequenciaTemp.getResultList().iterator().next());

			if (frequencia.intValue() == 1) {
				frequenciaPessimo = frequenciaPessimo + count.intValue();
			}

			if (frequencia.intValue() == 2) {
				frequenciaRuim = frequenciaRuim + count.intValue();
			}

			if (frequencia.intValue() == 3) {
				frequenciaRegular = frequenciaRegular + count.intValue();
			}

			if (frequencia.intValue() == 4) {
				frequenciaBom = frequenciaBom + count.intValue();
			}

			if (frequencia.intValue() == 5) {
				frequenciaExcelente = frequenciaExcelente + count.intValue();
			}

			hashCountFreq.put("frequenciaPessimo", frequenciaPessimo);
			hashCountFreq.put("frequenciaRuim", frequenciaRuim);
			hashCountFreq.put("frequenciaRegular", frequenciaRegular);
			hashCountFreq.put("frequenciaBom", frequenciaBom);
			hashCountFreq.put("frequenciaExcelente", frequenciaExcelente);

			frequencia++;
		}

		return hashCountFreq;
	}

	public Map<String, Integer> avalieChartPontualidade(Empresa empresa)
			throws SQLDataException, JsonProcessingException {

		Integer pontualidadePessimo = 0;
		Integer pontualidadeRuim = 0;
		Integer pontualidadeRegular = 0;
		Integer pontualidadeBom = 0;
		Integer pontualidadeExcelente = 0;
		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer pontualidade = 1;

		while (pontualidade <= 5) {

			Query pontualidadeTemp = manager
					.createQuery(
							"SELECT COUNT(pontualidade) FROM Avaliacao WHERE empresa.id = :empresa AND pontualidade = :pontualidade")
					.setParameter("empresa", empresa.getId()).setParameter("pontualidade", pontualidade);

			Long count = ((long) pontualidadeTemp.getResultList().iterator().next());

			if (pontualidade.intValue() == 1) {
				pontualidadePessimo = pontualidadePessimo + count.intValue();
			}

			if (pontualidade.intValue() == 2) {
				pontualidadeRuim = pontualidadeRuim + count.intValue();
			}

			if (pontualidade.intValue() == 3) {
				pontualidadeRegular = pontualidadeRegular + count.intValue();
			}

			if (pontualidade.intValue() == 4) {
				pontualidadeBom = pontualidadeBom + count.intValue();
			}

			if (pontualidade.intValue() == 5) {
				pontualidadeExcelente = pontualidadeExcelente + count.intValue();
			}

			hashCountFreq.put("pontualidadePessimo", pontualidadePessimo);
			hashCountFreq.put("pontualidadeRuim", pontualidadeRuim);
			hashCountFreq.put("pontualidadeRegular", pontualidadeRegular);
			hashCountFreq.put("pontualidadeBom", pontualidadeBom);
			hashCountFreq.put("pontualidadeExcelente", pontualidadeExcelente);

			pontualidade++;
		}

		return hashCountFreq;
	}

	public Map<String, Integer> avalieChartLimpeza(Empresa empresa) throws SQLDataException, JsonProcessingException {

		Integer limpezaPessimo = 0;
		Integer limpezaRuim = 0;
		Integer limpezaRegular = 0;
		Integer limpezaBom = 0;
		Integer limpezaExcelente = 0;
		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer limpeza = 1;

		while (limpeza <= 5) {

			Query limpezaTemp = manager
					.createQuery(
							"SELECT COUNT(limpeza) FROM Avaliacao WHERE empresa.id = :empresa AND limpeza = :limpeza")
					.setParameter("empresa", empresa.getId()).setParameter("limpeza", limpeza);

			Long count = ((long) limpezaTemp.getResultList().iterator().next());

			if (limpeza.intValue() == 1) {
				limpezaPessimo = limpezaPessimo + count.intValue();
			}

			if (limpeza.intValue() == 2) {
				limpezaRuim = limpezaRuim + count.intValue();
			}

			if (limpeza.intValue() == 3) {
				limpezaRegular = limpezaRegular + count.intValue();
			}

			if (limpeza.intValue() == 4) {
				limpezaBom = limpezaBom + count.intValue();
			}

			if (limpeza.intValue() == 5) {
				limpezaExcelente = limpezaExcelente + count.intValue();
			}

			hashCountFreq.put("limpezaPessimo", limpezaPessimo);
			hashCountFreq.put("limpezaRuim", limpezaRuim);
			hashCountFreq.put("limpezaRegular", limpezaRegular);
			hashCountFreq.put("limpezaBom", limpezaBom);
			hashCountFreq.put("limpezaExcelente", limpezaExcelente);

			limpeza++;
		}

		return hashCountFreq;
	}

	public Map<String, Integer> avalieChartLotacao(Empresa empresa) throws SQLDataException, JsonProcessingException {

		Integer lotacaoPessimo = 0;
		Integer lotacaoRuim = 0;
		Integer lotacaoRegular = 0;
		Integer lotacaoBom = 0;
		Integer lotacaoExcelente = 0;
		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer lotacao = 1;

		while (lotacao <= 5) {

			Query lotacaoTemp = manager
					.createQuery(
							"SELECT COUNT(lotacao) FROM Avaliacao WHERE empresa.id = :empresa AND lotacao = :lotacao")
					.setParameter("empresa", empresa.getId()).setParameter("lotacao", lotacao);

			Long count = ((long) lotacaoTemp.getResultList().iterator().next());

			if (lotacao.intValue() == 1) {
				lotacaoPessimo = lotacaoPessimo + count.intValue();
			}

			if (lotacao.intValue() == 2) {
				lotacaoRuim = lotacaoRuim + count.intValue();
			}

			if (lotacao.intValue() == 3) {
				lotacaoRegular = lotacaoRegular + count.intValue();
			}

			if (lotacao.intValue() == 4) {
				lotacaoBom = lotacaoBom + count.intValue();
			}

			if (lotacao.intValue() == 5) {
				lotacaoExcelente = lotacaoExcelente + count.intValue();
			}

			hashCountFreq.put("lotacaoPessimo", lotacaoPessimo);
			hashCountFreq.put("lotacaoRuim", lotacaoRuim);
			hashCountFreq.put("lotacaoRegular", lotacaoRegular);
			hashCountFreq.put("lotacaoBom", lotacaoBom);
			hashCountFreq.put("lotacaoExcelente", lotacaoExcelente);

			lotacao++;
		}

		return hashCountFreq;
	}

	public Map<String, Integer> avalieChartConducaoMotorista(Empresa empresa)
			throws SQLDataException, JsonProcessingException {

		Integer conducaoMotoristaPessimo = 0;
		Integer conducaoMotoristaRuim = 0;
		Integer conducaoMotoristaRegular = 0;
		Integer conducaoMotoristaBom = 0;
		Integer conducaoMotoristaExcelente = 0;
		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer conducaoMotorista = 1;

		while (conducaoMotorista <= 5) {

			Query conducaoMotoristaTemp = manager
					.createQuery(
							"SELECT COUNT(conducaoMotorista) FROM Avaliacao WHERE empresa.id = :empresa AND conducaoMotorista = :conducaoMotorista")
					.setParameter("empresa", empresa.getId()).setParameter("conducaoMotorista", conducaoMotorista);

			Long count = ((long) conducaoMotoristaTemp.getResultList().iterator().next());

			if (conducaoMotorista.intValue() == 1) {
				conducaoMotoristaPessimo = conducaoMotoristaPessimo + count.intValue();
			}

			if (conducaoMotorista.intValue() == 2) {
				conducaoMotoristaRuim = conducaoMotoristaRuim + count.intValue();
			}

			if (conducaoMotorista.intValue() == 3) {
				conducaoMotoristaRegular = conducaoMotoristaRegular + count.intValue();
			}

			if (conducaoMotorista.intValue() == 4) {
				conducaoMotoristaBom = conducaoMotoristaBom + count.intValue();
			}

			if (conducaoMotorista.intValue() == 5) {
				conducaoMotoristaExcelente = conducaoMotoristaExcelente + count.intValue();
			}

			hashCountFreq.put("conducaoMotoristaPessimo", conducaoMotoristaPessimo);
			hashCountFreq.put("conducaoMotoristaRuim", conducaoMotoristaRuim);
			hashCountFreq.put("conducaoMotoristaRegular", conducaoMotoristaRegular);
			hashCountFreq.put("conducaoMotoristaBom", conducaoMotoristaBom);
			hashCountFreq.put("conducaoMotoristaExcelente", conducaoMotoristaExcelente);

			conducaoMotorista++;
		}

		return hashCountFreq;
	}

	public Map<String, Integer> avalieChartConservacaoColetivo(Empresa empresa)
			throws SQLDataException, JsonProcessingException {

		Integer conservacaoColetivoPessimo = 0;
		Integer conservacaoColetivoRuim = 0;
		Integer conservacaoColetivoRegular = 0;
		Integer conservacaoColetivoBom = 0;
		Integer conservacaoColetivoExcelente = 0;
		Map<String, Integer> hashCountFreq = new HashMap<String, Integer>();

		Integer conservacaoColetivo = 1;

		while (conservacaoColetivo <= 5) {

			Query conservacaoColetivoTemp = manager
					.createQuery(
							"SELECT COUNT(conservacaoTransporte) FROM Avaliacao WHERE empresa.id = :empresa AND conservacaoTransporte = :conservacaoTransporte")
					.setParameter("empresa", empresa.getId())
					.setParameter("conservacaoTransporte", conservacaoColetivo);

			Long count = ((long) conservacaoColetivoTemp.getResultList().iterator().next());

			if (conservacaoColetivo.intValue() == 1) {
				conservacaoColetivoPessimo = conservacaoColetivoPessimo + count.intValue();
			}

			if (conservacaoColetivo.intValue() == 2) {
				conservacaoColetivoRuim = conservacaoColetivoRuim + count.intValue();
			}

			if (conservacaoColetivo.intValue() == 3) {
				conservacaoColetivoRegular = conservacaoColetivoRegular + count.intValue();
			}

			if (conservacaoColetivo.intValue() == 4) {
				conservacaoColetivoBom = conservacaoColetivoBom + count.intValue();
			}

			if (conservacaoColetivo.intValue() == 5) {
				conservacaoColetivoExcelente = conservacaoColetivoExcelente + count.intValue();
			}

			hashCountFreq.put("conservacaoColetivoPessimo", conservacaoColetivoPessimo);
			hashCountFreq.put("conservacaoColetivoRuim", conservacaoColetivoRuim);
			hashCountFreq.put("conservacaoColetivoRegular", conservacaoColetivoRegular);
			hashCountFreq.put("conservacaoColetivoBom", conservacaoColetivoBom);
			hashCountFreq.put("conservacaoColetivoExcelente", conservacaoColetivoExcelente);

			conservacaoColetivo++;
		}

		return hashCountFreq;
	}


}
