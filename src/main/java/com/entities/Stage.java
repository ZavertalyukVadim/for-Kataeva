package com.entities;

import com.fasterxml.jackson.annotation.JsonBackReference;

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

    @Column(name = "pessimistic_assessment")
    private Integer pessimisticAssessment;

    @Column(name = "probable_assessment")
    private Integer probableAssessment;

    @Column(name = "optimistic_assessment")
    private Integer optimisticAssessment;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

    public Stage() {
    }

    public Stage(String name, String description, Integer pessimisticAssessment, Integer probableAssessment, Integer optimisticAssessment) {
        this.name = name;
        this.description = description;
        this.pessimisticAssessment = pessimisticAssessment;
        this.probableAssessment = probableAssessment;
        this.optimisticAssessment = optimisticAssessment;
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

    public Integer getPessimisticAssessment() {
        return pessimisticAssessment;
    }

    public void setPessimisticAssessment(Integer pessimisticAssessment) {
        this.pessimisticAssessment = pessimisticAssessment;
    }

    public Integer getProbableAssessment() {
        return probableAssessment;
    }

    public void setProbableAssessment(Integer probableAssessment) {
        this.probableAssessment = probableAssessment;
    }

    public Integer getOptimisticAssessment() {
        return optimisticAssessment;
    }

    public void setOptimisticAssessment(Integer optimisticAssessment) {
        this.optimisticAssessment = optimisticAssessment;
    }

    public double getBadProbability() {
        if (optimisticAssessment!=null&&pessimisticAssessment!=null&&probableAssessment!=null) {
            double first = (optimisticAssessment + pessimisticAssessment + 4 * probableAssessment);
            return (first / 6);
        }
        else return 0;
    }

    @Override
    public String toString() {
        return "Stage{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", pessimisticAssessment=" + pessimisticAssessment +
                ", probableAssessment=" + probableAssessment +
                ", optimisticAssessment=" + optimisticAssessment +
                ", project=" + project +
                '}';
    }
}
