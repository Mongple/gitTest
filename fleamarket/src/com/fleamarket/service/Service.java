package com.fleamarket.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

public interface Service {

	public List selectList(String statement, Object parameter, RowBounds rowBounds) throws Exception;

	public Object selectOne(String statement, Object parameter) throws Exception;

	public int update(String statement, Object parameter) throws Exception;

	public int delete(String statement, Object parameter) throws Exception;

	public int insert(String statement, Object parameter) throws Exception;
}
