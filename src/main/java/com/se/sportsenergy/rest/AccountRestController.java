package com.se.sportsenergy.rest;

import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.Role;
import com.se.sportsenergy.service.AccountService;
import com.se.sportsenergy.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("rest/account")
public class AccountRestController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private RoleService roleService;

    @GetMapping
    public ResponseEntity<List<Account>> getAllAccount() {
        List<Account> accounts = accountService.findAll();
        return new ResponseEntity<>(accounts, HttpStatus.OK);
    }

    @PostMapping("/register")
    public ResponseEntity<Account> registerAccount(@RequestBody Account account, @RequestParam String roleName) {

        Role role = roleService.findById(roleName);
        if (role == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        Account savedAccount = accountService.create(account, role);
        return new ResponseEntity<>(savedAccount, HttpStatus.CREATED);


//        ResponseEntity<String> response = null;
//        try {
//            Account saveAccount = accountService.create(account);
//            if (saveAccount != null) {
//                response = ResponseEntity.status(HttpStatus.CREATED)
//                        .body("Account is created successfully for user="+account.getUsername());
//            }
//        } catch (Exception e) {
//            response = ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
//                    .body("An exception occurred from server  with exception=" + e);
//        }
//        return response;

    }

}
