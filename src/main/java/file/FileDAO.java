package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FileDAO {
	private Connection conn;

	public FileDAO() {
		try {
			
			String dbURL = "jdbc:mysql://localhost:3306/file";
			String dbID = "juri";
			String dbPassword = "1102";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int upload(String fileName, String fileRealName) {
		String sql = "insert into file values(?,?,0)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public int hit(String fileRealName) {
		String SQL = "update file set downloadCount = downloadCount + 1 "
				+ "where fileRealName = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fileRealName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<FileDTO> getList(){
		String SQL = "select fileName, fileRealName, downloadCount from file";
		List<FileDTO> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
                      FileDTO file = new FileDTO(rs.getString(1), rs.getString(2), rs.getInt(3));
				list.add(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
