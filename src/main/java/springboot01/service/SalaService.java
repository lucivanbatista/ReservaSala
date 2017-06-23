package springboot01.service;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import springboot01.dao.SalaDAO;
import springboot01.model.Sala;

@Component
public class SalaService {

//	public String createSala(Model model, Sala sala){
//		SalaDAO saladao = new SalaDAO();
//		saladao.insertSala(sala.getnPorta(), sala.getBloco(), sala.getDescricao());
//		model.addAttribute("salas", saladao.selectAllSala());
//		return "managersalas";
//	}
	
//	public String removeSala(Model model, int id){
//		SalaDAO saladao = new SalaDAO();
//		saladao.deleteSalaById(id);
//		model.addAttribute("salas", saladao.selectAllSala());
//		return "managersalas";
//	}
	
//	public String updateSala(Model model, Sala sala){
//		SalaDAO saladao = new SalaDAO();
//		saladao.updateSalaById(sala.getId(), sala.getnPorta(), sala.getBloco(), sala.getDescricao());
//		model.addAttribute("salas", saladao.selectAllSala());
//		return "managersalas";
//	}
}
