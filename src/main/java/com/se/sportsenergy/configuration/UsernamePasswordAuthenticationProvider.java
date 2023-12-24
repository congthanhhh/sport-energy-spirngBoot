package com.se.sportsenergy.configuration;

import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.CustomUserDetails;
import com.se.sportsenergy.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UsernamePasswordAuthenticationProvider implements AuthenticationProvider, UserDetailsService {

    @Autowired
    private AccountService accountService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String password = authentication.getCredentials().toString();

        Account account = accountService.findById(username);
        if (account != null && (passwordEncoder.matches(password, account.getPassword()) || password.equals(account.getPassword()))) {

            if (!account.getAvailable()) {
                throw new DisabledException("Account is not available for username=" + username);
            }

            List<GrantedAuthority> authorities = account.getAuthorities().stream()
                    .map(au -> new SimpleGrantedAuthority(au.getRole().getId()))
                    .collect(Collectors.toList());

            // Tạo một thể hiện của lớp UserDetails tùy chỉnh của bạn
            CustomUserDetails userDetails = new CustomUserDetails();
            userDetails.setUsername(username);
            userDetails.setPassword(password);
            userDetails.setFullname(account.getFullname());
            userDetails.setPhoto(account.getPhoto());
            userDetails.setAuthorities(authorities);

//            System.out.println("Username: " + username);
//            System.out.println("Password: " + password);
//            System.out.println("Encoded Password from Database: " + account.getPassword());

            return new UsernamePasswordAuthenticationToken(userDetails, password, authorities);
        } else {
            throw new BadCredentialsException("Invalid password for username=" + username);
        }
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            Account account = accountService.findById(username);
            username = account.getUsername();
            String password = account.getPassword();
            List<GrantedAuthority> authorities = account.getAuthorities().stream()
                    .map(au -> new SimpleGrantedAuthority(au.getRole().getId()))
                    .collect(Collectors.toList());

            CustomUserDetails userDetails = new CustomUserDetails();
            userDetails.setUsername(username);
            userDetails.setPassword(password);
            userDetails.setFullname(account.getFullname());
            userDetails.setPhoto(account.getPhoto());
            userDetails.setAuthorities(authorities);
            return userDetails;
        } catch (Exception e) {
            throw new UsernameNotFoundException("User detail not found for username="+username);
        }

    }
}




