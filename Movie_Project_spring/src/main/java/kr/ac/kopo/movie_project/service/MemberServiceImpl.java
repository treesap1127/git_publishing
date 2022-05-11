package kr.ac.kopo.movie_project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.movie_project.dao.MemberDao;
import kr.ac.kopo.movie_project.model.Member;
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	@Override
	public boolean login(Member member) {
		Member item=dao.login(member);
		if(item!=null) {
			member.setId(item.getId());
			member.setPasswd(null);
			member.setUserName(item.getUserName());
			member.setTel(item.getTel());
			member.setEmail(item.getEmail());
			member.setGrade(item.getGrade());
			return true;
		}
		return false;
	}
	@Override
	public void add(Member member) {
		dao.add(member);
	}
	@Override
	public boolean checkId(String id) {
		if(dao.checkId(id)==0)
			return true;
		else
		return false;
	}
}
