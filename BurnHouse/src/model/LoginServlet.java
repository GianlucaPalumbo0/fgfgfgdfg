package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/burn_house");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "utente";
	
	
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("email");
		String pwd=request.getParameter("password");
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Utente utente = new Utente();
		String selectSQL = "SELECT * FROM " + LoginServlet.TABLE_NAME + " WHERE email = ? AND password = ?";
		
		try {
			
			PrintWriter out=response.getWriter();
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, pwd);

			ResultSet rs = preparedStatement.executeQuery();

			if(rs.next()) {
				utente.setEmail(rs.getString("email"));
				utente.setPwd(rs.getString("password"));
				utente.setName(rs.getString("nome"));
				utente.setSurname(rs.getString("cognome"));
				utente.setBDate(rs.getString("data_nascita"));
				utente.setType(rs.getString("tipo"));
				if(utente.getType().equals("admin")) {
					request.getSession().setAttribute("adminFilter", true);
				}
				else {
					request.getSession().setAttribute("adminFilter", false);
				}
				RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
				rd.forward(request, response);
			}
			else {
				out.println("<font color=red size=18>Email o password errate!<br>>");
				out.println("<a href=Login.jsp> Riprova");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
