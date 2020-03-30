package com.huamai.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huamai.entity.*;
import com.huamai.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.service.InfoService;
import com.huamai.service.InvestorService;
import com.huamai.service.MessageService;
import com.huamai.service.NewsService;
import com.huamai.service.PaperService;
import com.huamai.service.ProductService;
import com.huamai.service.SolutionService;

@RequestMapping("/proscenium")
@Controller
public class ProsceniumController {
	@Autowired
	private MessageService messageService;

	@Autowired
	private ProductService productservice;
	
	@Autowired
	private SolutionService solutionservice;
	
	@Autowired
	private InfoService infoservice;
	
	@Autowired
	private PaperService paperService;

	@Autowired
	private InvestorService investorService;
	
	@Autowired
	private NewsService newservice;
	/**
	 * 使用注解的方式引入properties文件的key，可以得到value值
	 */
	@PropertyConfig
	private  String file_upload_url;

	@PropertyConfig
	private  String imgPath;
	/**
	 * 首页
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("/frontView/index");
		return mv;
	}
	
	//走进华脉
	@RequestMapping("/zjhm")
	public ModelAndView zjhm(@RequestParam(required=false) Integer id) {
		ModelAndView mv = new ModelAndView("/frontView/zjhm");
		if(id==null) {
			id=0;
		}
		CompanyInfo c = infoservice.select(id);
		mv.addObject("entity", c);
		return mv;
	}

	
	//跳转联系我们页面
	@RequestMapping("/lxwm")
	public ModelAndView lxwm() {
		ModelAndView mv = new ModelAndView("/frontView/lxwm");
		return mv;
	}
	
	//保存留言
	@RequestMapping("/save")
	@ResponseBody
	public int insertSelective(Message record) {
		return messageService.insertSelective(record);
	}
	
	//产品中心
	@RequestMapping("/cpzx")
	public ModelAndView cpzx(@RequestParam(required=false) Integer id)
	{
		/* String imagePath = Utils.readProperties("imgPath");*/
		String imagePath =imgPath;
		ModelAndView mv = new ModelAndView("/frontView/cpzx");
		Product p = new Product();
		if(id==null) {
			List<Product> productList = productservice.selectChild(0);
			mv.addObject("entityList", productList);
		}else {
			p=productservice.selectByPrimerykey(id);
			List<Product> productList = productservice.selectChild(id);
			p.setNodelist(productList);
			mv.addObject("entity", p);
			
		}
		mv.addObject("imagePath",imagePath);
		return mv;
	}
	
	//产品下拉列表
	@RequestMapping("/productList")
	@ResponseBody
	public BasePageResult productList() {
		return BasePageResultUtil.success(productservice.selectlist());
	}
	
	//解决方案
	@RequestMapping("/jjfa")	
	public ModelAndView jjfa(@RequestParam(required=false) Integer id,@RequestParam(required=false) String type) {
		ModelAndView mv = new ModelAndView("/frontView/jjfa");
		String imagePath =imgPath;
		/*String imagePath = Utils.readProperties("imgPath");*/
		if(id!=null) {
			Solution s = solutionservice.select(id);
			List<Product> productlist = solutionservice.selectProduct(id);//关联产品列表
			mv.addObject("entity", s);
			mv.addObject("productlist",productlist );
		}
		if(type!=null) {
			mv.addObject("solutionType", type);
			List<Solution> l = solutionservice.selectList(type);
			mv.addObject("entitylist", l);
		}
		mv.addObject("imagePath",imagePath);
		return mv;
	}
	
	
	
	
	//技术支持
	@RequestMapping("/jszc")
	public ModelAndView jszc(HttpServletRequest request , HttpServletResponse response, Model model) {
		ModelAndView mv = new ModelAndView("/frontView/jszc");
		model.addAttribute("type", "1");
		return mv;
	}
	
	//营销网络
	@RequestMapping("/yxwl")
	public ModelAndView yxwl() {
		ModelAndView mv = new ModelAndView("/frontView/yxwl");
		return mv;
	}
	
	//新闻中心
	@RequestMapping("/xwzx")
	public ModelAndView xwzx(@RequestParam(required=false) Integer id,@RequestParam(required=false) String newType) {
		ModelAndView mv = new ModelAndView("/frontView/xwzx");
		String imagePath=imgPath;
		/*String imagePath = Utils.readProperties("imgPath");*/
		if(id!=null) {
			News entity = newservice.selectByprimerykey(id);
			mv.addObject("entity", entity);
		}
		if(newType!=null) {
			mv.addObject("newType", newType);
		}
		mv.addObject("imagePath",imagePath);
		return mv;
	}
	
	//新闻中心分页数据
	@RequestMapping("/pageNews")
	@ResponseBody
	public Map<String,Object> pageNews(@RequestParam Map<String,Object> map) {
		Map<String,Object> mapRes = new HashMap<String,Object>();
		Integer pagenum = Integer.parseInt((String)map.get("pagenum"));
		Integer size = Integer.parseInt((String)map.get("size"));
		map.put("pagenum", pagenum);
		map.put("size", size);
		List<News> list =   newservice.selectNewsType(map);
		if(!list.isEmpty()) {
			mapRes.put("record", 0);
			mapRes.put("data", list);
		}else {
			mapRes.put("record", 1);
			mapRes.put("msg", "没有数据哦！");
		}
		return mapRes;
	}
	
	//新闻数据条数
	@RequestMapping("/pageCount")
	@ResponseBody
	public BasePageResult pageCount(@RequestParam Map<String,String> map) {
		return BasePageResultUtil.success(newservice.getCount(map));
	}
	
	//新闻中心详情加载
	@RequestMapping("/getNewsDetail")
	@ResponseBody
	public BasePageResult getNewsDetail(@RequestParam Integer id) {
		News entity = new News();
		entity = newservice.selectByprimerykey(id);
		entity.setVisittime(entity.getVisittime()+1);
		newservice.saveOrUpdate(entity);
		return BasePageResultUtil.success(entity);
	}
	
	//投资者关系
	@RequestMapping("/tzzgx")
	public ModelAndView tzzgx(@RequestParam(required=false) String type) {
		
		ModelAndView mv = new ModelAndView("/frontView/tzzgx");
		mv.addObject("type",type);
		return mv;
	}
	
	/**
	 * 联系我们
	 */
	@RequestMapping("/ContactUs")
	public ModelAndView ContactUs()
	{
		ModelAndView mv = new ModelAndView("/frontView/lxwm");
		return mv;
	}
	
	//留言
	@RequestMapping("/submitContact")
	public BasePageResult submitContact(Message entity) {
		
		return BasePageResultUtil.success();
	}
	
	//招贤纳士
	@RequestMapping("/zxns")
	public ModelAndView zxns(HttpServletRequest request , HttpServletResponse response, Model model)
	{
		ModelAndView mv = new ModelAndView("/frontView/zxns");
		model.addAttribute("info", 0);
		return mv;
	}
	
	/**
	 * 产品中心开始
	 */
	//导航栏加载
	@RequestMapping("/navigation")
	@ResponseBody
	public BasePageResult navigation() {
		List<Product> productList = productservice.getTreeList();
		return BasePageResultUtil.success(productList);
	}
	
	
	
	/**
	 * 产品中心结束
	 */
	
	//解决方案菜单加载 
	@RequestMapping("/jjfanavigation")
	@ResponseBody
	public BasePageResult jjfanavigation() {
		List<Solution> l1 = solutionservice.selectList("1");
		List<Solution> l2 = solutionservice.selectList("2");
		List<Solution> l3 = solutionservice.selectList("3");
		List<Solution> l4 = solutionservice.selectList("4");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list1", l1);
		map.put("list2", l2);
		map.put("list3", l3);
		map.put("list4", l4);
		return BasePageResultUtil.success(map);
	}
	
	
	@RequestMapping("/paperList")
	@ResponseBody
	public BasePageResult selectAllPaper(@RequestParam Map<String, String> map,HttpSession session) {

		String imgPath1=imgPath;
		/*String imgPath = CommonUtils.readProperties("imgPath");		//图片上传地址*/
    	session.setAttribute("imgPath",imgPath1);
		return paperService.selectAllPaper(map);
	}
	@RequestMapping("/getInvestoById")
	@ResponseBody
	public Map<String,Object> getInvestoById(@RequestParam Map<String,Object> map)
	{
		Map<String,Object> mapRes = new HashMap<String,Object>();
		String id =(String) map.get("id");
		Investor investor =   investorService.getInvestorById(id);
		if(investor != null) {
			mapRes.put("record", 0);
			mapRes.put("data", investor);
		}else {
			mapRes.put("record", 1);
			mapRes.put("msg", "没有数据哦！");
		}
		return mapRes;
	}

	
	@RequestMapping("/singlePaper")
	@ResponseBody
	public Paper selectByPrimaryKey(@RequestParam Integer id) {
		return paperService.selectByPrimaryKey(id);
	}
	
	//文件下载
	@RequestMapping("/download")
	@ResponseBody
	public HttpServletResponse download(String filePath, HttpServletResponse response) {
        try {
        	String file_upload_url1 =file_upload_url;
        	/*String file_upload_url = Utils.readProperties("file_upload_url");*/
            // path是指欲下载的文件的路径。
            File file = new File(file_upload_url1+filePath);
            // 取得文件名。
            String filename = file.getName();
            // 取得文件的后缀名。
            //String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();


            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(file_upload_url1+filePath));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
            response.addHeader("Content-Length", "" + file.length());
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return null;
    }
	
	//产品中心树结构加载数据
	@RequestMapping("/ztree")
	public ModelAndView ztree() {
		return new ModelAndView("/frontView/ztree");
	}

	//文件下载(要登录才可以下载)
	@RequestMapping("/downloadcheck")
	@ResponseBody
	public HttpServletResponse downloadcheck(@RequestParam Map<String,Object> map, String filePath, HttpServletResponse response,
											 HttpServletRequest request) {
		try {

			String dowUser = (String) map.get("DowUser");
			if("".equals(dowUser)||null==dowUser){
				//重定向到下载登陆页面
				response.sendRedirect(request.getContextPath() + "/href/downGo/vDowngo.do");

			}else{
				/*String file_upload_url = Utils.readProperties("file_upload_url");*/
				String file_upload_url1 =file_upload_url;
				// path是指欲下载的文件的路径。
				File file = new File(file_upload_url1+filePath);
				// 取得文件名。
				String filename = file.getName();
				// 取得文件的后缀名。
				//String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();


				// 以流的形式下载文件。
				InputStream fis = new BufferedInputStream(new FileInputStream(file_upload_url1+filePath));
				byte[] buffer = new byte[fis.available()];
				fis.read(buffer);
				fis.close();
				// 清空response
				response.reset();
				// 设置response的Header
				response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
				response.addHeader("Content-Length", "" + file.length());
				OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
				response.setContentType("application/octet-stream");
				toClient.write(buffer);
				toClient.flush();
				toClient.close();
			}

		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return null;
	}

}
