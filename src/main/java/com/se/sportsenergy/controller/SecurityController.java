package com.se.sportsenergy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/security")
public class SecurityController {

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("message","Username or password invalid!");
        return "home/security/login";
    }

    @RequestMapping("/login/form")
    public String loginForm() {
        return "home/security/login";
    }

    @RequestMapping("/login/success")
    public String loginSuccess(Model model) {
        model.addAttribute("message","Login successfully!");
        return "redirect:/";
    }

    @RequestMapping("/login/error")
    public String loginError(Model model) {
        model.addAttribute("message","Username or password invalid!");
        return "home/security/login";
    }
    @RequestMapping("/unAuthorities")
    public String unAuthorities(Model model) {
        model.addAttribute("message","You do not have access!");
        return "home/security/login";
    }
    @RequestMapping("/logoff/success")
    public String logOff(Model model) {
        model.addAttribute("message","Log out successfully!");
        return "home/security/login";
    }


}
