package srv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BankdetailsDAO;
import DAO.CustomerDAO;
import utility.DBUtil;

@WebServlet("/WithdrawalStatus")
public class WithdrawalStatus extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commonLogic(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        commonLogic(request, response);
    }

    private void commonLogic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = "Adding fail";

        String userID = request.getParameter("userID");
        String Amount = request.getParameter("amount");
        String depositeid = request.getParameter("WithdrawalTransactionID");
        String ApprovedUsername = request.getParameter("username");
        PreparedStatement ps = null;
        PreparedStatement psUpdateBank = null;
        PreparedStatement ps_UpdateBank = null;

        String openamount = BankdetailsDAO.getUserOpenAmount(userID);

        Connection conn = null; // Declare Connection outside try block

        try {
            conn = DBUtil.provideConnection(); // Assign connection here

            psUpdateBank = conn.prepareStatement("INSERT INTO transaction (userID ,openamount ,closingamount ,transactiondate,Approvedby ,Transactiontype,status,TransactionID,Amount) VALUES(?,?,?,?,?,'Withdrawal',1,?,?)");
            double tempopen = Double.parseDouble(openamount);
            double tempamoyunt = Double.parseDouble(Amount);
            double closeamot = tempopen - tempamoyunt;
            String Closingamount = String.valueOf(closeamot);
            SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date currentDate = new Date();
            String formattedDateTime = dateTimeFormat.format(currentDate);

            psUpdateBank.setString(1, userID);
            psUpdateBank.setString(2, openamount);
            psUpdateBank.setString(3, Closingamount);
            psUpdateBank.setString(4, formattedDateTime);
            psUpdateBank.setString(5, ApprovedUsername);
            psUpdateBank.setString(6, depositeid);
            psUpdateBank.setString(7, Amount);

            int k1 = psUpdateBank.executeUpdate();
            if (k1 > 0) {
                ps_UpdateBank = conn.prepareStatement("UPDATE customeraccdetails SET Amount = Amount - ? WHERE userID = ?");
                ps_UpdateBank.setString(1, Amount);
                ps_UpdateBank.setString(2, userID);

                int updateResult = ps_UpdateBank.executeUpdate();

                if (updateResult > 0) {
                    status = "Adding completed";
                    List<String> userInfo = CustomerDAO.getUserInfoByUsername(userID);
                    String email = userInfo.get(0);
                    String username = userInfo.get(1);

                    // Assuming WithdrawalApprovalMailLink is a class with a static method sendLinkEmail
                    WithdrawalApprovalMailLink.sendLinkEmail(email, userID, username);

                    request.getSession().setAttribute("email", email);
                    response.sendRedirect("withdrawal_user.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (psUpdateBank != null) {
                    psUpdateBank.close();
                }
                if (ps_UpdateBank != null) {
                    ps_UpdateBank.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
