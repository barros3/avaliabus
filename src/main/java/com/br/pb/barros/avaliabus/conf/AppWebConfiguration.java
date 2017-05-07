package com.br.pb.barros.avaliabus.conf;

import org.hibernate.annotations.Filter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.br.pb.barros.avaliabus.util.AvaliaBUSInterceptor;

@Configuration
@EnableWebMvc
@Import({ SecurityConfiguration.class })
@ComponentScan(basePackages = "com.br.pb.barros.avaliabus")
public class AppWebConfiguration extends WebMvcConfigurerAdapter {
	
	@Override public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new AvaliaBUSInterceptor());
	}

	@Override public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/assets/**").addResourceLocations("/assets/");
	}

	@Bean public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Bean(name = "dataSource") public DriverManagerDataSource dataSource() {
		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		driverManagerDataSource.setDriverClassName("com.mysql.jdbc.Driver");
		driverManagerDataSource.setUrl("jdbc:mysql://avaliabus:3306/sampledb");
		driverManagerDataSource.setUsername("root");
		driverManagerDataSource.setPassword("uKrwbCEXNFtJ1gAo");
		
		/*driverManagerDataSource.setUrl("jdbc:mysql://localhost:3306/avaliabus");
		driverManagerDataSource.setUsername("root");
		driverManagerDataSource.setPassword("");*/
		return driverManagerDataSource;
	}
	
	@Bean(name = "multipartResolver") public CommonsMultipartResolver createMultipartResolver() {
	    CommonsMultipartResolver resolver=new CommonsMultipartResolver();
	    resolver.setMaxUploadSize(5242880);
	    resolver.setDefaultEncoding("utf-8");
	    return resolver;
	}
	
	
	@Bean public ReloadableResourceBundleMessageSource messageSource(){
	    ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource = new ReloadableResourceBundleMessageSource();
	    reloadableResourceBundleMessageSource.setBasename("/WEB-INF/messages/");
	    return reloadableResourceBundleMessageSource;
	}
	
	@Filter(name = "encodingFilter") public CharacterEncodingFilter encodingFilter(){
		CharacterEncodingFilter cef = new CharacterEncodingFilter();
		cef.setEncoding("UTF-8");
		cef.setForceEncoding(true);
		return null;
	}
	
}
