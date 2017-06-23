package springboot01.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String insertReserva(Model model, @Valid Reserva r, @SessionAttribute("user") Usuario user, @RequestParam(value = "idSala") Integer idsala){
		Sala sala = saladao.findOne(idsala);
		Reserva rnew = new Reserva(r.getId(), user, sala, r.getDescricao(), r.getHorario(), r.getDia(), r.getMes());
		List<Reserva> reservas = reservedao.findAll();
		for(Reserva reserva : reservas){
			if(reserva.getMes() == rnew.getMes() && reserva.getDia() == rnew.getDia() && reserva.getHorario() == rnew.getHorario() && reserva.getSala().getId() == rnew.getSala().getId()){
				if(user.getTipoUser() == 0){
					return "reserva/managerreservas";
				}else{
					return "sala/usersala";
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
	
	@GetMapping(value = "/showallreservas")
	public String showAllReserva(Model model, @SessionAttribute("user") Usuario user){
		List<Reserva> reservas = reservedao.findByUser(user);
		model.addAttribute("reservas", reservas);
		if(user.getTipoUser() == 0){
			return "reserva/managerreservas";
		}else{
			return "reserva/usermyreserva";
		}
	}
	
	@PostMapping(value = "/deletereserva")
	public String deleteReserva(Model model, @RequestParam(value = "idremove") Integer idr, @SessionAttribute("user") Usuario user){
		reservedao.delete(idr);
		model.addAttribute("reservas", reservedao.findByUser(user));
		if(user.getTipoUser() == 0){
			return "reserva/managerreservas";
		}else{
			return "reserva/usermyreserva";
		}
	}
	
	@PostMapping(value = "/updatereserva")
	public String updateReserva(Model model, Reserva r, @SessionAttribute("user") Usuario user, @RequestParam("idSala") Integer idsala){
		Sala sala = saladao.findOne(idsala);
		r.setUser(user);
		r.setSala(sala);
		reservedao.save(r);
		model.addAttribute("reserva", r);
		model.addAttribute("reservas", reservedao.findByUser(user));
		if(user.getTipoUser() == 0){
			return "reserva/managerreservas";
		}else{
			return "reserva/usermyreserva";
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