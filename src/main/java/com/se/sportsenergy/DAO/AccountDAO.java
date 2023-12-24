package com.se.sportsenergy.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.se.sportsenergy.model.Account;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AccountDAO extends JpaRepository<Account,String>{

    @Query("SELECT a FROM Account a where a.email = :email")
    Account findByEmail(@Param("email") String email);

    @Query("SELECT a FROM Account a where a.available = true")
    List<Account> findAllTrue();

    @Query("SELECT a FROM Account a JOIN a.authorities auth WHERE auth.role.id = 'DIRE'")
    List<Account> findDirectors();

    @Query("SELECT a FROM Account a JOIN a.authorities auth WHERE auth.role.id IN ('STAF', 'CUST')")
    List<Account> findStaffAndCustomers();



}
