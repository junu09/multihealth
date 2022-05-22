package com.health;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//현재파일 웹설정포함파일
@Configuration
public class MyWebConfig implements WebMvcConfigurer {
	
	// <resoucres mapping="/upload/**" location="/upload/" />
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/upload/**")
		//.addResourceLocations("file:///c:/upload/");
		.addResourceLocations("file:/usr/mydir/upload/");
		
		registry
		.addResourceHandler("/upload2/**")
		.addResourceLocations("file:/Users/seoa/Desktop/upload/");
	}

}
 