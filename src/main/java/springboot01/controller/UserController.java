package springboot01.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springboot01.dao.UserDao;
import springboot01.model.Usuario;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userdao;
	
	@RequestMapping(value = "indexuser")
	public String homeuser(){
		return "user/indexuser";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req){
		req.getSession().removeAttribute("user");
		if(req.getSession() != null){
			req.getSession().invalidate();
		}
		return "redirect:/login";
	}
	
	@PostMapping("/atualizaruser")
	public String atualizarUser(Model model, Usuario user, HttpServletRequest req){
		//OBSERVAÇÃO ---- SERÁ QUE QUANDO EU ALTERAR OS VALORES, EU VOU TER QUE RESETAR A SESSÃO?
		userdao.save(user);
		model.addAttribute("user", user);
		req.getSession().invalidate();
		return "redirect:/login";
	}
	
	@RequestMapping("/updateuser")
	public String updateuser(){
		return "user/updateuser";
	}
	
	@RequestMapping("/sobre")
	public String sobre(){
		return "user/sobre";
	}
}
