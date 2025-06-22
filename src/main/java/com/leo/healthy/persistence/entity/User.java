package com.leo.healthy.persistence.entity;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "users")
public class User {
    private Long id;

    @Column(name = "name")
    private String nombre;

    private String email;

    @Column(name = "age")
    private int edad;

    @Column(name = "current_weight")
    private double pesoActual;

    @Column(name = "hight")
    private double altura;

    @Enumerated(EnumType.STRING)
    @Column(name = "gender")
    private Gender gender;

    @Column(name = "registration_date")
    private LocalDateTime registrationDate;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
