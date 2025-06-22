package com.leo.healthy.persistence.entity;

public enum Goal {
    LOSE_WEIGHT("lose_weight"),
    MAINTAIN("maintain"),
    GAIN_WEIGHT("gain_weight"),
    TONE_UP("tone_up");

    private final String value;

    Goal(String value) {
        this.value = value;
    }

    public String getValue() { return value; }
}
