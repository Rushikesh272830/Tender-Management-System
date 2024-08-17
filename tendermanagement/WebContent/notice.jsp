<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,com.hit.utility.DBUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notice Board</title>
</head>
<body>

    <div class="marquee" style="border:2px #26b0b0 solid;background-color:white">
        <h4 style="background-color:#26b0b0; margin-top:-1.8px; padding: 5px;">
            <i class="glyphicon glyphicon-volume-up"></i>
            &nbsp; Latest Updates and Notice
        </h4>
        <div class="marquee-content" style="padding:10px;font-weight: bold;font-size: 1.1em">
            <marquee onmouseover="stop()" onmouseout="start()" direction="up" scrollamount="5" height="380px">
                <!-- marquee height and stop start characteristics-->
                <!-- Notice Content-->
                <%
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        con = DBUtil.provideConnection();
                        if (con != null) {
                            ps = con.prepareStatement("SELECT * FROM notice");
                            rs = ps.executeQuery();
                            while (rs.next()) {
                                String noticeTitle = rs.getString("title");
                                String noticeInfo = rs.getString("info");
                %>
                <p style="font-weight: bold;">
                    <span class="glyphicon glyphicon-hand-right" style="color: #3743fa;">
                        <strong style="color:red"><%= noticeTitle %></strong><br><br><%= noticeInfo %>
                    </span>
                </p>
                <hr/>
                <%
                            }
                        } else {
                            out.println("Failed to establish a database connection.");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("There was an error processing your request: " + e.getMessage());
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (ps != null) ps.close();
                            if (con != null) con.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                %>
            </marquee><!-- End of marquee-->

            <!-- End of Notice Section -->

        </div>  <!-- End of marquee-content -->
    </div> <!-- End of marquee class -->

</body>
</html>
