package Beans;

import Validator.HitStatus;

import java.io.Serializable;

public class Point implements Serializable {
    private Double x;
    private Double y;
    private Double r;
    private HitStatus status;
    private String time;

    public Point(Double x, Double y, Double r, HitStatus status, String time) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.status = status;
        this.time = time;
    }

    public Double getX() {
        return x;
    }

    public void setX(Double x) {
        this.x = x;
    }

    public Double getY() {
        return y;
    }

    public void setY(Double y) {
        this.y = y;
    }

    public Double getR() {
        return r;
    }

    public void setR(Double r) {
        this.r = r;
    }

    public HitStatus getStatus() {
        return status;
    }

    public void setStatus(HitStatus status) {
        this.status = status;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
