package medicine;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import gjavaweb.addrbook.AddrBook;
import medicine.Medi;

public class DBConnect {
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	ResultSet rs;
	String url = "jdbc:mariadb://mariadb1.cvs2wwdrdvzr.ap-northeast-2.rds.amazonaws.com:3306/medicinebox";

	void connect() {

		try {
			String dbID = "rdsuser";
			String dbPasswd = "medicinebox1";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, dbID, dbPasswd);
			System.out.println("Database Connected!!");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

		
	// DB close
	void disconnect() {
		// null 체크를 하고 close
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 로그인
	public int loginCheck(String id, String pw) {
		connect();
		
		String sql = "select admin_pwd from admin where admin_id = ?";
		
		String dbpw = "";
		int x = -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpw = rs.getString("admin_pwd");
				
				if (dbpw.equals(pw))
					x = 1;
				else
					x = 0;
			} else {
				x = -1;
			}
			rs.close();
			
		} catch (Exception e) {
			
		}finally {
			disconnect();
		}
		return x;
	}
	
	//비번 변경 전 비번 체크
	public int passwdCheck(String id, String oldPw) {
		connect();
		
		String sql = "select admin_pwd from admin where admin_id = ?";
		
		String dbpw = "";
		int x = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dbpw = rs.getString("admin_pwd");
				
				if (dbpw.equals(oldPw))
					x = 1;
				else
					x = 0;
			}
			rs.close();
			
		} catch (Exception e) {
			
		}finally {
			disconnect();
		}
		return x;
	}
	
	//비번 변경
	public boolean passwdEdit(String id, String newPw) {
		connect();
		
		String sql = "UPDATE admin SET admin_pwd = ? WHERE admin_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPw);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			return false;			
		}finally {
			disconnect();
		}
		return true;
	}
	
	
	// 의약품 추가
	public boolean insertMedi(String name, String photo, String effect, String use) {
		connect();
		
		String sql = "INSERT INTO medi (`medi_name`, `medi_photo`, `medi_effect`, `medi_use`) VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, photo);
			pstmt.setString(3, effect);
			pstmt.setString(4, use);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	
	// 의약품 페이징 위한 갯수 조회
	public int getTotalRows() {
		connect();
		
		int count = 0;
		
		String sql = "select count(medi_num) from medi";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int index = 0;
			if (rs.next()) {
				count = rs.getInt("count(medi_num)");
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}
	
	// 의약품 전체 조회
	public List<Medi> getMediList(int start, int end){
		List<Medi> datas = new ArrayList<>();
		connect();
		
		String sql = "select * from medi limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Medi medi = new Medi();
				
				medi.setMedi_num(rs.getInt("medi_num"));
				medi.setMedi_name(rs.getString("medi_name"));
				medi.setMedi_photo(rs.getString("medi_photo"));
				medi.setMedi_effect(rs.getString("medi_effect"));
				medi.setMedi_use(rs.getString("medi_use"));
				medi.setMedi_store(rs.getInt("medi_store"));
				medi.setMedi_search(rs.getInt("medi_search"));
				
				datas.add(medi);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	
	// 의약품 하나 조회
	public Medi getMedi(int medi_num) {
		connect();
		
		String sql = "select * from addrbook where medi_num = ?";
		
		Medi medi = new Medi();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, medi_num);
			
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
			rs.next();
			medi.setMedi_num(rs.getInt("medi_num"));
			medi.setMedi_name(rs.getString("medi_name"));
			medi.setMedi_photo(rs.getString("medi_photo"));
			medi.setMedi_effect(rs.getString("medi_effect"));
			medi.setMedi_use(rs.getString("medi_use"));
			medi.setMedi_store(rs.getInt("medi_store"));
			medi.setMedi_search(rs.getInt("medi_search"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return medi;
	}
}
