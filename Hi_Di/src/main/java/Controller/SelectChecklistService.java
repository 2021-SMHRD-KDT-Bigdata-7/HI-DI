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
import Model.MemberVO;


@WebServlet("/SelectChecklistService")
public class SelectChecklistService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//DAO객체 생성
		DAO dao = new DAO();
		
		//DAO가 가진 selectChecklist() 사용
//		ArrayList<ChecklistVO> checklist = dao.SelectChecklist();
		//checklist의 길이 확인
//		System.out.println(checklist.size());
		ArrayList<ChecklistVO> checklist = dao.SelectChecklist();
		if(checklist != null) {
			System.out.println("성공");
			//Forward 방식
			RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
			
			//출발
			rd.forward(request, response);
		}else {
			System.out.println("실패");
			response.sendRedirect("main.jsp");
		}
		
	}

}
