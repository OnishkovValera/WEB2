package Validator;

import jakarta.servlet.http.HttpServlet;

public class Validator {
    HttpServlet request;

    public Validator(HttpServlet request) {
        this.request = request;
    }

    private boolean validateX(float x){
        return true;
    }

    private boolean validateY(float y){
        return true;
    }

    private boolean validateR(float r){
        return true;
    }

}
