package com.br.pb.barros.avaliabus.util;

import com.br.pb.barros.avaliabus.models.Empresa;
import java.util.Date;

public interface Analise {

	public void dadosGerais(Empresa e, String linhaOnibus, Date dataAnalise);
	
}
