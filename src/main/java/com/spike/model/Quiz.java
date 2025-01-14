package com.spike.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long quizId;

    @Column(nullable = false, length = 500)
    private String question;

    @Column(nullable = false, length = 1)
    private String correctAnswer;

    @Column(nullable = false, length = 50)
    private String category;

    @Column(nullable = false)
    private int points;

    @Column(nullable = false, updatable = false)
    private LocalDateTime createdDate;

    @PrePersist
    public void prePersist() {
        if (createdDate == null) {
            createdDate = LocalDateTime.now();
        }
    }

    // Getters and Setters
}
