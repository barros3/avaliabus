package com.br.pb.barros.avaliabus.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.br.pb.barros.avaliabus.daos.SemobDao;
import com.br.pb.barros.avaliabus.models.Semob;

@Service
public class ServiceSemob {
	
	@Autowired
	private SemobDao asemobDAO;
	
	@Transactional(readOnly = true)
	public void saveSemob(Semob asemob) {
			
		try {

			asemobDAO.save(asemob);

		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}


}
