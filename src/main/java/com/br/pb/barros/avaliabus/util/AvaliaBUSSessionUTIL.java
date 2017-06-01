package com.br.pb.barros.avaliabus.util;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

@Component
@Scope(value = "session",  proxyMode = ScopedProxyMode.TARGET_CLASS)
public class AvaliaBUSSessionUTIL {

	public AvaliaBUSSessionUTIL() {
	}
	
	private boolean isAdminMaster;
	
	private boolean isLogado;
	
	private boolean isLocal = true;
	
	public boolean isAdminMaster(){
		return isAdminMaster;
	}
	
	public boolean isLogado(){
		return isLogado;
	}

	public void setAdminMaster(boolean isAdminMaster) {
		this.isAdminMaster = isAdminMaster;
	}

	public void setLogado(boolean isLogado) {
		this.isLogado = isLogado;
	}
	
	public boolean isLocal() {
		return isLocal;
	}
	
}
