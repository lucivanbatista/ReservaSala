package springboot01.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import springboot01.dao.RoomDao;
import springboot01.model.Sala;
import springboot01.model.Usuario;

@Controller
public class SalasController {
	
	@Autowired
	private RoomDao saladao;
	
	@PostMapping(value = "/criarsalas")
	public String createSala(@Valid Sala sala, BindingResult result, Model model, RedirectAttributes redirectAttributes) {	
		List<Sala> salas = saladao.findAll();
		for(Sala s : salas){
			if(s.getBloco().equals(sala.getBloco()) && s.getnPorta().equals(sala.getnPorta())){
				return "sala/managersalas";
			}
		}
		
		if(result.hasErrors()) {
			model.addAttribute("sala", sala);
			return "sala/managersalas";
		}
		
		saladao.save(sala);
		redirectAttributes.addFlashAttribute("msg", "Sala inserida com sucesso.");
		return "sala/managersalas";
	}
	
	@GetMapping("/showsalas")
	public String show(Model model, @SessionAttribute("user") Usuario user) {
		List<Sala> salas = saladao.findAll();
		model.addAttribute("salas", salas);
		if(user.getTipoUser() == 0){
			return "sala/managersalas";
		}else{
			return "sala/usersala";
		}
	}
	
	//Método usado no showsalasby para retornar apenas a lista de salas
	public List<Sala> getsalasby(String nPorta, String bloco){
		List<Sala> salas = new ArrayList<>();
		if(nPorta.isEmpty() || nPorta == null || nPorta.equals("")){
			salas = saladao.findByBloco(bloco);
		}else if(bloco.isEmpty() || bloco == null || bloco.equals("")){
			salas = saladao.findBynPorta(nPorta);
		}else if((nPorta.isEmpty() || nPorta == null || nPorta.equals("")) && (bloco.isEmpty() || bloco == null || bloco.equals(""))){
			return null;
		}else{
			salas = saladao.findBynPortaAndBloco(nPorta, bloco);
		}
		return salas;
	}
	
	@GetMapping("/showsalasby")
	public String showsalasby(Model model, @SessionAttribute("user") Usuario user, @RequestParam("nPortafiltro") String nPorta, @RequestParam("blocofiltro") String bloco){
		List<Sala> salas = null;
		if(nPorta.equals("") && bloco.equals("")){
			salas = saladao.findAll();
		}else{
			salas = getsalasby(nPorta, bloco);
		}
		
		model.addAttribute("salas", salas);
		if(user.getTipoUser() == 0){
			return "sala/managersalas";
		}else{
			return "sala/usersala";
		}
	}
	
	@GetMapping(value = "/deletarsalas/{id}")
	public String delete(Model model, @PathVariable Integer id){
		saladao.delete(id);
		model.addAttribute("salas", saladao.findAll());
		return "redirect:/managersalas";
	}
	
	@PostMapping(value = "/atualizarsalas")
	public String atualizar(Model model, Sala sala){
		saladao.save(sala);
		model.addAttribute("sala", sala);
		model.addAttribute("salas", saladao.findAll());
		return "sala/managersalas";
	}
	
	@RequestMapping("/managersalas")
	public String managersalas(){
		return "sala/managersalas";
	}
	
	@RequestMapping("/usersala")
	public String usersala(){
		return "sala/usersala";
	}
	
//	@RequestMapping(value = "/criarsalas", method = RequestMethod.POST)
//	public String create(Model model, @Valid Sala sala, BindingResult result, RedirectAttributes redirectAttributes) {	
//			model.addAttribute("sala", sala);
//
//		new SalaDAO().insertSala(sala.getnPorta(), sala.getBloco(), sala.getDescricao());
//		return "sala/managersalas";
//	}
//	
//	@RequestMapping("/showsalas")
//	public String show(Model model) {
//		List<Sala> salas = new SalaDAO().selectAllSala();
//		model.addAttribute("salas", salas);
//    	return "sala/managersalas";
//	}
//	
//	@RequestMapping(value = "/deletarsalas", method = RequestMethod.POST)
//	public String delete(Model model, @RequestParam(value = "idremove") int id){
//		SalaDAO saladao = new SalaDAO();
//		saladao.deleteSalaById(id);
//		model.addAttribute("salas", saladao.selectAllSala());
//		return "sala/managersalas";
//	}
//	
//	@RequestMapping(value = "/atualizarsalas", method = RequestMethod.POST)
//	public String atualizar(Model model, @RequestParam(value = "idupdate") int id, @RequestParam(value = "nportaupd") String nPorta, @RequestParam(value = "blocoupd") String bloco, @RequestParam(value = "descupd") String descricao){
//		Sala sala = new Sala(id, nPorta, bloco, descricao);
//		model.addAttribute("sala", sala);
//		SalaDAO saladao = new SalaDAO();
//		saladao.updateSalaById(sala.getId(), sala.getnPorta(), sala.getBloco(), sala.getDescricao());
//		model.addAttribute("salas", saladao.selectAllSala());
//		return "sala/managersalas";
//	}
//	
//	@RequestMapping("/managersalas")
//	public String managersalas(){
//		return "sala/managersalas";
//	}
}
