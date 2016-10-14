package cn.wangyuan.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository

public class UserDaoImp  implements UserDao{

	@Autowired
	JdbcTemplate jdbcTemplate;
	public Map LoginCheck(String name) {
	String sql = String.format(
	"select * from user where userName='%s'", name);	
	Map map=jdbcTemplate.queryForMap(sql);
	System.out.println("dao"+map.get("password")); 
	return map;
}

}
