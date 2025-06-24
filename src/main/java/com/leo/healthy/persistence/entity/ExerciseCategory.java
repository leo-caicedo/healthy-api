package com.leo.healthy.persistence.entity;

public enum ExerciseCategory {
    CARDIO("cardio"),
    STRENGTH("strength"),
    FLEXIBILITY("flexibility"),
    SPORTS("sports");

    private final String value;

    ExerciseCategory(String value) {
        this.value = value;
    }

    public String getValue() { return value; }
}
