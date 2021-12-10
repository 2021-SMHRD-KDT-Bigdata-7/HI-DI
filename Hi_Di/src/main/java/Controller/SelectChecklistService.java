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

		
		
		//DAO��ü ����
		DAO dao = new DAO();
		
		//DAO�� ���� selectChecklist() ���
//		ArrayList<ChecklistVO> checklist = dao.SelectChecklist();
		//checklist�� ���� Ȯ��
//		System.out.println(checklist.size());
		ArrayList<ChecklistVO> checklist = dao.SelectChecklist();
		
		// request������ Attribute�� �߰�
		// request�� �ָӴϿ� �����͸� ����ش�.
		request.setAttribute("checklist", checklist);
		
		//Forward ���
		RequestDispatcher rd = request.getRequestDispatcher("test.jsp");
		
		//���
		rd.forward(request, response);
		
	
	}

}
