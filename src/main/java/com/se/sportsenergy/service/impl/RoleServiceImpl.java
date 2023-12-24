package com.se.sportsenergy.service.impl;

import com.se.sportsenergy.DAO.RoleDAO;
import com.se.sportsenergy.model.Role;
import com.se.sportsenergy.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleDAO roleDAO;


    @Override
    public List<Role> findAll() {
        return roleDAO.findAll();
    }

    @Override
    public Role findById(String id) {
        return roleDAO.findById(id).get();
    }

    @Override
    public Role create(Role role) {
        return roleDAO.save(role);
    }

    @Override
    public Role update(Role role) {
        return roleDAO.save(role);
    }

    @Override
    public void delete(String id) {
        roleDAO.deleteById(id);
    }
}
