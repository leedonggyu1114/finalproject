package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CrawlingController {
	// 다음날씨
	@RequestMapping("weather.json")
	@ResponseBody
	public HashMap<String, Object> weatherJson() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			Document doc = Jsoup.connect("https://www.daum.net/").get(); // 크롤링할 페이지 connect
			Elements es = doc.select(".info_today"); // 값을 가져오는것
			ArrayList<HashMap<String, Object>> array = new ArrayList<HashMap<String, Object>>();
			map.put("date", es.select(".date_today").text());
			for (Element e : es.select("li")) {
				HashMap<String, Object> m = new HashMap<String, Object>();
				m.put("area", e.select(".txt_part").text());
				m.put("icon", e.select(".ico_ws").text());
				m.put("temper", e.select(".txt_temper").text());
				m.put("wa", e.select(".ir_wa").text());
				array.add(m);
			}
			map.put("array", array);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return map;
	}
}
