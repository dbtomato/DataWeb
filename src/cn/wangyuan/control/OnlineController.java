package cn.wangyuan.control;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.wangyuan.model.User;
import cn.wangyuan.service.OnlineSer;
import cn.wangyuan.service.OnlineSerImp;
import cn.wangyuan.service.UserSer;


@Controller
public class OnlineController {
	protected final transient Log log = LogFactory.getLog(OnlineController.class);
	@Autowired
	 private OnlineSer onlineSer;
	@Autowired
	private UserSer userSer;
	@Autowired
	OnlineSerImp onlineSerImp;
@RequestMapping("loginView")
public String loginView(){
    return "login";
}
@RequestMapping("login")
public  String login( String userName,  String password){
	User user = new User(userName, password);
//System.out.println(user.getName());
//System.out.println(user.getPwd());
	int result=userSer.loginCheck(user);
	if(result==0){
		return "success";
	}
	else{
		return "login";
	}
}

@RequestMapping("Success")
public String Success(){
	return "SumOnline";	
}



@RequestMapping("SumOnline")
public void getSumOnline(HttpServletResponse response){
	String str=onlineSerImp.Online();
	try {
		response.getWriter().print(str);
	} catch (IOException e) {
		log.error(e.getMessage());
		e.printStackTrace();
	}
	
}



}
