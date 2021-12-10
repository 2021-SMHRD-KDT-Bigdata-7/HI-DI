package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ChecklistVO;
import Model.DAO;


@WebServlet("/SelectChecklistService")
public class SelectChecklistService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파라미터 수집
		String check_name = request.getParameter("check_name");
		
		DAO dao = new DAO();
		ChecklistVO cvo = dao.SelectChecklist(check_name);
		
		request.setAttribute("cvo", cvo);
		
		//Forward 방식
		RequestDispatcher rd = request.getRequestDispatcher("test2.jsp");
		
		//출발
		rd.forward(request, response);
	}
	
	
}
