package com.entities;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

@Entity
@Table(name = "stages")
public class Stage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "minimum_assessment")
    private Integer minimumAssessment;

    @Column(name = "optimistic_assessment")
    private Integer optimisticAssessment;

    @Column(name = "maximum_assessment")
    private Integer maximumAssessment;

    @JsonIgnore
    @JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "project_id")
    private Project project;


    public Stage(String name, String description, Integer minimumAssessment, Integer optimisticAssessment, Integer maximumAssessment) {
        this.name = name;
        this.description = description;
        this.minimumAssessment = minimumAssessment;
        this.optimisticAssessment = optimisticAssessment;
        this.maximumAssessment = maximumAssessment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Integer getMinimumAssessment() {
        return minimumAssessment;
    }

    public void setMinimumAssessment(Integer minimumAssessment) {
        this.minimumAssessment = minimumAssessment;
    }

    public Integer getOptimisticAssessment() {
        return optimisticAssessment;
    }

    public void setOptimisticAssessment(Integer optimisticAssessment) {
        this.optimisticAssessment = optimisticAssessment;
    }

    public Integer getMaximumAssessment() {
        return maximumAssessment;
    }

    public void setMaximumAssessment(Integer maximumAssessment) {
        this.maximumAssessment = maximumAssessment;
    }
}
