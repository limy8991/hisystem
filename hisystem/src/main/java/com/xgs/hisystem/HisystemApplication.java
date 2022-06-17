package com.xgs.hisystem;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class HisystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(HisystemApplication.class, args);
    }
}
