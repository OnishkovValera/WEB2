package Servlets;

import Validator.Validator;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static Validator.HitStatus.NOT_VALID;


@WebServlet("/Controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Validator val = new Validator(req);
        if(!(val.checkFormat() & val.validateData())) {
            System.out.println(val.checkFormat() + " " + val.validateData());
            req.setAttribute("status", NOT_VALID);
        }
        req.getRequestDispatcher("./AreaChecker").forward(req, resp);
    }

    public static void sendError(HttpServletResponse resp) throws IOException {
        Gson json = new Gson();
        Map<String, Object> jsonResponse = new HashMap<>() {{
            put("ERROR", "Data is incorrect");
        }};

        resp.setContentType("application/json");
        resp.getWriter().write(json.toJson(jsonResponse));
        resp.setStatus(422);
    }
}
