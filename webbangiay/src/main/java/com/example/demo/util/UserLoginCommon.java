package com.example.demo.util;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserLoginCommon {

    @Autowired
    private HttpSession session;

    public Object getUserLogin() {
        return session.getAttribute("USER_LOGIN");
    }

    public String getUserLoginType() {
        return (String) session.getAttribute("USER_LOGIN_TYPE");
    }
}
