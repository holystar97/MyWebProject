package net.utility;

import java.io.*;
import javax.servlet.*;;

public class EncodeFilter implements Filter {

	private void destory() {
		// TODO Auto-generated method stub

	}
	
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
	
		arg0.setCharacterEncoding("UTF-8");
		arg2.doFilter(arg0, arg1);
		
	}

}
