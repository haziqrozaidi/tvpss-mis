package com.example.tvpssmis.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {
	"com.example.tvpssmis.config",
	"com.example.tvpssmis.controller",
	"com.example.tvpssmis.service"
})
public class RootConfig {

}
