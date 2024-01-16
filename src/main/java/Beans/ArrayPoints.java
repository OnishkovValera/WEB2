package Beans;

import javax.ejb.Stateful;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.ArrayList;

@Stateful
@SessionScoped
public class ArrayPoints implements Serializable {
    private ArrayList<Point> points = new ArrayList<>();

    public ArrayList<Point> getPoints() {
        return points;
    }

    public void setPoints(ArrayList<Point> points) {
        this.points = points;
    }
    public void addPoint(Point point){
        points.add(point);
    }
}
