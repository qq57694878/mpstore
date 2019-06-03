package com.kulongtai.mpstore.common.config;

import com.kulongtai.mpstore.common.intercepter.UserAuthRestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig {
    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        .allowedMethods("*")
                        .allowedHeaders("*")
                        .allowCredentials(false).maxAge(3600);
            }

            @Override
            public void addResourceHandlers(ResourceHandlerRegistry registry) {
                registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
            }
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(getUserAuthRestInterceptor()).
                        addPathPatterns("/**/*")
                        .excludePathPatterns("/**/fonts/*")
                        .excludePathPatterns("/**/*.css")
                        .excludePathPatterns("/**/*.js")
                        .excludePathPatterns("/**/*.png")
                        .excludePathPatterns("/**/*.gif")
                        .excludePathPatterns("/**/*.jpg")
                        .excludePathPatterns("/**/*.jpeg")
                        .excludePathPatterns("/**/*.html")
                        .excludePathPatterns("/static/*")
                        .excludePathPatterns("/public/*")
                        .excludePathPatterns("/webjars/*")
                        .excludePathPatterns("/**/*");
            }

        };
    }

    @Bean
    UserAuthRestInterceptor getUserAuthRestInterceptor() {
        return new UserAuthRestInterceptor();
    }

}
