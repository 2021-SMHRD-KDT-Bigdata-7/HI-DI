package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.DAO;
import Model.DiseaseVO;

/**
 * Servlet implementation class diseaseSearch
 */
@WebServlet("/diseaseSearch")
public class diseaseSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int dis_seq=Integer.parseInt(request.getParameter("dis_seq"));
//	String dis_code=request.getParameter("dis_code");
		String dis_name=request.getParameter("searchText");
//		String dis_content=request.getParameter("dis_content");
//		String dis_symptom=request.getParameter("dis_symptom");
//		String dis_dpt=request.getParameter("dis_dpt");
//		String dis_tag=null;
//		String mB_ID=null;
//		String dis_pic1=null;
		
		DAO dao = new DAO();
		
		DiseaseVO dvo= dao.SelectDiseaseName(dis_name);
		System.out.println(dis_name);
		if(dvo != null) {
			System.out.println("성공");
			request.setAttribute("dvo", dvo);
			RequestDispatcher rd = request.getRequestDispatcher("diseaseSearch.jsp");
			rd.forward(request, response);
			
			
			
		}else {
			System.out.println(dis_name+"실패");
			System.out.println("실패");
		}
			
	}
}
