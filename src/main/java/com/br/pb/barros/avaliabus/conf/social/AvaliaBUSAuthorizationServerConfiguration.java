package com.br.pb.barros.avaliabus.conf.social;
/*package com.br.pb.barros.avaliabus.conf.authentication;
=======
package com.br.pb.barros.avaliabus.conf.authentication;
>>>>>>> 065e2d0549e6884974fa0fa0d5c686c3537068e0

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.approval.UserApprovalHandler;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;

@Configuration @EnableAuthorizationServer public class AvaliaBUSAuthorizationServerConfiguration extends AuthorizationServerConfigurerAdapter {
	
	private static String REALM = "MY_OAUTH_REALM";
    
    @Autowired private TokenStore tokenStore;
 
    @Autowired private UserApprovalHandler userApprovalHandler;
 
    @Autowired @Qualifier("authenticationManagerBean") private AuthenticationManager authenticationManager;
 
    @Override public void configure(ClientDetailsServiceConfigurer clients) throws Exception {

		        clients.inMemory()
		            .withClient("my-trusted-client")
		            .authorizedGrantTypes("password", "authorization_code", "refresh_token", "implicit")
		            .authorities("ROLE_ADMIN_MASTER", "ROLE_ADMIN")
		            .scopes("read", "write", "trust")
		            .secret("secret")
		            .accessTokenValiditySeconds(1200).//Access token is only valid for 2 minutes.
		            refreshTokenValiditySeconds(6000);//Refresh token is only valid for 10 minutes.	
    }
 
    @Override public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
		        endpoints
		        	.tokenStore(tokenStore)
		        	.userApprovalHandler(userApprovalHandler)
		            .authenticationManager(authenticationManager);
    }
 
    @Override
    public void configure(AuthorizationServerSecurityConfigurer oauthServer) throws Exception {
    	oauthServer
    	.tokenKeyAccess("permitAll()")
    	.getCheckTokenAccess();
//        oauthServer.realm(REALM+"/client");
    }
    
//    @Autowired DriverManagerDataSource dataSource;
//    
//    @Bean
//    public TokenStore tokenStore() {
//        return new JdbcTokenStore(dataSource);
//    }
 
}
*/
