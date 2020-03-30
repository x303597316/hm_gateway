package com.huamai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class DownLogController {

    @RequestMapping("/vIndexdown")
    public ModelAndView vIndex(HttpSession session)
    {
        ModelAndView model = new ModelAndView("backstage/paper/paperDownListIn");


        return model;
    }
}
