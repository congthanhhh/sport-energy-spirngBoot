package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.AuthorityDAO;
import com.se.sportsenergy.model.Authority;
import com.se.sportsenergy.service.AuthorityService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    AuthorityDAO authorityDAO;

    @Override
    public List<Authority> findAuthoritiesOfAdministrator() {
        return null;
    }

    @Override
    public List<Authority> findAll() {
        return authorityDAO.findAll();
    }

    @Override
    public Authority findRoleByEmail(String email) {
        return authorityDAO.findRoleByEmail(email);
    }

    @Override
    public Authority create(Authority auth) {
        return authorityDAO.save(auth);
    }

    @Override
    public void delete(Long id) {
        Optional<Authority> authority = authorityDAO.findById(Long.valueOf(String.valueOf(id)));
        if (authority.isPresent()) {
            authorityDAO.deleteById(Long.valueOf(String.valueOf(id)));
        } else {
            throw new EntityNotFoundException("Category not found with id: " + id);
        }
    }
}
