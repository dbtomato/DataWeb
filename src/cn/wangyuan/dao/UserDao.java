package cn.wangyuan.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

public interface UserDao {
	public Map LoginCheck(String name);

}
