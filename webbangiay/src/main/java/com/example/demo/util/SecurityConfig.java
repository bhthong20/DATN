package com.example.demo.util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain config(HttpSecurity http) throws Exception {
        http.csrf().disable().cors().disable()
                .authorizeRequests()
                .requestMatchers("/login").permitAll()
                .requestMatchers("/WEB-INF/**").permitAll()
                .requestMatchers("/auth-register").permitAll()
                .requestMatchers("/forgot-password").permitAll()
                .requestMatchers("/reset-password").permitAll()
                .requestMatchers("/403").permitAll()
                .requestMatchers("/js").permitAll()
                .requestMatchers("/home/**").permitAll()
                .requestMatchers("/uploads/**").permitAll()
                .requestMatchers("/scss/**").permitAll()
                .requestMatchers("/ban-hang-online/rest/count-gio-hang").permitAll()
//                .requestMatchers("/**").permitAll()
                .requestMatchers("/user-infor").permitAll()
                .requestMatchers("/ban-hang-tai-quay/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/thong-ke/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/khuyen-mai/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/thuong-hieu/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/chat-lieu/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/kich-thuoc/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/mau-sac/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/loai/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/loai/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/chi-tiet-san-pham/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/chuc-vu/**").hasAnyRole(RolesConstant.ROLE_ADMIN)
                .requestMatchers("/vnpay-payment/**").hasAnyRole(RolesConstant.ROLE_USER)
                .requestMatchers("/payment/**").hasAnyRole(RolesConstant.ROLE_USER)
                .requestMatchers("/assets/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .exceptionHandling()
                .accessDeniedHandler(accessDeniedHandler())
                .and()
                .formLogin()
                .loginPage("/login")
                .permitAll()
                .successHandler(authenticationSuccessHandler()) // Sử dụng xử lý viên tùy chỉnh
                .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .permitAll();

        return http.build();
    }

    public AccessDeniedHandler accessDeniedHandler() {
        return (request, response, accessDeniedException) -> {
            response.sendRedirect(request.getContextPath() + "/403");
        };
    }

    @Bean
    public AuthenticationSuccessHandler authenticationSuccessHandler() {
        return new SimpleUrlAuthenticationSuccessHandler() {
            @Override
            protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
                // Kiểm tra vai trò của người dùng và chuyển hướng đến đường dẫn tương ứng
                if (authentication.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
                    return "/thong-ke"; // Chuyển hướng đến trang "/admin/home" nếu người dùng có vai trò ADMIN
                } else {
                    return "/home"; // Chuyển hướng đến trang "/home" mặc định
                }
            }
        };
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
