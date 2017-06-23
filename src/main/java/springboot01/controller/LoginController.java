package springboot01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springboot01.dao.UsuarioDAO;
import springboot01.model.Usuario;

@Controller
public class LoginController {

//	@RequestMapping(value = {"/", "/login"})
//    public String home() {
//        return "/login";
//    }
//	
//	@RequestMapping("/logar")
//	public String logar(Model model, @RequestParam(value = "user") String email, @RequestParam(value = "senha") String senha){
//		Usuario user = new UsuarioDAO().selectUserByEmailSenha(email, senha);
//		if(user == null){
//			System.out.println("NÃO EXISTE ESSE USUÁRIO");
//			return "/login";
//		}
//		
//		if(user.getTipoUser() == 0){
//			System.out.println("É ADMIN");
//			return "sala/managersalas";
//		}else{
//			System.out.println("É USUÁRIO PROFESSOR OU ALUNO");
//			return "sala/managersalas";
//		}
//	}
	
	@RequestMapping("/cadastrar")
	public String cadastrar(Model model, Usuario user){
		return "/login";
	}
	
}
