package com.winning.hic;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.winning.hic.model")
public class HicApplication {

	public static void main(String[] args) {
		SpringApplication.run(HicApplication.class, args);
	}
}
