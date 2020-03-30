package com.huamai.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.Message;
import com.huamai.service.MessageService;
import com.huamai.util.BasePageResult;

@Controller
@RequestMapping("/Message")
public class MessageController {
	@Autowired
	private MessageService messageService;
	@RequestMapping("/goMes")
	public ModelAndView goMes() {
		ModelAndView model=new ModelAndView("backstage/message/messagelist");
		return model;
	}
	@RequestMapping("/mesList")
	@ResponseBody
	public BasePageResult findAllMes(@RequestParam Map<String, Object> map) {
		return messageService.findAllMes(map);
	}
	@RequestMapping("/mesAlone")
	@ResponseBody
	public Message findById(Integer id) {
		return messageService.findById(id);
	}
}
