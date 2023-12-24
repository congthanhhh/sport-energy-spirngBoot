package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.AccountDAO;
import com.se.sportsenergy.DAO.AuthorityDAO;
import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.Authority;
import com.se.sportsenergy.model.Role;
import com.se.sportsenergy.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDAO accountDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AuthorityDAO authorityDAO;

    @Override
    public Account findById(String username) {
        Optional<Account> account = accountDAO.findById(username);
        return account.orElse(null);

    }


    @Override
    public List<Account> findDirectors() {
        return accountDAO.findDirectors();
    }

    @Override
    public List<Account> findStaffAccounts() {
        return accountDAO.findStaffAndCustomers();
    }



    @Override
    public Account findByEmail(String email) {
        return accountDAO.findByEmail(email);
    }

    @Override
    public List<Account> findAll() {
        return accountDAO.findAll();
    }

    @Override
    public List<Account> findAllByAvailableTrue() {
        return accountDAO.findAllTrue();
    }

    @Override
    public boolean isEmailExists(String email) {
        return accountDAO.findByEmail(email) != null;
    }

    @Override
    public boolean isAccountExists(String username) {
        return accountDAO.findById(username).isPresent();
    }

    @Override
    public Account create(Account account, Role role) {
        String password = passwordEncoder.encode(account.getPassword());
        account.setPassword(password);
        account.setAvailable(true);
        Account savedAccount = accountDAO.save(account);

		/* Authority authority = authorityDAO.findByAccount(savedAccount); */Authority authority = new Authority();
        authority.setAccount(savedAccount);
        authority.setRole(role);
        authority.setAvailable(true);
        authorityDAO.save(authority);

        return savedAccount;
    }

    @Override
    public void updatePassword(Account account, String newPassword) {
        // Mã hóa mật khẩu mới trước khi lưu vào cơ sở dữ liệu
        String encodedPassword = passwordEncoder.encode(newPassword);
        account.setPassword(encodedPassword);

        // Lưu thông tin tài khoản đã cập nhật vào cơ sở dữ liệu
        accountDAO.save(account);
    }

    @Override
    public Account updateAccountWithRole(Account account, Role role) {
        // Cập nhật thông tin tài khoản
    	String password = passwordEncoder.encode(account.getPassword());
        account.setPassword(password);
        Account savedAccount = accountDAO.save(account);

        

        // Authority authority = new Authority();
        // authority.setAccount(savedAccount);
        // authority.setRole(role);
        // authorityDAO.save(authority);

        Authority authority = authorityDAO.findByAccount(savedAccount);

    // Nếu tìm thấy Authority, cập nhật role
    if (authority != null) {
        authority.setRole(role);
        authorityDAO.save(authority);
    } else {
        // Nếu không tìm thấy, tạo mới Authority với role mới
        Authority newAuthority = new Authority();
        newAuthority.setAccount(savedAccount);
        newAuthority.setRole(role);
        authorityDAO.save(newAuthority);
    }

        return savedAccount;
    }
    
@Override
    public Account updateAccount(Account account) {
        // Cập nhật thông tin tài khoản
    	String password = passwordEncoder.encode(account.getPassword());
        account.setPassword(password);
        Account savedAccount = accountDAO.save(account);

        

        return savedAccount;
    }


	@Override
	public void delete(String username) {
		Account a = accountDAO.findById(username).get();
		a.setAvailable(false);
		accountDAO.save(a);
	}
	
	@Override
	public void backup(String username) {
		Account a = accountDAO.findById(username).get();
		a.setAvailable(true);
		accountDAO.save(a);
	}


    
    
}
