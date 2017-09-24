package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController 
{
	@RequestMapping("/new")
	public ModelAndView hellofirst()
	{
		ModelAndView mav = new ModelAndView("Header");
		System.out.println("in controller");
		return mav;
	}

	
	
}
