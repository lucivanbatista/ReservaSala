package springboot01.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{

//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//		
//		String uri = request.getRequestURI();
//		if(uri.endsWith("/")){
//			System.out.println("Opção 1" + uri);
//			response.sendRedirect("/");
//			return true;
//		}else if(request.getSession().getAttribute("user") != null){
//			System.out.println("Opção 2" + uri);
//			if(uri.contains("/login") || (uri.contains("/cadastro"))){
//				response.sendRedirect("/");
//				return true;
//			}
//			else if(request.getSession().getAttribute("admin").equals("yes") && (uri.startsWith("/adm"))){
//				return true;
//			}
//			else if(request.getSession().getAttribute("admin").equals("yes") && (uri.startsWith("/usuario"))){
//				response.sendRedirect("/adm");
//				return true;	
//			}
//			else if(request.getSession().getAttribute("admin").equals("no") && (uri.startsWith("/usuario"))){
//				return true;
//			}
//			else if(request.getSession().getAttribute("admin").equals("no") && (uri.startsWith("/adm"))){
//				response.sendRedirect("/");
//				return true;	
//			}
//			else{
//				response.sendRedirect("/");
//				return true;
//			}
//		}
//		else if((uri.startsWith("/adm") || uri.startsWith("/usuario")) && request.getSession().getAttribute("usuario") == null){
//			System.out.println("Opção 3" + uri);
//			response.sendRedirect("/");
//			return true;
//		}
//		else if((uri.startsWith("/login") || uri.startsWith("/cadastro")) && request.getSession().getAttribute("usuario") == null){
//			return true;
//		}
//		else{
//			System.out.println("Opção 4" + uri);
//			response.sendRedirect("/error");
//			return true;
//		}
//		
//	}
}
