package Servlets;



import Beans.ArrayPoints;
import Beans.Point;
import Validator.HitStatus;
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
public class AreaCheckerServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            long timer = System.nanoTime();
            ArrayPoints points;
            HttpSession session = req.getSession();

            Double x = Double.parseDouble(req.getParameter("X"));
            Double y = Double.parseDouble(req.getParameter("Y"));
            Integer r = Integer.parseInt(req.getParameter("radius"));
            if (session.getAttribute("array") == null) {
                session.setMaxInactiveInterval(360000);
                points = new ArrayPoints();
                session.setAttribute("array", points);
            }else{
                points = (ArrayPoints) session.getAttribute("array");
            }


            HitStatus status = (HitStatus) req.getAttribute("status");
            if(status == null){
                status = isHit(x, y, r) ? HIT : MISS;
            }else{
                status = NOT_VALID;
            }
            System.out.println(status);

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
