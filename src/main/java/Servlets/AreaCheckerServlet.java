package Servlets;



import Beans.ArrayPoints;
import Beans.Point;
import Validator.HitStatus;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;


import static Validator.HitStatus.*;


@WebServlet("/AreaChecker")
@ServletSecurity(httpMethodConstraints = @HttpMethodConstraint(value = "GET", emptyRoleSemantic = ServletSecurity.EmptyRoleSemantic.DENY))
public class AreaCheckerServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            long timer = System.nanoTime();
            Double x = (double) 0;
            Double y = (double) 0;
            Integer r = 0;
            ArrayPoints points;
            HttpSession session = req.getSession();
            HitStatus status = (HitStatus) req.getAttribute("status");
            if(status == null){
                x = Double.parseDouble(req.getParameter("X"));
                y = Double.parseDouble(req.getParameter("Y"));
                r = Integer.parseInt(req.getParameter("radius"));
                status = isHit(x, y, r) ? HIT : MISS;
            }else{
                status = NOT_VALID;
            }

            if (session.getAttribute("array") == null) {
                session.setMaxInactiveInterval(360000);
                points = new ArrayPoints();
                session.setAttribute("array", points);
            } else {
                points = (ArrayPoints) session.getAttribute("array");
            }


            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            String currentTime = formatter.format(LocalDateTime.now(ZoneOffset.UTC));
            long scriptTime = (long) ((System.nanoTime() - timer) * 0.001);
            points.addPoint(new Point(x,y,r,status,currentTime, scriptTime));
            req.getRequestDispatcher("pages/result.jsp").forward(req, resp);

        }catch (Exception exception){
            exception.printStackTrace();
            ControllerServlet.sendError(resp);
        }
    }

    public boolean isHit(Double x, Double y, Integer r) {
        if(x >= 0 & y <= 0){
            return x <= r & Math.abs(y) <= (double) r/2;
        }else if(x >= 0 & y >= 0){
            return false;
        }else if(x <= 0 & y <= 0){
            return x*x + y*y <= (double) (r * r)/4;
        }else if(x <= 0 & y >= 0){
            return y <= 2 * x + r;
        }
        return false;
    }
}
