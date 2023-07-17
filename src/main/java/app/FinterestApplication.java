package app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@org.springframework.boot.autoconfigure.EnableAutoConfiguration(
        exclude = {org.springframework.boot.autoconfigure.web
                .servlet.error.ErrorMvcAutoConfiguration.class})
public class FinterestApplication {
    public static void main(String[] args) {
        SpringApplication.run(FinterestApplication.class, args);
    }
}
