package com.example.tvpssmis.config;

import com.example.tvpssmis.entity.User;
import com.example.tvpssmis.service.equipment.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserDAO userDAO;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        HttpSession session = request.getSession();
        String username = ((UserDetails) authentication.getPrincipal()).getUsername();
        User user = userDAO.findByUsername(username);
        
        // Add user and role objects to session
        session.setAttribute("user", user);
        session.setAttribute("role", user.getRole());
        System.out.println("User: " + user);
        System.out.println("Role: " + user.getRole());

        // Redirect to the default success URL
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}