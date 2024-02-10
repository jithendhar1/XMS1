package srv;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AddProfile;
import DAO.ProfileDAO;

@WebServlet("/ProfileDetails")
public class ProfileDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve the property ID from the request parameter
		String username = request.getParameter("username");
		
		ProfileDAO profiledao = new ProfileDAO();
		AddProfile profiledetails = profiledao.getProfileByUserName(username);

		// Convert the property details to JSON format
		String jsonResponse = convertPropertyDetailsToJson(profiledetails);
		// Set the content type and write the JSON response
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonResponse);
		out.flush();
	}

	private String convertPropertyDetailsToJson(AddProfile profileDetails) {
		// Convert property details to JSON format
		// You can use a JSON library like Jackson or Gson for more complex objects
		// For simplicity, a basic JSON string is created here
		return "{" +
        "\"id\":\"" + profileDetails.getId() + "\"," +
        "\"firstName\":\"" + profileDetails.getFirstName() + "\"," +
        "\"lastName\":\"" + profileDetails.getLastName() + "\"," +
        "\"email\":\"" + profileDetails.getEmail() + "\"," +
        "\"userName\":\"" + profileDetails.getUsername() + "\"," +
        "\"phone\":\"" + profileDetails.getPhoneNumber() + "\"" +
        "}";

	}
}
