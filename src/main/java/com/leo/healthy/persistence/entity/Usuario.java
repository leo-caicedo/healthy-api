package com.leo.healthy.persistence.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class Usuario {
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
}
