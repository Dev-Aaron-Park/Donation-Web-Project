import java.sql.*; 

public class dbTest {
	 public static void main(String[] args) {
	        String DB_URL = "jdbc:oracle:thin:@192.168.56.108:15271:XE";
	        String DB_USER = "AARONPARK";
	        String DB_PASSWORD = "7100";

	        Connection conn = null;
	        Statement stmt = null;
	        ResultSet rs = null;

	        String query = "SELECT * FROM emp";
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	        } catch (ClassNotFoundException e ) {
	            e.printStackTrace();
	        }

	        try {
	            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	            stmt = conn.createStatement();

	            rs = stmt.executeQuery(query);

	            while (rs.next()) { 
	                String empno = rs.getString(1);
	                String ename = rs.getString(2);
	                String job = rs.getString(3);
	                String mgr = rs.getString(4);
	                String hiredate = rs.getString(5);
	                String sal = rs.getString(6);
	                String comm = rs.getString(7);
	                String depno = rs.getString(8);
	                System.out.println( 
	                    empno + " : " + ename + " : " + job + " : " + mgr
	                    + " : " + hiredate + " : " + sal + " : " + comm + " : "
	                + depno); 
	            }
	        } catch ( Exception e ) {
	            e.printStackTrace();
	        } finally {
	            try {
	                rs.close();
	                stmt.close();
	                conn.close();
	            } catch ( SQLException e ) {}
	        }
	    } 	
}
