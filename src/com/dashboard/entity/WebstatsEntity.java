package com.dashboard.entity;

import javax.persistence.*;

/**
 * Created by phu on 10/28/14.
 */
@Entity
@Table(name = "Webstats", schema = "", catalog = "")
public class WebstatsEntity {
    private int id;
    private Integer visitors;
    private Integer hotleads;

    @Id
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "visitors")
    public Integer getVisitors() {
        return visitors;
    }

    public void setVisitors(Integer visitors) {
        this.visitors = visitors;
    }

    @Basic
    @Column(name = "hotleads")
    public Integer getHotleads() {
        return hotleads;
    }

    public void setHotleads(Integer hotleads) {
        this.hotleads = hotleads;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        WebstatsEntity that = (WebstatsEntity) o;

        if (id != that.id) return false;
        if (hotleads != null ? !hotleads.equals(that.hotleads) : that.hotleads != null) return false;
        if (visitors != null ? !visitors.equals(that.visitors) : that.visitors != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (visitors != null ? visitors.hashCode() : 0);
        result = 31 * result + (hotleads != null ? hotleads.hashCode() : 0);
        return result;
    }
}
