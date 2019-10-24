package com.hyn.selectcourse.model;

public class Course {
    private Long id;
    private String name;
    private String required;
    private String teaName;
    private String credit;
    private String time;
    private String place;
    private String startWeek;
    private String endWeek;
    private String stuCount;
    private Long chooseCount;

    public Long getChooseCount() {
        return chooseCount;
    }

    public void setChooseCount(Long chooseCount) {
        this.chooseCount = chooseCount;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRequired() {
        return required;
    }

    public void setRequired(String required) {
        this.required = required;
    }

    public String getTeaName() {
        return teaName;
    }

    public void setTeaName(String teaName) {
        this.teaName = teaName;
    }

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getStartWeek() {
        return startWeek;
    }

    public void setStartWeek(String startWeek) {
        this.startWeek = startWeek;
    }

    public String getEndWeek() {
        return endWeek;
    }

    public void setEndWeek(String endWeek) {
        this.endWeek = endWeek;
    }

    public String getStuCount() {
        return stuCount;
    }

    public void setStuCount(String stuCount) {
        this.stuCount = stuCount;
    }
}
