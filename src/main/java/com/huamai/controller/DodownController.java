package com.huamai.controller;

import com.huamai.constant.SysConstant;
import com.huamai.dto.TreeNodeS;
import com.huamai.entity.DowUser;
import com.huamai.entity.Role;
import com.huamai.entity.User;
import com.huamai.service.DownUserService;
import com.huamai.util.CommonUtils;
import com.huamai.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/href/downGo")
public class DodownController {

    @Autowired
    private DownUserService downUserService;

    @RequestMapping("/vDowngo")
    public ModelAndView goPaper() {
        return new ModelAndView("backstage/ziliao/login");
    }

    /**
     * 内部资料下载登陆
     * @param map
     * @param session
     * @param request
     * @return
     */
    @RequestMapping("/dowlogin")
    public ModelAndView login(@ModelAttribute("entity") DowUser entity, HttpSession session, HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        DowUser user = downUserService.selectByName(entity.getUserName());
        session.removeAttribute("errorMsg");

        if (user == null)
        {
            model.setViewName("backstage/ziliao/login");
            session.setAttribute("errorMsg", "用户不存在");
            return model;
        }
        String pass = MD5Util.getMD5(entity.getPassword());
        if (!pass.equals(MD5Util.getMD5(user.getPassword())))
        {
            model.setViewName("backstage/ziliao/login");
            session.setAttribute("errorMsg", "用户密码不正确");
            return model;
        }
        session.removeAttribute("errorMsg");

        session.setAttribute(SysConstant.DowUserSession, user);
        model = new ModelAndView(new RedirectView(request.getContextPath() + "/vIndexdown.do"));
        String imgPath = CommonUtils.readProperties("imgPath");		//图片上传地址
        session.setAttribute("imgPath",imgPath);
        return model;
    }

  /*  @RequestMapping("/vIndexdown")
    public ModelAndView vIndex(HttpSession session)
    {
        ModelAndView model = new ModelAndView("backstage/index/hello");


        return model;
    }*/

}
