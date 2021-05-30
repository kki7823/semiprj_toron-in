package com.toron.dao;

import java.sql.*;

public class DAO {
    private final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final String ORACLE_URL = "jdbc:oracle:thin:@13.124.230.151:1521:XE";
    private final String ORACLE_USER = "yama";
    private final String ORACLE_PW = "0202";

    protected Connection conn;
    protected Statement stmt;
    protected PreparedStatement pstmt;
    protected ResultSet rs;
    protected int result = 0;

    //DB 접속
    protected Connection getConnection() throws SQLException{

        try{
        Class.forName(ORACLE_DRIVER);
            System.out.println("ORACLE DRIVER LOADING : SUCCESS");
            conn = DriverManager.getConnection(ORACLE_URL, ORACLE_USER, ORACLE_PW);
            System.out.println("CONNECTING ORACLE : SUCCESS");
        }catch (ClassNotFoundException e){
            System.out.println("ORACLE DRIVER LOADING : FAIL");
        }

        return conn;
    }

    //DB 연결 해제
    protected void closeConnection(Connection c, PreparedStatement p, ResultSet r) {
        try {
            if (r != null) r.close();
            if (p != null) p.close();
            closeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void closeConnection(Connection c, Statement s, ResultSet r) {
        try {
            if (r != null) r.close();
            if (s != null) s.close();
            closeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void closeConnection(Connection c, PreparedStatement p) {
        try {
            if (p != null) p.close();
            closeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void closeConnection(Connection c, Statement s) {
        try {
            if (s != null) s.close();
            closeConnection(c);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void closeConnection(Connection c) {
        try {
            if (c != null) c.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
