package Servlets;



import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/AreaChecker")
public class AreaCheckerServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        if (session.getAttribute("userId") == null) {
            session.setMaxInactiveInterval(360000);
            session.setAttribute("array", "");
        }
        Gson json = new Gson();


    }
}
