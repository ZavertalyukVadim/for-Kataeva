package com.entities;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "projects")
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "project")
    @JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
    private List<Stage> stages = new ArrayList<>();

    public Project() {
    }

    public Project( String name, String description) {
        this.name = name;
        this.description = description;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
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

    public List<Stage> getStages() {
        return stages;
    }

    public void addStage(Stage stage) {
        this.stages.add(stage);
    }

    public double getBadProbability(){
        double summE = 0;
        double sko = 0;

        for (Stage stage:stages){
            summE+=stage.getBadProbability();
            double forSko = stage.getPessimisticAssessment()-stage.getOptimisticAssessment();
            sko += (forSko/6)*(forSko/6);
        }

        double skoTotal = Math.sqrt(sko);

        return summE + 2 * skoTotal;
    }
}
