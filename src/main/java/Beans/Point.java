package Beans;

import Validator.HitStatus;

import javax.ejb.Stateful;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
@Stateful
@SessionScoped
public class Point implements Serializable {
    private Double x;
    private Double y;
    private Integer r;
    private HitStatus status;
    private String time;

    private long scriptTime;

    public Point(Double x, Double y, Integer r, HitStatus status, String time, long scriptTime) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.status = status;
        this.time = time;
        this.scriptTime = scriptTime;
    }
    public Point() {

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

    public Integer getR() {
        return r;
    }

    public void setR(Integer r) {
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
    public long getScriptTime() {
        return scriptTime;
    }

    public void setScriptTime(long scriptTime) {
        this.scriptTime = scriptTime;
    }
}
