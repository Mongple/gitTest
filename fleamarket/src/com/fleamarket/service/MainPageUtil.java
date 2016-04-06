package com.fleamarket.service;

import java.util.List;

import com.fleamarket.vo.BoardVO;

public class MainPageUtil {
	public MainPageUtil() {
		// TODO Auto-generated constructor stub
	}

	public List<BoardVO> getPicture(List<BoardVO> list) {
		
		for (int i = 0; i < list.size(); i++) {
			String title = list.get(i).getBaTitle();
			String changTitle = null;
			if (title.length() >= 10) {
				changTitle = title.substring(0, 10);
				list.get(i).setBaTitle(changTitle + "..");
			}
			String str = list.get(i).getBaContent(); 

			if (str.indexOf("<img") != -1) {
				int a = str.indexOf("<img");
				int la = str.lastIndexOf(">");
				String str2 = str.substring(a, la);
				int b = str2.indexOf(">");
				list.get(i).setBaContent(str2.substring(0, b + 1));
			} else if (str.indexOf("<img") == -1) {
				str = "<img title=\"default.jpg\" src=\"/fleamarket/img/default.jsp&#10;\">";
				list.get(i).setBaContent(str);
			}
		}
		return list;
	}
}
