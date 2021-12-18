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
		
		int item_seq1 = Integer.parseInt(request.getParameter("item_seq1"));
		int item_seq2 = Integer.parseInt(request.getParameter("item_seq2"));
		int item_seq3 = Integer.parseInt(request.getParameter("item_seq3"));
		int item_seq4 = Integer.parseInt(request.getParameter("item_seq4"));
		int item_seq5 = Integer.parseInt(request.getParameter("item_seq5"));
		int item_seq6 = Integer.parseInt(request.getParameter("item_seq6"));
		String answer = request.getParameter("answer");
		
		dao.InsertPoll(item_seq1, answer, vo.getMb_id());
		dao.InsertPoll(item_seq2, answer, vo.getMb_id());
		dao.InsertPoll(item_seq3, answer, vo.getMb_id());
		dao.InsertPoll(item_seq4, answer, vo.getMb_id());
		dao.InsertPoll(item_seq5, answer, vo.getMb_id());
		dao.InsertPoll(item_seq6, answer, vo.getMb_id());
		
		response.sendRedirect("main.jsp");
				
	}

}
