package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;

public class DAO {

	// ��ü ����1
	MemberVO vo = null;
	DiseaseVO dvo = null;
	ArrayList<DiseaseVO> disease = new ArrayList<DiseaseVO>();
	ChecklistVO cvo = null;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	ArrayList<ChecklistVO> checklist = new ArrayList<ChecklistVO>();
	FoodVO fvo = null;
	ArrayList<HospitalVO> hoslist = new ArrayList<HospitalVO>();
	RawVO rvo = null;
	ArrayList<RawVO> rawlist = new ArrayList<RawVO>();
	

	// DB����
	public void connection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@172.30.1.21:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	// ===================================================================

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}

	}
	// ===================================================================

	// ȸ������
	public int Join(String mb_id, String mb_pw, String mb_email, String mb_name, String mb_gender, String mb_phone,
			String mb_birthdate, String mb_addr) {

		// try��
		try {
			connection(); // DB����

			String sql = "insert into t_member values ( ?, ?, ?, ?, ?, ?, ?, ?, sysdate, 'y', 0 )"; // insert�� ���Գ�¥,
																									// �����ڿ���, ����Ʈ�� �̸�����
			psmt = conn.prepareStatement(sql);

			// ���ε� ���� ä���
			psmt.setString(1, mb_id);
			psmt.setString(2, mb_pw);
			psmt.setString(3, mb_email);
			psmt.setString(4, mb_name);
			psmt.setString(5, mb_gender);
			psmt.setString(6, mb_phone);
			psmt.setString(7, mb_birthdate);
			psmt.setString(8, mb_addr);

			cnt = psmt.executeUpdate(); // insert�� �̹Ƿ� executeUpdate() --> return int

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;
	}
	// ===================================================================

	// �α���
	public MemberVO Login(String mb_id, String mb_pw) {
		try {
			connection();

			String sql = "select * from t_member where mb_id=? and mb_pw=?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, mb_id);
			psmt.setString(2, mb_pw);

			rs = psmt.executeQuery(); // select�� �̹Ƿ� executeQuery() --> return ResultSet

			if (rs.next() == true) {
				// ���� �޾ƿ���
				String userId = rs.getString(1);
				String userPw = rs.getString(2);
				String userEmail = rs.getString(3);
				String userName = rs.getString(4);
				String userGender = rs.getString(5);
				String userPhone = rs.getString(6);
				String userBirthdate = rs.getString(7);
				String userAddr = rs.getString(8);
				String userJoindate = rs.getString(9);
				String userAadmin_yn = rs.getString(10);
				int userPoint = rs.getInt(11);

				// vo����
				vo = new MemberVO(userId, userPw, userEmail, userName, userGender, userPhone, userBirthdate, userAddr,
						userJoindate, userAadmin_yn, userPoint);
			}
		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close();
		}
		return vo;
	}
	// ===================================================================

	// ��� üũ����Ʈ �ҷ�����
	public ArrayList<ChecklistVO> SelectAll() {
		try {
			connection();

			String sql = "select * from t_checklist order by check_seq";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next() == true) {

				int checkSeq = rs.getInt(1);
				String checkAge = rs.getString(2);
				String checkName = rs.getString(3);
				String disCode = rs.getString(4);
				String checkItem = rs.getString(5);
				int checkStd = rs.getInt(6);
				String reg_date = rs.getString(7);

				ChecklistVO cvo = new ChecklistVO(checkSeq, checkAge, checkName, disCode, checkItem, checkStd,
						reg_date);

				checklist.add(cvo);

			}
			System.out.println("üũ����Ʈ �ҷ�����");
		} catch (Exception e) {

			System.out.println("üũ����Ʈ �ҷ����� ����");
			e.printStackTrace();

		} finally {
			close();
		}

		return checklist;
	}
	// ===================================================================

	// ���������� �˻��� üũ����Ʈ ȣ��
	public ChecklistVO SelectCheckName(String check_name) {
		try {
			connection();
			// sql��
			String sql = "select * from t_checklist where check_name = ?";
			psmt = conn.prepareStatement(sql);

			// ���ε� ���� ä���
			psmt.setString(1, check_name);

			// ����
			rs = psmt.executeQuery();

			// cvo�� üũ����Ʈ ����
			if (rs.next() == true) {
				int checkSeq = rs.getInt(1);
				String checkAge = rs.getString(2);
				String checkName = rs.getString(3);
				String disCode = rs.getString(4);
				String checkItem = rs.getString(5);
				int checkStd = rs.getInt(6);
				String reg_date = rs.getString(7);

				cvo = new ChecklistVO(checkSeq, checkAge, checkName, disCode, checkItem, checkStd, reg_date);
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close();
		}

		return cvo;
	}

	// ===================================================================

	// �������� �˻��� üũ����Ʈ ȣ��
	public ArrayList<ChecklistVO> SelectCheckAge(String check_age) {
		try {
			connection();
			// sql��
			String sql = "select * from t_checklist where check_age = ?";
			psmt = conn.prepareStatement(sql);

			// ���ε� ���� ä���
			psmt.setString(1, check_age);

			// ����
			rs = psmt.executeQuery();

			// cvo�� üũ����Ʈ ����
			while (rs.next() == true) {
				int checkSeq = rs.getInt(1);
				String checkAge = rs.getString(2);
				String checkName = rs.getString(3);
				String disCode = rs.getString(4);
				String checkItem = rs.getString(5);
				int checkStd = rs.getInt(6);
				String reg_date = rs.getString(7);

				cvo = new ChecklistVO(checkSeq, checkAge, checkName, disCode, checkItem, checkStd, reg_date);
				checklist.add(cvo);
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close();
		}

		return checklist;
	}
	// ================================================================

	// �����ڵ�� �˻��� �������� ȣ��
	public DiseaseVO SelectDiseaseCode(String dis_code) {
		try {
			connection();
			// sql��
			String sql = "select * from t_disease where dis_code = ?";
			psmt = conn.prepareStatement(sql);

			// ���ε� ���� ä���
			psmt.setString(1, dis_code);

			// ����
			rs = psmt.executeQuery();

			// dvo�� üũ����Ʈ ����
			if (rs.next() == true) {
				int disseq = rs.getInt(1);
				String discode = rs.getString(2);
				String disname = rs.getString(3);
				String discontent = rs.getString(4);
				String dissymptom = rs.getString(5);
				String disdpt = rs.getString(6);
				String distag = rs.getString(7);
				String mbid = rs.getString(8);
				String dispic = rs.getString(9);

				dvo = new DiseaseVO(disseq, discode, disname, discontent, dissymptom, disdpt, distag, mbid, dispic);
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close();
		}

		return dvo;
	}
	// ================================================================

	// �����̸����� �˻��� �������� ȣ��
	public DiseaseVO SelectDiseaseName(String dis_name) {
		try {
			connection();
			// sql��
			String sql = "select * from t_disease where dis_name = ?";
			psmt = conn.prepareStatement(sql);

			// ���ε� ���� ä���
			psmt.setString(1, dis_name);

			// ����
			rs = psmt.executeQuery();

			// dvo�� üũ����Ʈ ����
			if (rs.next() == true) {
				int disseq = rs.getInt(1);
				String discode = rs.getString(2);
				String disname = rs.getString(3);
				String discontent = rs.getString(4);
				String dissymptom = rs.getString(5);
				String disdpt = rs.getString(6);
				String distag = rs.getString(7);
				String mbid = rs.getString(8);
				String dispic = rs.getString(9);

				dvo = new DiseaseVO(disseq, discode, disname, discontent, dissymptom, disdpt, distag, mbid, dispic);
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close();
		}

		return dvo;
	}

	// =================================================================================================================================
	// ��ǰ������ �Ϻ� �˻�
	public FoodVO Searchfood(String food_name) {

		try {
			connection();
			// sql��
			String sql = "select * from t_food where food_name = %?%";
			psmt = conn.prepareStatement(sql);

			// ���ε� ���� ä���
			psmt.setString(1, food_name);

			// ����
			rs = psmt.executeQuery();

			// fvo�� ��ǰ ����
			if (rs.next() == true) {
				int foodSeq = rs.getInt(1);
				String foodName = rs.getString(2); // ��ǰ ��
				int foodYear = rs.getInt(3); // ����⵵
				String foodSource = rs.getString(4); // �ڷ���ó
				float foodCalory = rs.getFloat(5); // ����
				float foodCarvohydrate = rs.getFloat(6); // ź��ȭ��
				float foodProtein = rs.getFloat(7); // �ܹ���
				float foodFat = rs.getFloat(8); // ����
				float foodSugars = rs.getFloat(9); // ���
				float foodSodium = rs.getFloat(10); // ��Ʈ��
				float foodCholesterol = rs.getFloat(11); // �ݷ����׷�
				float foodSaturated_fatty = rs.getFloat(12); // ��ȭ�����
				float foodTransfat = rs.getFloat(13); // Ʈ��������
				String regDate = rs.getString(14); // ��¥?
				String foodPic2 = rs.getString(15); // ��ǰ����

				FoodVO fvo = new FoodVO(foodSeq, foodName, foodYear, foodSource, foodCalory, foodCarvohydrate,
						foodProtein, foodFat, foodSugars, foodSodium, foodCholesterol, foodSaturated_fatty,
						foodTransfat, regDate, foodPic2);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close();
		}
		return fvo;
	}

	// =====================================================================================================================================
	// ��ǰ ��ü �ҷ�����
	public FoodVO SelectAllfood() {

		try {
			connection();
			// sql��
			String sql = "select * from t_food";
			psmt = conn.prepareStatement(sql);

			// ����
			rs = psmt.executeQuery();

			// fvo�� ��ǰ ����
			if (rs.next() == true) {
				int foodSeq = rs.getInt(1);
				String foodName = rs.getString(2); // ��ǰ ��
				int foodYear = rs.getInt(3); // ����⵵
				String foodSource = rs.getString(4); // �ڷ���ó
				float foodCalory = rs.getFloat(5); // ����
				float foodCarvohydrate = rs.getFloat(6); // ź��ȭ��
				float foodProtein = rs.getFloat(7); // �ܹ���
				float foodFat = rs.getFloat(8); // ����
				float foodSugars = rs.getFloat(9); // ���
				float foodSodium = rs.getFloat(10); // ��Ʈ��
				float foodCholesterol = rs.getFloat(11); // �ݷ����׷�
				float foodSaturated_fatty = rs.getFloat(12); // ��ȭ�����
				float foodTransfat = rs.getFloat(13); // Ʈ��������
				String regDate = rs.getString(14); // ��¥?
				String foodPic2 = rs.getString(15); // ��ǰ����

				FoodVO fvo = new FoodVO(foodSeq, foodName, foodYear, foodSource, foodCalory, foodCarvohydrate,
						foodProtein, foodFat, foodSugars, foodSodium, foodCholesterol, foodSaturated_fatty,
						foodTransfat, regDate, foodPic2);

			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close();
		}
		return fvo;
	}

	// =====================================================================================================================================
	// �������� �ҷ�����	
	public ArrayList<HospitalVO> HospitalAll(String hos_dpt) {
		try {
			connection();

			String sql = "select * from t_hospital WHERE hos_dpt='����' or hos_dpt = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, hos_dpt);

			rs = psmt.executeQuery();

			while (rs.next() == true) {

				int hos_seq = rs.getInt(1);
				String hos_name = rs.getString(2);
				String hos_addr = rs.getString(3);
				String hos_phone = rs.getString(4);
				double hos_latitude = rs.getDouble(5);
				double hos_longitude = rs.getDouble(6);
				String hos_facilities = rs.getString(7);
				String userhos_dpt = rs.getString(8);
				int hos_time1 = rs.getInt(9);
				int hos_time2 = rs.getInt(10);
				int hos_time3 = rs.getInt(11);
				int hos_time4 = rs.getInt(12);
				int hos_time5 = rs.getInt(13);
				String mb_id = rs.getString(14);

				HospitalVO hvo = new HospitalVO(hos_seq, hos_name, hos_addr, hos_phone, hos_latitude, hos_longitude,
						hos_facilities, userhos_dpt, hos_time1, hos_time2, hos_time3, hos_time4, hos_time5, mb_id);

				hoslist.add(hvo);

			}
			System.out.println("���� �ҷ�����");
		} catch (Exception e) {

			System.out.println("���� �ҷ����� ����");
			e.printStackTrace();

		} finally {
			close();
		}

		return hoslist;
	}

	// =====================================================================================================================================
	// �ǰ���� ��ǰ �ҷ�����
	public ArrayList<RawVO> RawSelect(String dis_tag){try {
		connection();

		String sql = "select * from t_raw WHERE dis_tag= ?";
		psmt = conn.prepareStatement(sql);

		psmt.setString(1, dis_tag);

		rs = psmt.executeQuery();

		while (rs.next() == true) {
			
			int seq = rs.getInt(1);
			String company = rs.getString(2);
			String name = rs.getString(3);
			String func = rs.getString(4);
			String tag = rs.getString(5);
			
			RawVO rvo = new RawVO(seq, company, name, func, tag);

			rawlist.add(rvo);

		}
		System.out.println("�ǰ���ɽ�ǰ �ҷ�����");
	} catch (Exception e) {

		System.out.println("�ǰ���ɽ�ǰ �ҷ����� ����");
		e.printStackTrace();

	} finally {
		close();
	}

	return rawlist;
	}
}
