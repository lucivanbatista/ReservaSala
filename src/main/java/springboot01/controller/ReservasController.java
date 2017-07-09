package springboot01.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import springboot01.dao.ReserveDao;
import springboot01.dao.RoomDao;
import springboot01.model.Reserva;
import springboot01.model.Sala;
import springboot01.model.Usuario;

@Controller
public class ReservasController {
	
	@Autowired
	private ReserveDao reservedao;
	
	@Autowired
	private RoomDao saladao;
	
	@PostMapping(value = "/criarreserva")
	public String insertReserva(Model model, Reserva r, @SessionAttribute("user") Usuario user, @RequestParam(value = "idSala") Integer idsala,
			@RequestParam(value = "horarior") String horario, @RequestParam(value = "diar") Integer dia, @RequestParam(value = "mesr") Integer mes){
		Sala sala = saladao.findOne(idsala);
		Reserva rnew = new Reserva(r.getId(), user, sala, r.getDescricao(), horario, dia, mes);
		List<Reserva> reservas = reservedao.findAll();
		for(Reserva reserva : reservas){		
			if(reserva.getMes() == rnew.getMes() && reserva.getDia() == rnew.getDia() && reserva.getHorario().equals(rnew.getHorario()) && reserva.getSala().getId() == rnew.getSala().getId()){
				if(user.getTipoUser() == 2 && reserva.getUser().getTipoUser() == 1){
					reservedao.delete(reserva.getId());
					break;
				}else{
					if(user.getTipoUser() == 0){
						return "reserva/managerreservas";
					}else{
						return "sala/usersala";
					}
				}
			}
		}
		
		model.addAttribute("reserva", rnew);
		reservedao.save(rnew);
		if(user.getTipoUser() == 0){
			return "reserva/managerreservas";
		}else{
			return "sala/usersala";
		}
	}
	
	@GetMapping(value = "/showallmyreservas")
	public String showAllMyReserva(Model model, @SessionAttribute("user") Usuario user){
		List<Reserva> reservas = reservedao.findByUser(user);
		model.addAttribute("reservas", reservas);
		if(user.getTipoUser() == 0){
			return "reserva/managerreservas";
		}else{
			return "reserva/usermyreserva";
		}
	}
	
	@GetMapping(value = "/showallreservas")
	public String showAllReserva(Model model){
		List<Reserva> reservas = reservedao.findAll();
		model.addAttribute("reservas", reservas);
		return "reserva/managerreservas";
	}
	
//	
//	@GetMapping(value = "/visualizarreservaby")
//	public String showReservaBy(Model model, @RequestParam(value = "") String , ){
//		
//	}
	
	@GetMapping(value = "/deletereserva/{id}")
	public String deleteReserva(Model model, @PathVariable Integer id, @SessionAttribute("user") Usuario user){
		reservedao.delete(id);
		model.addAttribute("reservas", reservedao.findByUser(user));
		if(user.getTipoUser() == 0){
			return "redirect:/managerreservas";
		}else{
			return "redirect:/usermyreserva";
		}
	}
	
	@PostMapping(value = "/updatereserva")
	public String updateReserva(Model model, Reserva r, @SessionAttribute("user") Usuario user, @RequestParam("idSala") Integer idsala,
			@RequestParam(value = "horarior") String horario, @RequestParam(value = "diar") Integer dia, @RequestParam(value = "mesr") Integer mes){
		Sala sala = saladao.findOne(idsala);
		r.setUser(user);
		r.setSala(sala);
		r.setHorario(horario);
		r.setDia(dia);
		r.setMes(mes);
		reservedao.save(r);
		model.addAttribute("reserva", r);
		model.addAttribute("reservas", reservedao.findByUser(user));
		if(user.getTipoUser() == 0){
			return "redirect:/managerreservas";
		}else{
			return "redirect:/usermyreserva";
		}
	}
	
	@RequestMapping("/managerreservas")
	public String managerreservas(){
		return "reserva/managerreservas";
	}
	
	@RequestMapping("/usermyreserva")
	public String usermyreserva(){
		return "reserva/usermyreserva";
	}
	
