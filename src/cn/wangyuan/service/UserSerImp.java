package cn.wangyuan.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.wangyuan.dao.UserDao;
import cn.wangyuan.model.User;

@Service
public class UserSerImp implements UserSer {
@Autowired
	UserDao userDao;
	public int loginCheck(User user) {
     Map map=userDao.LoginCheck(user.getName());
     System.out.println("service"+map.get("password"));
     if(map.get("password").equals(user.getPwd()))
    	return 0;
    	else 
    	return 1;
     }

}
