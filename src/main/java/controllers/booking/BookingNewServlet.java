package controllers.booking;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Booking;

/**
 * Servlet implementation class BookingNewServlet
 */
@WebServlet("/booking/new")
public class BookingNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("_token", request.getSession().getId());

		Booking b = new Booking();


		long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);


		b.setRoom_type("0");
		b.setCheck_in_date(date);
		b.setCheck_out_date(date);
		request.setAttribute("booking", b);

		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/booking/new.jsp");
		rd.forward(request, response);
	}

}












