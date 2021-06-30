package com.poly.web;

/*import org.springframework.boot.CommandLineRunner;*/
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



@SpringBootApplication

public class WebApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebApplication.class, args);
	}

	/*
	 * CommandLineRunner init(StorageService storageService) { return (args->{
	 * storageService.init(); }); }
	 */
}
