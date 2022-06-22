package controllers.booking;

import java.io.IOException;
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
import utils.DBUtil;

/**
 * Servlet implementation class BookingIndexServlet
 */
@WebServlet("/booking/index")
public class BookingIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntityManager em = DBUtil.createEntityManager();

		Guest login_guest = (Guest)request.getSession().getAttribute("login_guest");


		int page;
		try{
			page = Integer.parseInt(request.getParameter("page"));
		} catch(Exception e) {
			page = 1;
		}

		if(login_guest.getAdmin_flag() == 0){
			List<Booking> booking = em.createNamedQuery("getAllbooking", Booking.class)
					.setFirstResult(15 * (page -1))
					.setMaxResults(15)
				    .getResultList();

			request.setAttribute("booking", booking);
			request.setAttribute("boss", 1);

		} else{
			List<Booking> booking = em.createNamedQuery("getMyAllbooking", Booking.class)
					.setParameter("guest", login_guest)
					.setFirstResult(15 * (page -1))
					.setMaxResults(15)
				    .getResultList();

			request.setAttribute("booking", booking);
		}

		em.close();

		request.setAttribute("page", page);

		if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/booking/index.jsp");
        rd.forward(request, response);


	}

}


























