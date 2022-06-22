		package controllers.booking;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

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
 * Servlet implementation class BookingCreateServlet
 */
@WebServlet("/booking/create")
public class BookingCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _token = request.getParameter("_token");
		if(_token != null || _token.equals(request.getSession().getId())) {
			EntityManager em = DBUtil.createEntityManager();

			Booking b = new Booking();

			b.setGuest((Guest)request.getSession().getAttribute("login_guest"));

			b.setRoom_type(request.getSession().getAttribute("room_type").toString());

			b.setAdult_people(request.getSession().getAttribute("adult_people").toString());
			b.setChild_people(request.getSession().getAttribute("child_people").toString());


			b.setCheck_in_date(Date.valueOf(request.getSession().getAttribute("check_in_date").toString()));
			b.setCheck_out_date(Date.valueOf(request.getSession().getAttribute("check_out_date").toString()));


			b.setContent(request.getSession().getAttribute("content").toString());

			b.setDelete_flag(0);

			Timestamp currentTime = new Timestamp(System.currentTimeMillis());
			b.setCreated_at(currentTime);
			b.setUpdated_at(currentTime);


			em.getTransaction().begin();
			em.persist(b);
			em.getTransaction().commit();
			em.close();

			request.getSession().removeAttribute("login_guest");
			request.getSession().removeAttribute("room_type");
			request.getSession().removeAttribute("adult_people");
			request.getSession().removeAttribute("child_people");
			request.getSession().removeAttribute("check_in_date");
			request.getSession().removeAttribute("check_out_date");
			request.getSession().removeAttribute("content");

			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/booking/finish.jsp");
	        rd.forward(request, response);


		}


	}

}
