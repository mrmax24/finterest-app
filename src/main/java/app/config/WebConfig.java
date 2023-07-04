package app.config;

import app.service.session.AddUsernameToHeaderInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "app.controller")
public class WebConfig implements WebMvcConfigurer {
    private AddUsernameToHeaderInterceptor addUsernameToHeaderInterceptor;

    public WebConfig(AddUsernameToHeaderInterceptor addUsernameToHeaderInterceptor) {
        this.addUsernameToHeaderInterceptor = addUsernameToHeaderInterceptor;
    }

    @Bean
    public InternalResourceViewResolver resolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setViewClass(JstlView.class);
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(addUsernameToHeaderInterceptor);
    }
}
