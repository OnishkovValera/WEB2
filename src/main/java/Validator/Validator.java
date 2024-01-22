package Validator;


import jakarta.servlet.http.HttpServletRequest;

import java.util.Objects;

public class Validator {
    private HttpServletRequest req;
    private Double x;
    private Double y;
    private Integer r;
    public Validator(HttpServletRequest req){
        this.req = req;
    }


    public boolean checkFormat(){
        return !req.getParameter("X").isEmpty() && !req.getParameter("Y").isEmpty() && !req.getParameter("radius").isEmpty();
    }

    public boolean validateX(String xString) {
        if (Objects.isNull(xString) || xString.isEmpty()) {
            return false;
        }
        try {
            this.x = Double.parseDouble(xString);
            return x >= -3 && x <= 5;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public boolean validateY(String yString) {
        if (Objects.isNull(yString) || yString.isEmpty()) {
            return false;
        }
        try {
            this.y = Double.parseDouble(yString);
            return y >= -3 && y <= 5;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public boolean validateR(String rString) {
        if (Objects.isNull(rString) || rString.isEmpty()) {
            return false;
        }
        try {
            this.r = Integer.parseInt(rString);
            return r >= 1 && r <= 5;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
