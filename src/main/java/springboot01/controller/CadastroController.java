package springboot01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springboot01.dao.UserDao;
import springboot01.model.Usuario;

@Controller
public class CadastroController {
	
	@Autowired
	private UserDao userdao;
	
	@PostMapping("/cadastrouser")
	public String insertUser(Model model, Usuario user, @RequestParam(value = "tipoUser") Integer tipoUser){
		model.addAttribute("usuario", user);
		user.setTipoUser(tipoUser);
		userdao.save(user);
		return "/login";
	}
	
	@RequestMapping("/cadastrar")
	public String cadastrar(Model model, Usuario user){
		return "/login";
	}
	
	@RequestMapping("/cadastro")
	public String cadastrar(){
		return "/cadastro";
	}

}
