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

/**
 * Servlet implementation class SelectAllService
 */
@WebServlet("/SelectAllService")
public class SelectAllService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		System.out.println("요청이 들어옴");
		//DAO객체 생성
		DAO dao = new DAO();
		
		//DAO가 가진 selectChecklist() 사용
//		ArrayList<ChecklistVO> checklist = dao.SelectChecklist();
		//checklist의 길이 확인
//		System.out.println(checklist.size());
		ArrayList<ChecklistVO> checklist = dao.SelectAll();
		System.out.println("질의 결과를 받음");
		
		// request영역에 Attribute를 추가
		// request의 주머니에 데이터를 담아준다.
		request.setAttribute("checklist", checklist);
		
		//Forward 방식
		RequestDispatcher rd = request.getRequestDispatcher("checklist.jsp");
		
		//출발
		rd.forward(request, response);
		
	
	}

}
