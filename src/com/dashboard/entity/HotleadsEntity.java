package com.dashboard.entity;

import javax.persistence.*;

/**
 * Created by phu on 10/28/14.
 */
@Entity
@Table(name = "Hotleads", schema = "", catalog = "")
public class HotleadsEntity {
    private int propertyId;
    private Integer number;

    @Id
    @Column(name = "property_id")
    public int getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }

    @Basic
    @Column(name = "number")
    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        HotleadsEntity that = (HotleadsEntity) o;

        if (propertyId != that.propertyId) return false;
        if (number != null ? !number.equals(that.number) : that.number != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = propertyId;
        result = 31 * result + (number != null ? number.hashCode() : 0);
        return result;
    }
}
