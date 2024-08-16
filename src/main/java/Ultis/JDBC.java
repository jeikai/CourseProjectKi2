package Ultis;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {
    public static Connection Connection() throws SQLException{
         Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/Library"; 
        String user = "root"; 
        String password = ""; 
//    String url = "databaseproject.cc8wmiuolpsc.ap-southeast-1.rds.amazonaws.com"; 
//        String user = "admin"; 
//        String password = "12345678"; 
    try {
        conn = DriverManager.getConnection(url, user, password);
        System.out.println("Kết nối đã được thiết lập thành công đến cơ sở dữ liệu!");
    } catch (SQLException e) {
        System.out.println("Không thể thiết lập kết nối đến cơ sở dữ liệu.");
        e.printStackTrace();
    }
    return conn;
    }
}
