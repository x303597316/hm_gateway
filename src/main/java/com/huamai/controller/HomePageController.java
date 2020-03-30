package com.huamai.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.Div;
import com.huamai.service.DivService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.Utils;


@Controller
@RequestMapping("/home")
public class HomePageController {
	//private static Logger logger = (Logger) LoggerFactory.getLogger(HomePageController.class);
	
	@Autowired
	private DivService divService;
	
	//打开编辑页
		@RequestMapping("/edit")
		public ModelAndView index(@RequestParam Map<String,Object> params) {
			ModelAndView mv = new ModelAndView("backstage/div/edit");
			mv.addObject("info", params);
			return mv;
		}
	
		@RequestMapping("/divUpdate")
		public ModelAndView divUpdate(@RequestParam(value = "div_id") String div_id)
		{
			ModelAndView mv = new ModelAndView("backstage/div/edit");
			if(div_id!=null) {
				String imagePath = Utils.readProperties("imgPath");
				Integer key = Integer.parseInt(div_id);
				Div entity = divService.selectById(key);
				mv.addObject("entity", entity);
				mv.addObject("imagePath", imagePath);
			}
			return mv;
		}
		@RequestMapping("/insertOrUpdate")
		@ResponseBody
		public BasePageResult insertOrUpdate(@RequestParam Map<String,Object> map)
		{
			Date date =  new Date();
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 String div_updatetime =  formatter.format(date);
			 map.put("div_updatetime", div_updatetime);
			if(divService.insertOrUpdate(map)) {
				return BasePageResultUtil.success();
			}
			return BasePageResultUtil.failResult(-1, "操作失败!");
		}
		
		@RequestMapping("/getDivList")
		@ResponseBody
		public BasePageResult getBannerList(@RequestParam Map<String, Object> map)
		{
			return divService.getDivList(map);
		}
	
		@RequestMapping("/deleteDiv")
		@ResponseBody
		public BasePageResult deleteDiv(Integer div_id) {
			if(divService.deleteDiv(div_id)) {
				return BasePageResultUtil.success();
			}
			return BasePageResultUtil.failResult(-1, "操作失败!");
		}
}
