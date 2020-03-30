package com.huamai.controller;

import java.util.HashMap;
import java.util.Map;

import com.huamai.util.PropertyConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.Relation;
import com.huamai.entity.Solution;
import com.huamai.service.SolutionService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.Utils;

@Controller
@RequestMapping("/solution")
public class SulotionController {
	
	@Autowired
	private SolutionService Sservice;
	@PropertyConfig
	private  String imgPath;
	
	@RequestMapping("/solutionList")
	@ResponseBody
	public BasePageResult solutionList(@RequestParam Map<String,Object> map) {
		return Sservice.solutionList(map);
	}

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("backstage/solution/index");
		return mv;
	}
	
	@RequestMapping("/edit")
	public ModelAndView edit(@RequestParam(required=false) Integer id) {
		String imagePath=imgPath;
		/* String imagePath = Utils.readProperties("imgPath");*/
		ModelAndView mv = new ModelAndView("backstage/solution/edit");
		if(id!=null) {
			Solution entity = Sservice.select(id);
			mv.addObject("entity", entity);
		}
		mv.addObject("imagePath",imagePath);
		return mv;
	}
	
	@RequestMapping("/addorUpdate")
	@ResponseBody
	public BasePageResult addorUpdate(Solution entity) {
		if(entity.getId()!=null) {
			if(Sservice.update(entity))
				return BasePageResultUtil.success();
			return BasePageResultUtil.failResult(-1, "更新失败！");
		}
		if(Sservice.insert(entity))
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "新增失败！");
	}
	
	@RequestMapping("/drop")
	@ResponseBody
	public BasePageResult drop(@RequestParam Integer id) 
	{
		if(Sservice.delete(id))
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "删除失败");
	}
	
	/**
	 * 添加关联产品
	 */
	@RequestMapping("/productList")
	@ResponseBody
	public BasePageResult productList(@RequestParam Map<String,Object> map) {
		return BasePageResultUtil.success();
	}
	
	//关联产品页面
	@RequestMapping("/relationPage")
	public ModelAndView relationPage(@RequestParam Integer solutionId) {
		ModelAndView mv = new ModelAndView("backstage/solution/relationPage");
		mv.addObject("solutionId", solutionId);
		Map<String,Object> map = new HashMap<String, Object>();
		mv.addObject("productList", Sservice.ProductList(map));
		return mv;
	}
	
	/**
	 * 关联产品数据
	 */
	@RequestMapping("/relation")
	@ResponseBody
	public BasePageResult relation(@RequestParam Map<String,Object> map)
	{
		return Sservice.selectBysolution(map);
	}
	
	//删除关联
	@RequestMapping("/relationDrop")
	@ResponseBody
	public BasePageResult relationDrop(@RequestParam Integer id)
	{
		if(Sservice.relationDrop(id)) 
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "删除失败！");
	}
	
	//添加关联产品
	@RequestMapping("/relationAdd")
	@ResponseBody
	public BasePageResult addrelation(@RequestParam Map<String,Object> map) {
		Relation entity = new Relation();
		entity.setProductid(Integer.parseInt((String)map.get("productId")));
		entity.setSolutionid(Integer.parseInt((String)map.get("solutionId")));
		Integer result = Sservice.addrelation(entity);
		if(result==0) {
			return BasePageResultUtil.success();
		}else if(result==1){
			return BasePageResultUtil.failResult(-1, "添加失败！");
		}else if(result==2) {
			return BasePageResultUtil.failResult(-1, "不可重复添加！");
		}
		return BasePageResultUtil.failResult(-1, "添加失败！");
	}
}
