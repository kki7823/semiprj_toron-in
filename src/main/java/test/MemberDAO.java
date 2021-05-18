package test;

import java.sql.ResultSet;

public class MemberDAO extends DAO{

    private MemberDAO() {
    }

    private static DAO instance = null;

    public static DAO getInstance(){
        if(instance == null){
            instance = new MemberDAO();
        }
        return new MemberDAO();
    }

    @Override
    public ResultSet select_query(String sql_select) {
        return null;
    }

    @Override
    public int insert_query(String sql_insert) {
        return 0;
    }

    @Override
    public int update_query(String sql_update) {
        return 0;
    }

    @Override
    public int delete_query(String sql_delete) {
        return 0;
    }
}
