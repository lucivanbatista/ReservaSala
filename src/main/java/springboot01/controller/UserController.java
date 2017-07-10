package springboot01.controller;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springboot01.dao.UserDao;
import springboot01.model.Usuario;

@Controller
public class UserController {
	
	@Autowired
	private UserDao userdao;
	
	@PostMapping("/cadastrouser")
	public String insertUser(Model model, Usuario user, @RequestParam(value = "tipoUser") Integer tipoUser){
		model.addAttribute("usuario", user);
		user.setTipoUser(tipoUser);
		userdao.save(user);
		return "/login";
	}
	
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
		
		if(user.getTipoUser() == 0){
			return "forward:/sala/managersalas";
		}else if(user.getTipoUser() == 1 || user.getTipoUser() == 2){
			return "forward:/indexuser";
		}else{
			return "/login";
		}
	}
	
	@RequestMapping("/cadastro")
	public String cadastrar(){
		return "/cadastro";
	}
	
	@RequestMapping(value = {"/", "/login"})
    public String home() {
        return "/login";
    }
	
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
