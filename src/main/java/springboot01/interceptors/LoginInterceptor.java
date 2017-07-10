package springboot01.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import springboot01.model.Usuario;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String uri = request.getRequestURI();
		Usuario user = (Usuario) request.getSession().getAttribute("user");
		if(request.getSession().getAttribute("user") != null){
			if(user.getTipoUser() == 0){ //ADMIN
				if(uri.contains("login") || (uri.contains("cadastro"))){
					response.sendRedirect("/managersalas");
					return true;
				}else{
					return true;
				}
			}else if(user.getTipoUser() == 1 || user.getTipoUser() == 2){
				if(uri.contains("login") || (uri.contains("cadastro"))){
					response.sendRedirect("/indexuser");
					return true;
				}else if(uri.contains("logar")){
					response.sendRedirect("/indexuser");
				}else if(uri.contains("managersalas")){
					response.sendRedirect("/indexuser");
				}else{
					return true;
				}
			}
		}else if(request.getSession().getAttribute("usuario") == null){
			if(uri.contains("login") || uri.contains("cadastro")){
				return true;
			}else{
				response.sendRedirect("/login");
				return true;
			}
		}else{
			response.sendRedirect("/error");
			return true;
		}
		return false;
	}
}
