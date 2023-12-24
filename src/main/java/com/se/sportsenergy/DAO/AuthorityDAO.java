package com.se.sportsenergy.DAO;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import com.se.sportsenergy.model.Account;
import com.se.sportsenergy.model.Authority;
import com.se.sportsenergy.model.Role;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AuthorityDAO extends JpaRepository<Authority, Long>{

	Authority findByAccount(Account updatedAccount);

	@Query("SELECT a.role.name FROM Authority a where a.account.email = :email")
	Authority findRoleByEmail(@Param("email") String email);

	@Modifying
    @Query("UPDATE Authority a SET a.role = :role WHERE a.account = :account")
    void updateRoleByAccount(@Param("account") Account account, @Param("role") Role role);
}
