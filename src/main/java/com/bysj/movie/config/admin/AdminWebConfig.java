package com.bysj.movie.config.admin;
/**
 * 用来配置后台拦截器的配置类
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.bysj.movie.constant.RuntimeConstant;
import com.bysj.movie.interceptor.admin.AdminLoginInterceptor;
import com.bysj.movie.interceptor.admin.AuthorityInterceptor;
@Configuration
public class AdminWebConfig implements WebMvcConfigurer {
	
	@Autowired
	private AdminLoginInterceptor adminLoginInterceptor;
	
	@Autowired
	private AuthorityInterceptor authorityInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(adminLoginInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.adminLoginExcludePathPatterns);
	    registry.addInterceptor(authorityInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.adminAuthorityExcludePathPatterns);
	}

}
