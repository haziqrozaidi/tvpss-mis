package com.example.tvpssmis.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity(debug = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
    DataSource dataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	    auth.inMemoryAuthentication()
	        .withUser("user")
	        	.password("{noop}user")
	        	.roles("USER")
	        .and()
	        .withUser("admin")
	        	.password("{noop}admin")
	        	.roles("USER", "ADMIN");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	    http
			.authorizeRequests()
				.antMatchers("/").hasAnyRole("USER", "ADMIN")
				.anyRequest().authenticated()
			.and()
				.formLogin().permitAll()
			.and()
				.logout().permitAll()
			.and()
	            .csrf().disable();
	}
}
