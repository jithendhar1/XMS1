package srv;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AddProfile;
import DAO.ProfileDAO;

@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve parameters from the request
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		AddProfile profile = new AddProfile();
		profile.setFirstName(firstname);
		profile.setLastName(lastname);
		profile.setEmail(email);
		profile.setUsername(username);
		profile.setAddress(address);
		profile.setPhoneNumber(phone);

		ProfileDAO profiledao = new ProfileDAO();
		boolean statusMessage = profiledao.updateProfileDetails(profile);

		// Forward the status message to the JSP page
		RequestDispatcher rd = request.getRequestDispatcher("profile.jsp?message=" + statusMessage);
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
