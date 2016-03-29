package com.fleamarket.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ServiceImpl implements Service{
	
	@Autowired
	SqlSessionTemplate template;

	@Override
	public List selectList(String statement, Object parameter) throws Exception {
		// TODO Auto-generated method stub
		return template.selectList(statement, parameter);
	}

	@Override
	public Object selectOne(String statement, Object parameter) throws Exception {
		// TODO Auto-generated method stub
		return template.selectOne(statement, parameter);
	}

	@Override
	public int update(String statement, Object parameter) throws Exception {
		// TODO Auto-generated method stub
		return template.update(statement, parameter);
	}

	@Override
	public int delete(String statement, Object parameter) throws Exception {
		// TODO Auto-generated method stub
		return template.delete(statement, parameter);
	}

	@Override
	public int insert(String statement, Object parameter) throws Exception {
		// TODO Auto-generated method stub
		return template.insert(statement, parameter);
	}
	
}
