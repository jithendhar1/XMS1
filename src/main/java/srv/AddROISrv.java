package srv;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CustomerDAO;
import Imp.ROIServiceImpl;

@WebServlet("/AddROISrv")
public class AddROISrv extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    	
        String status = "Add Failed!";
        String userID = request.getParameter("userID");
        String TransactionID = request.getParameter("TransactionID");
        String Approvedby = request.getParameter("username");
        String ROIAmount = request.getParameter("ROIAmount");
        
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// You can adjust the format as needed
				 Date currentDate = new Date();
				 String formattedDateTime = dateTimeFormat.format(currentDate);
		
      
        
        ROIServiceImpl add = new ROIServiceImpl();
        status= add.addV(Approvedby, ROIAmount, formattedDateTime,  TransactionID);

	
    	   RequestDispatcher rd = request.getRequestDispatcher("roi_user.jsp?message=" + status);
    rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}








