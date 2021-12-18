package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.DAO;
import Model.MemberVO;


@WebServlet("/InsertPoll")
public class InsertPoll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("vo");
		
		DAO dao = new DAO();
		
		int item_seq = Integer.parseInt(request.getParameter("item_seq"));
		String answer = request.getParameter("answer");
		
		int cnt = dao.InsertPoll(item_seq, answer, vo.getMb_id());
		
		if (cnt > 0) {
			System.out.println("설문 등록 성공!");
			
		} else {
			System.out.println("설문 등록 실패!");
		}
		
		response.sendRedirect("main.jsp");
				
	}

}
