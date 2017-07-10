package springboot01.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErroController implements ErrorController{
	
	@RequestMapping(value = "/error")
	public String renderErrorPage(HttpServletRequest req, Model model) {

		String errorMsg = "";
		int httpErrorCode = getErrorCode(req);

		if(httpErrorCode == 400){
			errorMsg = " Desculpe Solicitação Imprópria";
			model.addAttribute("erro", errorMsg);
			return "ErrorPage";
		}
		else if(httpErrorCode == 401){
			errorMsg = "Desculpe Você Não Está Autorizado";
			model.addAttribute("erro", errorMsg);
			return "ErrorPage";
		}
		else if(httpErrorCode == 404){
			errorMsg = "Desculpe Não Conseguimos Encontrar o Que Você Requisitou";
			model.addAttribute("erro", errorMsg);
			return "ErrorPage";
		}
		else if(httpErrorCode == 500){
			errorMsg = "Desculpe Tivemos um Error no Servidor. Contate o Administrador so Sistema";
			model.addAttribute("erro", errorMsg);
			return "ErrorPage";
		}
		else if(httpErrorCode == 405){
			errorMsg = "O método especificado na Linha de Solicitação não é permitido para o recurso identificado pelo pedido."
					+ " Certifique-se de ter o tipo MIME apropriado configurado para o recurso que você está solicitando.";
			model.addAttribute("erro", errorMsg);
			return "ErrorPage";
		}
		else{
			model.addAttribute("erro", httpErrorCode);
			return "ErrorPage";	
		}
	}
	
	private int getErrorCode(HttpServletRequest httpRequest) {
		return (Integer) httpRequest.getAttribute("javax.servlet.error.status_code");
	}
	
	@Override
	public String getErrorPath() {
		return null;
	}
}
