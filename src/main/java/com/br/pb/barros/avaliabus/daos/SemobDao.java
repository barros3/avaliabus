package com.br.pb.barros.avaliabus.daos;

import com.br.pb.barros.avaliabus.models.Semob;

public interface SemobDao {

	public void save(Semob semob);
	
	public void remove(Semob semob);

	public void update(Semob semob);

	public Semob get();

}
