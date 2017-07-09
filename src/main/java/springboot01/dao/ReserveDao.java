package springboot01.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import springboot01.model.Reserva;
import springboot01.model.Sala;
import springboot01.model.Usuario;

@Repository
public interface ReserveDao extends JpaRepository<Reserva, Integer> {

	public List<Reserva> findByUser(Usuario user);
	
	public List<Reserva> findBySala(Sala sala);
	
	
	public List<Reserva> findBySalaAndHorario(Sala sala, String horario);
	
	public List<Reserva> findBySalaAndDia(Sala sala, Integer dia);
	
	public List<Reserva> findBySalaAndMes(Sala sala, Integer mes);

	
	public List<Reserva> findBySalaAndHorarioAndDia(Sala sala, String horario, Integer dia);

	public List<Reserva> findBySalaAndHorarioAndMes(Sala sala, String horario, Integer mes);	
	
	public List<Reserva> findBySalaAndDiaAndMes(Sala sala, Integer dia, Integer mes);	
	
	
	public List<Reserva> findBySalaAndHorarioAndDiaAndMes(Sala sala, String horario, Integer dia, Integer mes);
}
