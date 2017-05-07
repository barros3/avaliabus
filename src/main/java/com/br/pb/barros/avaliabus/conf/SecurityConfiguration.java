package com.br.pb.barros.avaliabus.conf;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.br.pb.barros.avaliabus.daos.UsuarioSessionDao;

@Configuration
@EnableWebSecurity
@EnableGlobalAuthentication
@ComponentScan("com.br.pb.barros.avaliabus")
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired DriverManagerDataSource dataSource;

	@Autowired AvaliaBusAuthenticationProviderWEB sibusAuthenticationProvider;
	
	@Autowired UsuarioSessionDao usuarioSessionDAO;
	
	@Bean public PasswordEncoder passwordEncoder() {
	    return new BCryptPasswordEncoder();
	}

	@Bean @Inject public DaoAuthenticationProvider createDaoAuthenticationProvider(UserDetailsService service, PasswordEncoder encoder) {
	    DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
	    provider.setUserDetailsService((UserDetailsService) usuarioSessionDAO);
	    provider.setPasswordEncoder(passwordEncoder());
	    return provider;
	}
	
	@Autowired public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(sibusAuthenticationProvider)
			.userDetailsService((UserDetailsService) usuarioSessionDAO)
			.passwordEncoder(passwordEncoder());
		auth.jdbcAuthentication().dataSource(dataSource);
	}
	
	@Override public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**", "/assets/**");
	}
	
	@Bean	public HttpSessionEventPublisher httpSessionEventPublisher() {
	    return new HttpSessionEventPublisher();
	}

	@Bean	public SessionRegistry sessionRegistry() {
        SessionRegistry sessionRegistry = new SessionRegistryImpl();
        return sessionRegistry;
    }
	
	@Override protected void configure(HttpSecurity http) throws Exception {
		
	http
    .sessionManagement()
    .maximumSessions(1)
    .expiredUrl("/expired")
    .maxSessionsPreventsLogin(true)
    .sessionRegistry(sessionRegistry());
	
	http
//		.authorizeRequests().antMatchers("/home/**", "/login/**", "/indicador/**", "/empresa/**", "/resultados/**").permitAll()
//	.and()
//		.authorizeRequests().antMatchers("/denuncia/**", "/avaliacao/**", "/sugestao/**").hasAnyAuthority("USER", "ADMIN_MASTER")
//	.and()
//		.authorizeRequests().antMatchers("/**", "/usuario/**").hasAnyAuthority("ADMIN_MASTER").anyRequest().authenticated()
//	.and() // CONFIGURACAO HTTPS://
//		.requiresChannel().anyRequest().requiresSecure()
		.authorizeRequests().antMatchers("/**", "/usuario/**").permitAll()
	.and()
    	.formLogin()
	  	.loginProcessingUrl("/")
	  	.loginPage("/")
	  	.usernameParameter("username")
	  	.passwordParameter("password")
	  	.defaultSuccessUrl("/" , true)
	  	.failureUrl("/erro").permitAll()
    .and()
    	.logout()
    	.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
    
    .and()
    	.exceptionHandling()
    	.accessDeniedPage("/403")
	
    .and()
    	.csrf().disable();
		
	}
	
}
