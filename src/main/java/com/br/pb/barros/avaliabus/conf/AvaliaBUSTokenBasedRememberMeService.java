package com.br.pb.barros.avaliabus.conf;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;

public class AvaliaBUSTokenBasedRememberMeService extends TokenBasedRememberMeServices {
	
	public AvaliaBUSTokenBasedRememberMeService(String key, UserDetailsService userDetailsService) {
        super(key, userDetailsService);
    }
	
	private final String HEADER_SECURITY_TOKEN = "m_key_token";
	
    /**
     * Locates the Spring Security remember me token in the request and returns its value.
     *
     * @param request the submitted request which is to be authenticated
     * @return the value of the request header (which was originally provided by the cookie - API expects it in header)
     */
    @Override protected String extractRememberMeCookie(HttpServletRequest request) {
    	String token = request.getHeader(HEADER_SECURITY_TOKEN);
        if ((token == null) || (token.length() == 0)) {
            return null;
        }
        
        return token;
    }

}
