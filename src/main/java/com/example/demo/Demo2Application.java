package com.example.demo;

import com.example.demo.repository.AllStudentsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
public class Demo2Application{

    public static void main(String[] args) {
        SpringApplication.run(Demo2Application.class, args);

    }

}
