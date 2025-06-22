package com.leo.healthy.persistence.entity;

public enum ActivityLevel {
    SEDENTARY("sedentary",1.2),
    LIGHT("light", 1.375),
    MODERATE("moderate", 1.55),
    ACTIVE("active",1.725),
    VERY_ACTIVE("very_active",1.9);

    private final String value;
    private final double multiplier; // Para calcular calorías basales

    ActivityLevel(String value, double multiplier) {
        this.value = value;
        this.multiplier = multiplier;
    }

    public String getValue() { return value; }
    public double getMultiplier() { return multiplier; }
}