	//Método usado no getreservasby para retornar apenas a lista de reservas
	public List<Reserva> getreservasby(Sala sala, String horario, Integer dia, Integer mes){
		List<Reserva> reservas = null;
		
		if((horario.isEmpty() || horario.equals("")) && (dia == null) && (mes == null)){
			reservas = reservedao.findBySala(sala);
		}else if((horario.isEmpty() || horario.equals("")) && (dia == null)){ // Apenas Mês para Pesquisar
			reservas = reservedao.findBySalaAndMes(sala, mes);
		}else if((horario.isEmpty() || horario.equals("")) && (mes == null)){ // Apenas Dia para Pesquisar
			reservas = reservedao.findBySalaAndDia(sala, dia);
		}else if((mes == null && dia == null )){ 							// Apenas Horário para Pesquisar
			reservas = reservedao.findBySalaAndHorario(sala, horario);	
		}else if(horario.isEmpty() || horario.equals("")){ //Apenas Horário está vazio
			reservas = reservedao.findBySalaAndDiaAndMes(sala, dia, mes);
		}else if(dia == null){ 								//Apenas Dia está vazio
			reservas = reservedao.findBySalaAndHorarioAndMes(sala, horario, mes);
		}else if(mes == null){ 								//Apenas Mês está vazio
			reservas = reservedao.findBySalaAndHorarioAndDia(sala, horario, dia);
		}
		return reservas;
	}
	
	@GetMapping("/visualizarreservassalas")
	public String visualizarreservassalas(Model model, @SessionAttribute("user") Usuario user, @RequestParam("idsalafiltro") Integer idsala,
			@RequestParam("horariofiltro") String horario, @RequestParam("diafiltro") Integer dia, @RequestParam("mesfiltro") Integer mes){
		Sala s = saladao.findOne(idsala);
		List<Reserva> reservas = null;
		model.addAttribute("sala", s);
		
		if((dia != null) &&(mes != null) && (!horario.equals("") || horario != "")){
			reservas = reservedao.findBySalaAndHorarioAndDiaAndMes(s, horario, dia, mes);
		}else{
			reservas = getreservasby(s, horario, dia, mes);
		}

		model.addAttribute("reservas", reservas);
		
		return "reserva/visualizarreservassalas";
	}

//	@PostMapping(value = "/criarreserva")
//	public String insertReserva(Model model, Reserva r){
//		model.addAttribute("reserva", r);
//		new ReservaDAO().insertReserva(r.getMatriculaUser(), r.getIdSala(), r.getDescricao(), r.getHorario(), r.getDia(), r.getMes());
//		return "reservas/managerreservas";
//	}
	
//	@RequestMapping(value = "/criarreserva", method = RequestMethod.POST)
//	public String insertReserva(Model model, Reserva r){
//		model.addAttribute("reserva", r);
//		new ReservaDAO().insertReserva(r.getMatriculaUser(), r.getIdSala(), r.getDescricao(), r.getHorario(), r.getDia(), r.getMes());
//		return "reservas/managerreservas";
//	}
//	
//	@RequestMapping(value = "/showallreservas")
//	public String showAllReserva(Model model){
//		List<Reserva> reservas = new ReservaDAO().selectAllReserva();
//		model.addAttribute("reservas", reservas);
//		return "reservas/managerreservas";
//	}
//	
//	@RequestMapping(value = "deletereserva")
//	public String deleteReserva(Model model, @RequestParam(value = "idremove") int idr){
//		ReservaDAO reservadao = new ReservaDAO();
//		reservadao.deleteReservaById(idr);
//		model.addAttribute("reservas", reservadao.selectAllReserva());
//		return "reservas/managerreservas";
//	}
//	
//	@RequestMapping(value = "updatereserva")
//	public String updateReserva(Model model, Reserva r){
//		System.out.println(r.getId() + " " + r.getMatriculaUser() + " " + r.getIdSala() + " " + r.getDescricao() + " " + r.getHorario() + " " + r.getDia() + " " + r.getMes());
//		model.addAttribute("reserva", r);
//		ReservaDAO reservadao = new ReservaDAO();
//		reservadao.updateReservaById(r.getId(), r.getMatriculaUser(), r.getIdSala(), r.getDescricao(), r.getHorario(), r.getDia(), r.getMes());
//		model.addAttribute("reservas", reservadao.selectAllReserva());
//		return "reservas/managerreservas";
//	}
//	
//	@RequestMapping("/managerreservas")
//	public String managerreservas(){
//		return "reservas/managerreservas";
//	}
	
}