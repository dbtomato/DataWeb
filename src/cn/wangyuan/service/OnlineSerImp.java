package cn.wangyuan.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.TestExecutionListeners;

import com.alibaba.fastjson.JSON;

import cn.wangyuan.dao.OnlineDao;

@Service
public class OnlineSerImp implements OnlineSer {
@Autowired
    OnlineDao onlineDao;
public String Online() {
		Map map=onlineDao.GetOnline();
		String OnlinejsonString=JSON.toJSONString(map);
		System.out.println(OnlinejsonString);
		return OnlinejsonString;
	}

}

