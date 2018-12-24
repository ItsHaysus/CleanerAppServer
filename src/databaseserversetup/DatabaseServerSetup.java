package databaseserversetup;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class DatabaseServerSetup {

    static Boolean isDatabseSetup = true;
    Statement statement = null;
    Connection conn = null;
    String user = "jesus_13";
    String pass = "12qwaszx";
    String url = "jdbc:mysql://db4free.net:3306/databatchfile_13";
    String filePath = "";

    public static void main(String[] args) throws SQLException, FileNotFoundException, IOException {
        DatabaseServerSetup data = new DatabaseServerSetup();
        data.ConnectToDatabase();
        if (!isDatabseSetup) {
            data.createDatabase();
        }
        Scanner reader = new Scanner(System.in);
        String ans;

        System.out.println("Upload files to database? (Yes/No)");
        ans = reader.nextLine();
        if (ans.equalsIgnoreCase("yes")) {
            data.UploadFilesToDatabase();
        }

    }

    public void ConnectToDatabase() {
        //try to connect to database!
        System.out.println("Attemtping to connect to Database");
        try {
            try (Connection con = DriverManager.getConnection(url, user, pass)) {
                if (con.isValid(5)) {
                    System.out.println("Connected to database!");
                }
                con.close();
            }
        } //catch if database cant be connected
        catch (SQLException e) {
            System.out.println(e);
            isDatabseSetup = false;
        }
    }

    public void createDatabase() throws SQLException {
        Connection Conn = DriverManager.getConnection(url, user, pass);
        Statement s = Conn.createStatement();
        int Result = s.executeUpdate("CREATE DATABASE databatchfile_13");
        Conn.close();
        if (Result == 1) {
            CreateTables();
        }
    }

    public void CreateTables() {
        try {
            conn = DriverManager.getConnection(url, user, pass);
            System.out.println("Connected database successfully...");

            statement = conn.createStatement();

            String sql = "CREATE TABLE batfiles "
                    + "(id INTEGER not NULL AUTO_INCREMENT, "
                    + " BatchName VARCHAR(255), "
                    + " batchfile LONGBLOB, "
                    + " PRIMARY KEY ( id ))";

            statement.executeUpdate(sql);
            System.out.println("table created");
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            try {
                if (statement != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public void UploadFilesToDatabase() throws SQLException, FileNotFoundException, IOException {
        conn = DriverManager.getConnection(url, user, pass);
        System.out.println("started...");
        File directoryOfBatFiles = new File(System.getProperty("user.dir"));
        System.out.println(directoryOfBatFiles.getName());
        List<File> batList = Arrays.asList(directoryOfBatFiles.listFiles((File dir, String name) -> name.endsWith(".bat")));
        List<File> cssList = Arrays.asList(directoryOfBatFiles.listFiles((File dir, String name) -> name.endsWith(".css")));
        List<File> pdfList = Arrays.asList(directoryOfBatFiles.listFiles((File dir, String name) -> name.endsWith(".pdf")));
        List<File> pngList = Arrays.asList(directoryOfBatFiles.listFiles((File dir, String name) -> name.endsWith(".png")));
        List<File> exeList = Arrays.asList(directoryOfBatFiles.listFiles((File dir, String name) -> name.endsWith(".exe")));
        
        //upload bat files
        for (int i = 0; i < batList.size(); i++) {
            System.out.println("Listing all files: ");
            System.out.println(batList.get(i).getName());
            String batFile = batList.get(i).getAbsolutePath();
            String batName = batList.get(i).getName();
            System.out.println(batFile);
            String sql = "INSERT INTO batchfiles (fileName,batchFile) VALUES (?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, batName);
            pstmt.setBinaryStream(2, new BufferedInputStream(new FileInputStream(batList.get(i))));
            System.out.println("files uploaded!");
            pstmt.executeUpdate();
        }
        for (int i = 0; i < cssList.size(); i++) {
            System.out.println("Listing all files: ");
            System.out.println(cssList.get(i).getName());
            String batFile = cssList.get(i).getAbsolutePath();
            String batName = cssList.get(i).getName();
            System.out.println(batFile);
            String sql = "INSERT INTO batchfiles (fileName,batchFile) VALUES (?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, batName);
            pstmt.setBinaryStream(2, new BufferedInputStream(new FileInputStream(cssList.get(i))));
            System.out.println("files uploaded!");
            pstmt.executeUpdate();
        }
        for (int i = 0; i < pdfList.size(); i++) {
            System.out.println("Listing all files: ");
            System.out.println(pdfList.get(i).getName());
            String batFile = pdfList.get(i).getAbsolutePath();
            String batName = pdfList.get(i).getName();
            System.out.println(batFile);
            String sql = "INSERT INTO batchfiles (fileName,batchFile) VALUES (?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, batName);
            pstmt.setBinaryStream(2, new BufferedInputStream(new FileInputStream(pdfList.get(i))));
            System.out.println("files uploaded!");
            pstmt.executeUpdate();
        }
        for (int i = 0; i < pngList.size(); i++) {
            System.out.println("Listing all files: ");
            System.out.println(pngList.get(i).getName());
            String batFile = pngList.get(i).getAbsolutePath();
            String batName = pngList.get(i).getName();
            System.out.println(batFile);
            String sql = "INSERT INTO batchfiles (fileName,batchFile) VALUES (?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, batName);
            pstmt.setBinaryStream(2, new BufferedInputStream(new FileInputStream(pngList.get(i))));
            System.out.println("files uploaded!");
            pstmt.executeUpdate();
        }
        for (int i = 0; i < exeList.size(); i++) {
            System.out.println("Listing all files: ");
            System.out.println(exeList.get(i).getName());
            String batFile = exeList.get(i).getAbsolutePath();
            String batName = exeList.get(i).getName();
            System.out.println(batFile);
            String sql = "INSERT INTO batchfiles (fileName,batchFile) VALUES (?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, batName);
            pstmt.setBinaryStream(2, new BufferedInputStream(new FileInputStream(exeList.get(i))));
            System.out.println("files uploaded!");
            pstmt.executeUpdate();
        }
    }

}
