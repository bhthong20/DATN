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

                // Quyền truy cập công khai
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
                .requestMatchers("/ban-hang-online/**").permitAll()
                .requestMatchers("/user-infor").permitAll()
                .requestMatchers("/assets/**").permitAll()
                .requestMatchers("/vnpay-payment/**").permitAll()
                .requestMatchers("/payment/**").permitAll()
                .requestMatchers("/san-pham/**").permitAll()
                .requestMatchers("/khach-hang/**").permitAll()
                .requestMatchers("/khach-hang/thong-tin-ca-nhan").permitAll()
                .requestMatchers("/hoa-don/**").permitAll()
                .requestMatchers("/gio-hang/**").hasRole("USER")
                .requestMatchers("/ban-hang-online/**").hasAnyRole("USER", "STAFF", "ADMIN")
                //.requestMatchers("/**").permitAll()

                // Quyền dành cho nhân viên
                .requestMatchers("/ban-hang-tai-quay/**").hasAnyRole("STAFF", "ADMIN") // Nhân viên bán hàng tại quầy
                .requestMatchers("/khuyen-mai/**", "/thuong-hieu/**", "/chat-lieu/**",
                        "/kich-thuoc/**", "/mau-sac/**", "/loai/**",
                        "/chi-tiet-san-pham/**").hasAnyRole("STAFF", "ADMIN")
                .requestMatchers("/hoa-don/**").hasAnyRole("STAFF", "ADMIN")

                // Quyền dành cho admin
                .requestMatchers("/thong-ke/**").hasRole("ADMIN") // Thống kê
                .requestMatchers("/chuc-vu/**").hasRole("ADMIN") // Quản lý nhân viên
                .requestMatchers("/**").hasRole("ADMIN") // Mọi thứ khác

                // Các yêu cầu khác phải được xác thực
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
                } else if (authentication.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_STAFF"))) {
                    return "/ban-hang-tai-quay"; // STAFF chuyển đến trang bán hàng tại quầy
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
