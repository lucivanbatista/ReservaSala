package springboot01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springboot01.model.Usuario;

@Controller
public class LoginController {
	
	@RequestMapping("/cadastrar")
	public String cadastrar(Model model, Usuario user){
		return "/login";
	}
	
}
