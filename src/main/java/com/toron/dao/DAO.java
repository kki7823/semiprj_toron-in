package com.toron.dao;

import java.sql.*;

public abstract class DAO {
    private final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final String ORACLE_URL = "jdbc:oracle:thin:@13.124.230.151:1521:XE";
    private final String ORACLE_USER = "yama";
    private final String ORACLE_PW = "0202";

    protected Connection conn;
    protected Statement stmt;
    protected PreparedStatement pstmt;
    protected ResultSet rs;
    protected int result = 0;

    protected String select_query;
    protected String insert_query;
    protected String update_query;
    protected String delete_query;

    //DB 접속
    protected Connection getConnection() {
        try {
            Class.forName(ORACLE_DRIVER);
            System.out.println("ORACLE DRIVER LOADING : SUCCESS");
            conn = DriverManager.getConnection(ORACLE_URL, ORACLE_USER, ORACLE_PW);
            System.out.println("CONNECTING ORACLE : SUCCESS");

        } catch (ClassNotFoundException e) {
            System.out.println("ORACLE DRIVER LOADING : FAIL - " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("CONNECTING ORACLE : FAIL - " + e.getMessage());
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


    public abstract ResultSet select_query(String sql_select);

    public abstract int insert_query(String sql_insert);

    public abstract int update_query(String sql_update);

    public abstract int delete_query(String sql_delete);


}
