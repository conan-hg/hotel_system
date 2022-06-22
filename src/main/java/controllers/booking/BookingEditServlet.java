package controllers.booking;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Booking;
import models.Guest;
import utils.DBUtil;

/**
 * Servlet implementation class BookingEditServlet
 */
@WebServlet("/booking/edit")
public class BookingEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = DBUtil.createEntityManager();

		Booking b = em.find(Booking.class, Integer.parseInt(request.getParameter("id")));

		em.close();

		Guest login_guest = (Guest)request.getSession().getAttribute("login_guest");
		if(b != null && (login_guest.getId() == b.getGuest().getId() || login_guest.getAdmin_flag() == 0)) {
			request.setAttribute("booking", b);
			request.setAttribute("_token", request.getSession().getId());
			request.getSession().setAttribute("booking_id", b.getId());
		}

		if(login_guest.getAdmin_flag() == 0) {
			request.setAttribute("boss", 1);
		}

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/booking/edit.jsp");
        rd.forward(request, response);
	}

}















