package com.clm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.clm.mapper")
public class ClmTakeOutApplication {

    public static void main(String[] args) {
        SpringApplication.run(ClmTakeOutApplication.class, args);
    }

}
