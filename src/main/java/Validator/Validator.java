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

    public boolean validateData(){
        if(req.getParameter("X").length() > 20 || req.getParameter("Y").length()>20 || req.getParameter("radius").length() > 20){
            return false;
        }
        return validateX(req.getParameter("X")) & validateY(req.getParameter("Y")) & validateR(req.getParameter("radius"));
    }

    public boolean validateX(String xString) {
        if (Objects.isNull(xString) || xString.isEmpty()) {
            return false;
        }
        try {
            Double x = Double.parseDouble(xString);
            this.x = x;
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
            Double y = Double.parseDouble(yString);
            this.y = y;
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
            Integer r = Integer.parseInt(rString);
            this.r = r;
            return r >= 1 && r <= 5;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
