package net.shangtech.weixin;

import java.io.IOException;
import java.util.Properties;

public class Config {
	public static String domain;
	static{
		Properties props = new Properties();
		try {
			props.load(Config.class.getClassLoader().getResourceAsStream("conf.properties"));
			domain = props.getProperty("domain");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static final String URL_GET_ACCESS_TOKEN = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&";
	public static final String URL_POST_MENU_CREATE = "https://api.weixin.qq.com/cgi-bin/menu/create?";
}
