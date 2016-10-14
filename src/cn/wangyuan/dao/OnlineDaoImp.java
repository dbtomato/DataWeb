package cn.wangyuan.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSON;

import cn.wangyuan.model.Online;
@Repository
public class OnlineDaoImp implements OnlineDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public Map GetOnline() {
		String sql="select * from test.t1 where dt='2016-09-23 11:58:50'";
		Online online=new Online();
		Map map=jdbcTemplate.queryForMap(sql);
        return map;
	}	

}
