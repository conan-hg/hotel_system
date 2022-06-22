package controllers.booking;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Booking;
import models.Guest;
import models.validators.BookingValidator;
import utils.DBUtil;

/**
 * Servlet implementation class BookingConfirmServlet
 */
@WebServlet("/booking/confirm")
public class BookingConfirmServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public BookingConfirmServlet() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
   *      response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String _token = request.getParameter("_token");
    if (_token != null || _token.equals(request.getSession().getId())) {
      EntityManager em = DBUtil.createEntityManager();

      Booking b = new Booking();

      b.setGuest((Guest) request.getSession().getAttribute("login_guest"));
      b.setRoom_type(request.getParameter("room_type"));
      b.setAdult_people(request.getParameter("adult_people"));
      b.setChild_people(request.getParameter("child_people"));
      b.setCheck_in_date(Date.valueOf(request.getParameter("check_in_date")));
      b.setCheck_out_date(Date.valueOf(request.getParameter("check_out_date")));
      b.setContent(request.getParameter("content"));
      b.setDelete_flag(0);

      Timestamp currentTime = new Timestamp(System.currentTimeMillis());
      b.setCreated_at(currentTime);
      b.setUpdated_at(currentTime);

      request.getSession().setAttribute("login_guest", (Guest) request.getSession().getAttribute("login_guest"));
      request.getSession().setAttribute("room_type", request.getParameter("room_type"));
      request.getSession().setAttribute("adult_people", request.getParameter("adult_people"));
      request.getSession().setAttribute("child_people", request.getParameter("child_people"));
      request.getSession().setAttribute("check_in_date", request.getParameter("check_in_date"));
      request.getSession().setAttribute("check_out_date", request.getParameter("check_out_date"));
      request.getSession().setAttribute("content", request.getParameter("content"));

      int room_type = Integer.parseInt(request.getParameter("room_type"));

      String adult_people = request.getParameter("adult_people");
      int adult_price = 0;
      if (!adult_people.equals("")) {
        int adult_people_int = Integer.valueOf(adult_people);
        adult_price = (adult_people_int - 1) * (7000 * room_type);
      }

      String child_people = request.getParameter("child_people");
      int child_price = 0;
      if (!child_people.equals("")) {
        int child_people_int = Integer.valueOf(child_people);
        child_price = (child_people_int - 1) * (4000 * room_type);
      }

      Date dateTo = null;
      Date dateFrom = null;

      dateFrom = Date.valueOf(request.getParameter("check_in_date"));
      dateTo = Date.valueOf(request.getParameter("check_out_date"));

      long dateTimeTo = dateTo.getTime();
      long dateTimeFrom = dateFrom.getTime();
      int dayDiff = (int) (dateTimeTo - dateTimeFrom) / (1000 * 60 * 60 * 24);

      int booking_price = 0;
      booking_price = (adult_price + child_price) * dayDiff;

      request.setAttribute("booking_price", booking_price);

      List<String> errors = BookingValidator.validate(b);
      if (errors.size() > 0) {
        em.close();

        request.setAttribute("_toekn", request.getSession().getId());
        request.setAttribute("booking", b);
        request.setAttribute("errors", errors);
        request.getSession().removeAttribute("flush");

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/booking/new.jsp");
        rd.forward(request, response);
      } else {

        if (request.getSession().getAttribute("flush") != null) {
          request.setAttribute("flush", request.getSession().getAttribute("flush"));
          request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/booking/confirm.jsp");
        rd.forward(request, response);
      }

    }
  }

}
