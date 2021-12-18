package Controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;


@WebServlet("/checkResultService")
public class checkResultService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String mb_id = request.getParameter("id");
		String check_name = request.getParameter("name");
		int check_seq = Integer.parseInt(request.getParameter("seq"));
		String result = request.getParameter("result");
		
		System.out.println(check_name);
		
		DAO dao = new DAO();
		dao.InsertCheck(check_seq, result, mb_id);
		
		String url = null;
		if(result.equals("y")) {
			url = "checkResult.jsp?name="+URLEncoder.encode(check_name, "euc-kr") ;
			System.out.println(url);
		}else {
			url ="main.jsp";
		}
		response.setCharacterEncoding("EUC-KR");
		response.sendRedirect(url);
	}

}
