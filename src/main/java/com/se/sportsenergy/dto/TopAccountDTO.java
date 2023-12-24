package com.se.sportsenergy.dto;

import com.se.sportsenergy.model.Account;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class TopAccountDTO {
    private Account account;
    private Long count;
    private Double sumTotal;
}
