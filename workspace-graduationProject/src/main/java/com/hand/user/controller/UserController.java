package com.hand.user.controller;

import com.hand.user.po.User;
import com.hand.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	public UserService userService;
	
	@RequestMapping("login.do")
	public void login(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String userName=request.getParameter("userName");
		String password =request.getParameter("password");
		//System.out.println(userName+password);
		try {
			User loginUser=userService.login(userName, password);
			if(loginUser!=null) {
				//System.out.println(loginUser.getUserName());
				request.getSession().setAttribute("loginUser", loginUser);
				response.sendRedirect("../welcome.jsp");
			}else {
				request.getSession().setAttribute("error110", "用户名或者密码错误");
				response.sendRedirect("../login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("error110", "用户名或者密码错误");
			response.sendRedirect("../login.jsp");
		}
	}
		@RequestMapping("password.do")
		public String password(HttpServletRequest request,HttpServletResponse response) throws IOException {
			try {
				int id=Integer.parseInt(request.getParameter("userId"));
				String password=request.getParameter("password");
				String oldPassword =request.getParameter("oldPassword");
				String newPassword =request.getParameter("newPassword");
				String reNewPassword =request.getParameter("reNewPassword");
				//System.out.println(userName+password);
				boolean flag1=false;
				boolean flag2=false;
				if(password.equals(oldPassword)) {
					flag1=true;
				}else {
					request.setAttribute("error1", ",旧密码输入错误");
				}
				if(newPassword.equals(reNewPassword)) {
					flag2=true;
				}else {
					request.setAttribute("error2", ",两次密码输入不一致！");
				}
				if(flag1&&flag2) {
					User user=new User();
					user.setUserId(id);
					user.setPassword(newPassword);
					boolean f=userService.password(user);
					if(f) return "login";
					else return "password";
				}else {
					return "password";
				}
			}catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
	}
		@RequestMapping("getUserInfo.do")
		public String getUserInfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
			try {
			int id=Integer.parseInt(request.getParameter("userId"));
			User user=userService.getUserInfo(id);
			request.setAttribute("user", user);
			return "userView";
			}catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
	}
		@RequestMapping("userUpdate.do")
		public String userUpdate(HttpServletRequest request,HttpServletResponse response) throws IOException {
			try {
				int id=Integer.parseInt(request.getParameter("userId"));
				User user=userService.getUserInfo(id);
				request.setAttribute("user", user);
				return "userUpdate";
			}catch (Exception e) {
				e.printStackTrace();
				return "error";
			}
		}
		@RequestMapping("userSave.do")
		public String userSave(HttpServletRequest request,HttpServletResponse response) throws IOException {
			try{
			String ageStr=request.getParameter("age");
			int age=201;
			Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
			if(pattern.matcher(ageStr).matches()) {
				 age=Integer.parseInt(ageStr);
			}
			if(age>=200) {
				request.setAttribute("error", "年龄格式输入有误");
				return "userUpdate";
			}
			int id=Integer.parseInt(request.getParameter("userId"));
			String userName=request.getParameter("userName");
			String sex=request.getParameter("sex");
			 /** 正则表达式校验电话号码
		     * 大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数 
		     * 此方法中前三位格式有： 
		     * 13+任意数 
		     * 15+除4的任意数 
		     * 18+除1和4的任意数 
		     * 17+除9的任意数 
		     * 147 
		     */
			String phoneNumber=request.getParameter("phoneNumber");
			String regExp = "^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$"; 
			if(phoneNumber.length()!=11) {
				request.setAttribute("error1", "手机号码应为11位");
				return "userUpdate";
			}else {
				Pattern p = Pattern.compile(regExp);  
		        Matcher m = p.matcher(phoneNumber); 
		        if(! m.matches()) {
		        	request.setAttribute("error1", "手机号码格式错误");
		        	return "userUpdate";
		        }
		    }
			String comments=request.getParameter("comments");
			User user=userService.getUserInfo(id);
			user.setUserId(id);
			user.setSex(sex);
			user.setAge(age);
			user.setUserName(userName);
			user.setPhoneNumber(phoneNumber);
			user.setComments(comments);
			userService.updateUser(user);
			request.getSession().setAttribute("loginUser", user);
			return "welcome";
		}catch (Exception e) {
			request.setAttribute("error0", "信息输入不足！错误");   	
			e.printStackTrace();
			return "userUpdate";
		}
		}
		
}
