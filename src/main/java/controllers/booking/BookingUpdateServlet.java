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
import models.validators.BookingValidator;
import utils.DBUtil;

/**
 * Servlet implementation class BookingUpdateServlet
 */
@WebServlet("/booking/update")
public class BookingUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _token = request.getParameter("_token");
		if(_token != null && _token.equals(request.getSession().getId())) {
			EntityManager em = DBUtil.createEntityManager();

			Booking b = em.find(Booking.class, (Integer)(request.getSession().getAttribute("booking_id")));

			b.setRoom_type(request.getParameter("room_type"));

			b.setAdult_people(request.getParameter("adult_people"));
			b.setChild_people(request.getParameter("child_people"));


			b.setCheck_in_date(Date.valueOf(request.getParameter("check_in_date")));
			b.setCheck_out_date(Date.valueOf(request.getParameter("check_out_date")));


			b.setContent(request.getParameter("content"));
			Timestamp currentTime = new Timestamp(System.currentTimeMillis());
			b.setUpdated_at(currentTime);


			List<String> errors = BookingValidator.validate(b);
			if(errors.size() > 0) {
				em.close();

				request.setAttribute("_token", request.getSession().getId());
				request.setAttribute("booking", b);
				request.setAttribute("errors", errors);


				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/booking/edit.jsp");
		        rd.forward(request, response);
			} else {
				em.getTransaction().begin();
				em.getTransaction().commit();
				em.close();
				request.getSession().setAttribute("flush", "予約内容を変更致しました");

				request.getSession().removeAttribute("booking_id");

				response.sendRedirect(request.getContextPath() + "/booking/index");
			}
		}
	}

}






















