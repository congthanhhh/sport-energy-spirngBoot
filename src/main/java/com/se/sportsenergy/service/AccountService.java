package com.se.sportsenergy.service;

import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.Role;

import java.util.List;

public interface AccountService {

    Account findById(String username);

    Account findByEmail(String email);

    List<Account> findAll();

    List<Account> findAllByAvailableTrue();

    boolean isEmailExists(String email);

    boolean isAccountExists(String username);

    Account create(Account account, Role role);

    void updatePassword(Account account, String newPassword);

    Account updateAccountWithRole(Account account, Role role);

    Account updateAccount(Account account);

    void delete(String username);

    void backup(String username);

    List<Account> findDirectors();

    List<Account> findStaffAccounts();
}
