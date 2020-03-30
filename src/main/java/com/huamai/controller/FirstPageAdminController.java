package com.huamai.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.huamai.util.PropertyConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.Banner;
import com.huamai.service.BannerService;
import com.huamai.util.BasePageResult;
import com.huamai.util.Utils;

@Controller
@RequestMapping("/firstpage")
public class FirstPageAdminController {
	@PropertyConfig
	private String imgPath;
	@Autowired
	private BannerService bannerService;

	// 打开编辑页
	@RequestMapping("/edit")
	public ModelAndView index(@RequestParam Map<String, Object> params) {
		ModelAndView mv = new ModelAndView("backstage/config/edit");
		mv.addObject("info", params);
		return mv;
	}

	@RequestMapping("/getBannerList")
	@ResponseBody
	public BasePageResult getBannerList(@RequestParam Map<String, String> map) {
		return bannerService.getBannerList(map);
	}

	// 添加轮播图
	@RequestMapping("/insertOrUpdate")
	@ResponseBody
	public Map<String, Object> addOrUpdateBanner(@RequestParam Map<String, String> map) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		if (map.get("banner_id").isEmpty()) {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			map.put("createtime", sdf.format(date));
			//int a = bannerService.insertBanner(map);
			bannerService.insertBanner(map);
			resMap.put("code", 0);
			resMap.put("msg", "添加成功");
		} else {
			//int b = bannerService.updateBanner(map);
			bannerService.updateBanner(map);
			resMap.put("code", 0);
			resMap.put("msg", "修改成功");
		}
		return resMap;
	}

	@RequestMapping("/bannerUpdate")
	public ModelAndView bannerUpdate(@RequestParam(value = "banner_id") String banner_id) {
		ModelAndView mv = new ModelAndView("backstage/config/edit");
		if (banner_id != null) {
			Integer key = Integer.parseInt(banner_id);
			Banner entity = bannerService.selectById(key);
			String imagePath =imgPath;
			/*String imagePath = Utils.readProperties("imgPath");*/
			String image = entity.getBanner_image();
			if (isPicture(image)) {
				mv.addObject("isimage",true);
			}else {
				mv.addObject("isimage",false);
			}
				mv.addObject("entity", entity);
			mv.addObject("imagePath", imagePath);
		}
		return mv;
	}

	public static boolean isPicture(String pInput){
		// 获得文件后缀名
		String tmpName = pInput.substring(pInput.lastIndexOf(".") + 1, pInput.length());
		// 声明图片后缀名数组
		String[] strArray = { "bmp","dib","gif","jfif","jpe","jpeg","jpg","png","tif","tiff","ico"};
		// 遍历名称数组
		for (int i = 0; i < strArray.length; i++) {
			// 判断单个类型文件的场合
			if (strArray[i].equals(tmpName.toLowerCase())) {
				return true;
			}
		}
		return false;
	}

	// 删除轮播图
	@RequestMapping("/deleteBannerById")
	@ResponseBody
	public Map<String, Object> deleteBannerById(HttpServletRequest req) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(req.getParameter("banner_id"));
		map.put("banner_id", req.getParameter("banner_id"));
		Map<String, Object> resMap = new HashMap<String, Object>();
		//int a = bannerService.deleteBannerById(map);
		bannerService.deleteBannerById(map);
		resMap.put("code", 0);
		resMap.put("msg", "删除成功");

		return resMap;
	}
}
