package com.daum.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.MemberBean;

@Repository
public class MemDAOImpl implements MemDAO {

	@Autowired
	private SqlSession sqlsession;

	public void insertmember(MemberBean m) {
		this.sqlsession.insert("m_join",m);
	}

	public MemberBean idchk(String id) {
		
			return this.sqlsession.selectOne("id_chk",id);
		
	
	}

	public MemberBean loginchk(String login_id) {
		return sqlsession.selectOne("lo_chk",login_id);
	}

	public MemberBean find_id(MemberBean m) {
		return sqlsession.selectOne("find_id",m);
	}

	public MemberBean emailchk(String email){
		return sqlsession.selectOne("email_chk",email);
	}

	public MemberBean getMem(String id) {
		return sqlsession.selectOne("minfo",id);
	}

	public void updateMem(MemberBean m) {
		sqlsession.update("updatem",m);
	}

	public MemberBean pwdFine(MemberBean m) {
		return this.sqlsession.selectOne("mem_find",m);
	}

	public void updatePwd(MemberBean m) {
		sqlsession.update("pwd_edit",m);
	}

	public void delM(MemberBean dm) {
		sqlsession.delete("delM",dm);
	}
	

	

}
