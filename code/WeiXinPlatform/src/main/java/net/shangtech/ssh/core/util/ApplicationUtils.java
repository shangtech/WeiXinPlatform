package net.shangtech.ssh.core.util;

import org.springframework.context.ApplicationContext;

public class ApplicationUtils {
	private static ApplicationContext ctx = null;
	public static void setServletContext(ApplicationContext ctx){
		ApplicationUtils.ctx = ctx;
	}
	public static Object get(String name){
		return ctx.getBean(name);
	}
}
