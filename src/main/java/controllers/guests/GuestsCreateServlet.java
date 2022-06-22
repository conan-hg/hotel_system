package controllers.guests;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Guest;
import models.validators.GuestValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class GuestsCreateServlet
 */
@WebServlet("/guests/create")
public class GuestsCreateServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public GuestsCreateServlet() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String _token = request.getParameter("_token");
    if (_token != null || _token.equals(request.getSession().getId())) {
      EntityManager em = DBUtil.createEntityManager();

      Guest g = new Guest();

      g.setName(request.getParameter("name"));
      g.setPassword(
          EncryptUtil.getPasswordEncrypt(
              request.getParameter("password"),
              (String) this.getServletContext().getAttribute("pepper")));

      g.setPhone(request.getParameter("phone"));
      g.setMail(request.getParameter("mail"));

      Timestamp currentTime = new Timestamp(System.currentTimeMillis());
      g.setCreated_at(currentTime);
      g.setUpdated_at(currentTime);

      g.setAdmin_flag(1);

      List<String> errors = GuestValidator.validate(g, true);
      if (errors.size() > 0) {
        em.close();

        request.setAttribute("_token", request.getSession().getId());
        request.setAttribute("guest", g);
        request.setAttribute("errors", errors);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/guests/new.jsp");
        rd.forward(request, response);
      } else {
        em.getTransaction().begin();
        em.persist(g);
        em.getTransaction().commit();
        em.close();

        request.getSession().setAttribute("flush", "登録を完了致しました。");
        response.sendRedirect(request.getContextPath() + "/new/or/login");

      }

    }

  }
}
