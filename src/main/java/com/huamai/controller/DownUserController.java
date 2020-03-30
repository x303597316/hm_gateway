package com.huamai.controller;


import java.util.List;
import java.util.Map;


import com.huamai.service.DownUserService;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.CommonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.huamai.util.BasePageResult;


///add/dowUser.do
@Controller
@RequestMapping("/add")
public class DownUserController {

    @Autowired
    private DownUserService downUserService;


    /**
     * 用户首页
     * @return
     */
    @RequestMapping("/dowUser")
    public ModelAndView goPaper() {
        return new ModelAndView("backstage/paper/dowUser");
    }

    @RequestMapping("/addAndUpdate")
    public ModelAndView addAndUpdate(@RequestParam Map<String,Object> map) {
        ModelAndView model = new ModelAndView("backstage/paper/downUserEdit");
        if(map!=null) {
           Map<String,Object> mp= downUserService.selectByPrimaryKey(map);
            model.addObject("entity",mp);
        }
        return model;
    }


    @RequestMapping("/dowUserList")
    @ResponseBody
    public BasePageResult selectAllPaper(@RequestParam Map<String, Object> map) {
        return downUserService.selectAllPaper(map);
    }


    @RequestMapping("/delUser")
    @ResponseBody
    public BasePageResult deleteByPrimaryKey(@RequestParam Map<String,Object> map) {
        if(null!=map){
            downUserService.deleteByPrimaryKey(map);
        }

        return BasePageResultUtil.success();
    }

    @RequestMapping("/addUser")
    @ResponseBody
    public BasePageResult insertSelective(@RequestParam  Map<String,Object> map) {

        if (!CommonUtils.isNotEmpty(map.get("user_name").toString())) {
            return BasePageResultUtil.failResult(-1, "用户名不能为空");
        }
        if (!CommonUtils.isNotEmpty(map.get("password").toString())) {
            return BasePageResultUtil.failResult(-1, "用户密码不能为空");
        }
        if (!CommonUtils.isNotEmpty(map.get("phone").toString())) {
            return BasePageResultUtil.failResult(-1, "用户手机号码不能为空");
        }
        if (!CommonUtils.isNotEmpty(map.get("email").toString())) {
            return BasePageResultUtil.failResult(-1, "用户手机号码不能为空");
        }
        if (!CommonUtils.isNotEmpty(map.get("email").toString())) {
            return BasePageResultUtil.failResult(-1, "用户邮箱不能空");
        }


        List<Map<String, Object>> maps = downUserService.selectAllist(map);
        if (maps.size() >= 1) {
            return  BasePageResultUtil.failResult(2,"已经存在相同的用户了");

        }else{
           downUserService.insertSelective(map);
        }
   //    System.out.println("============"+BasePageResultUtil.success().toString());

        return BasePageResultUtil.success();
    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public BasePageResult updateByPrimaryKeySelective(@RequestParam Map<String,Object> map) {
        if (!CommonUtils.isNotEmpty(map.get("user_name").toString())) {
            return BasePageResultUtil.failResult(-1, "用户名不能为空");
        }
        if (!CommonUtils.isNotEmpty(map.get("password").toString())) {
            return BasePageResultUtil.failResult(-1, "用户密码不能为空");
        }
        if (!CommonUtils.isNotEmpty(map.get("phone").toString())) {
            return BasePageResultUtil.failResult(-1, "用户手机号码不能为空");
        }
        if (!CommonUtils.isNotEmpty(map.get("email").toString())) {
            return BasePageResultUtil.failResult(-1, "用户手机号码不能为空");
        }
        if (!CommonUtils.isNotEmpty(map.get("email").toString())) {
            return BasePageResultUtil.failResult(-1, "用户邮箱不能空");
        }

         downUserService.updateByPrimaryKeySelective(map);
        return BasePageResultUtil.success();
    }


}
