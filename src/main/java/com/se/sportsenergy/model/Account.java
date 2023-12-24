package com.se.sportsenergy.model;

import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import java.util.List;
import java.util.Date;

@Data
@Entity
@Table(name = "accounts", uniqueConstraints = {
        @UniqueConstraint(name = "UC_email", columnNames = "email")
})

public class Account {
    @Id
    private String username;
    private String password;
    private String fullname;
    private String address;
    private String phone;

    @Column(unique = true)
    private String email;

    private String photo;

    @Temporal(TemporalType.DATE)
    @Column(name = "createdate")
    private Date createDate = new Date();
    @Column(columnDefinition = "BIT DEFAULT 1")
    private Boolean available;

    @JsonIgnore
    @OneToMany(mappedBy = "account")
    List<Order> orders;

    @JsonIgnore
    @OneToMany(mappedBy = "account", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    List<Authority> authorities;
	

}
