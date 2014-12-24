package net.shangtech.weixin.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({ "/" })
public class FrontController {
	@RequestMapping({ "aboutus" })
	public String aboutus(HttpServletRequest request) throws IOException {
		File sampleDir = new File("D:\\weixin\\WWWROOT\\main-site\\sample");
		File[] samples = sampleDir.listFiles();
		Map<String, String> sampleMap = new LinkedHashMap<>();
		for (File sample : samples)
			if (!sample.isFile()) {
				String link = getContent(new File(sample, "link.txt"));
				sampleMap.put("main-site/sample/" + sample.getName() + "/image.jpg", link);
			}
		request.setAttribute("samples", sampleMap);
		File styleDir = new File("D:\\weixin\\WWWROOT\\main-site\\style");
		File[] styles = styleDir.listFiles();
		Map<String, String> styleMap = new HashMap<>();
		for (File style : styles) {
			if (style.isFile()) {
				styleMap.put("main-site/style/" + style.getName() + ".jpg", style.getName());
			} else {
				String title = getContent(new File(style, "title.txt"));
				styleMap.put("main-site/style/" + style.getName() + "/image.jpg", title);
			}
		}
		request.setAttribute("styles", styleMap);
		return "aboutus";
	}
	
	
	@RequestMapping("index")
	public String index(Model model){
		
		return "index";
	}

	private String getContent(File file) throws IOException {
		FileInputStream fis = new FileInputStream(file);
		InputStreamReader isr = new InputStreamReader(fis);
		BufferedReader br = new BufferedReader(isr);
		String content = br.readLine();
		br.close();
		isr.close();
		fis.close();
		return content;
	}
}