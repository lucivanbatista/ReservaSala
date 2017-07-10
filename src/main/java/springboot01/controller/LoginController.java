package springboot01.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springboot01.dao.UserDao;
import springboot01.model.Usuario;

@Controller
public class LoginController {
	
	@Autowired
	private UserDao userdao;
	
	@PostMapping("/logar")
	public String logar(Model model, @RequestParam(value = "user") String email, @RequestParam(value = "senha") String senha, HttpServletRequest req){ 
		
		Usuario user = userdao.findByEmailAndSenha(email, senha);
		if(user == null){
			return "/login";
		}
		
		req.getSession().setAttribute("user", user);
		model.addAttribute(user);
//		model.addAttribute("sala", new Sala());
//		model.addAttribute("salas", new Sala());
		
		if(user.getTipoUser() == 0 || user.getTipoUser() == 1 || user.getTipoUser() == 2){
			return "forward:/user/indexuser";
		}else{
			return "/login";
		}
	}
	
	@RequestMapping(value = {"/", "/login"})
    public String home() {
        return "/login";
    }
	
}
