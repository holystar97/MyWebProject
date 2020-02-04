package net.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class MyController extends HttpServlet{

	//명령어와 명령어 처리 클래스를 쌍으로 저장
	private Map commandMap=new HashMap();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		//web.xml에서 propertyConfig에 해당하는 init-param의 값을 읽어옴
		String props= config.getInitParameter("propertyConfig");
		//명령어와 처리 클래스의 매핑 정보를 저장할 properties 객체 생성 
		Properties pr=new Properties();
		FileInputStream f=null; 
		try {
			//command.properties 파일 가져오기 
			f=new FileInputStream(props);
			//command.properties파일을 properties객체에 저장하기 
			pr.load(f);
		}catch(Exception e) {
			System.out.println(e);
		}finally {
			if(f!=null) {
				try {
					f.close();
				}catch(Exception ex) {}
			}
		}
		
		//iterator 객체는 enumeration 객체를 확장시킨 개념의 객체 
		Iterator keyIter =pr.keySet().iterator();
		//객체를 하나씩 꺼내서 그 객체명으로 properties객체에 저장된 객체에 접근
		while(keyIter.hasNext()) {
			String key=(String)keyIter.next();
			String value=pr.getProperty(key);
			//System.out.println(key);
			//System.out.println(value);
			try {
				//해당 문자열을 클래스로 만든다 
				Class commandClass =Class.forName(value);
				//해당 클래스의 객체를 생성한다 (object 최상위 클래스로 변환)
				Object commandInstance=commandClass.newInstance();
				//map객체인 commandmap 에 객체를 저장한다 
				commandMap.put(key,commandInstance);
			}catch(Exception e) {
				System.out.println(e);
			}
			
		}
		
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req,resp);
	}
	
	//사용자의 요청을 분석해서 해당 작업을 처리한다 
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		
		String view=null;
		CommandAction com=null;
		try {
			String command=req.getRequestURI();
			com=(CommandAction)commandMap.get(command);
			view=com.requestPro(req, resp);
		}catch(Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher=req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
		
	}
}
