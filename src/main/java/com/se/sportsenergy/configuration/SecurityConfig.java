package com.se.sportsenergy.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf((csrf) -> csrf.disable())
                .authorizeHttpRequests((auth) -> auth
                        .requestMatchers("/order/**").authenticated()
                        .requestMatchers("/home/cart").authenticated()
                        .requestMatchers("/home/change-pass-form").authenticated()
                        .requestMatchers("/admin/**").hasAnyAuthority("STAF","DIRE")
                        .anyRequest().permitAll()
                )

                .httpBasic(Customizer.withDefaults())
                .formLogin(formLogin -> formLogin
                        .loginPage("/security/login/form")
                        .loginProcessingUrl("/security/login")
                        .defaultSuccessUrl("/security/login/success", false)
                        .failureUrl("/security/login/error"))

                .exceptionHandling(ex -> ex.accessDeniedPage("/security/unAuthorities"))

                .rememberMe(remember -> remember.tokenValiditySeconds(86400)) //(24*60*60)

                .logout(logout -> logout
                        .logoutUrl("/security/logoff")
                        .logoutSuccessUrl("/security/logoff/success"));

        return httpSecurity.build();

    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
