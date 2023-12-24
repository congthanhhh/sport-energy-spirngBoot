package com.se.sportsenergy.service;

import com.se.sportsenergy.model.Authority;

import java.util.List;

public interface AuthorityService {

    List<Authority> findAuthoritiesOfAdministrator();

    List<Authority> findAll();

    Authority findRoleByEmail(String email);

    Authority create(Authority auth);

    void delete(Long id);
}
