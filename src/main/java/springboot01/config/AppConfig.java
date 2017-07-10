package springboot01.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import springboot01.interceptors.LoginInterceptor;

@Configuration
public class AppConfig extends WebMvcConfigurerAdapter {

	@Autowired
	private LoginInterceptor logininterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry interceptor){
		interceptor.addInterceptor(logininterceptor).addPathPatterns("/**");
	}
}
