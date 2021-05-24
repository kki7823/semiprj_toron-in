package com.toron.dao;

import java.sql.Connection;

public class MemberDAO extends DAO {

    private MemberDAO() {

    }

    private static MemberDAO instance = null;

    public static MemberDAO getInstance() {
        if (instance == null) {
            instance = new MemberDAO();
        }
        return new MemberDAO();
    }
}
