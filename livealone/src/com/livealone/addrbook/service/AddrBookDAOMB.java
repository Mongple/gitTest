package com.livealone.addrbook.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddrBookDAOMB {
	
	@Autowired
	SqlSessionTemplate template;
	
	public List<AddrBookVO> getDBList() throws Exception {
		return template.selectList("addrbook.selectAddrBookList");
	}
	
	public AddrBookVO getDB(int abId) throws Exception {
		return template.selectOne("addrbook.selectAddrBookById", abId);
	}
	
	public int insertDB(AddrBookVO vo) throws Exception {
		
		return template.insert("addrbook.insertAddrBook", vo);
	}
	
	public int updateDB(AddrBookVO vo) throws Exception {
		
		return template.update("addrbook.updateAddrBook", vo);
	}
	
	public int deleteDB(int abId) throws Exception {
		
		return template.delete("addrbook.deleteAddrBook", abId);
	}
	
}
