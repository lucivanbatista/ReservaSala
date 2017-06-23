package springboot01.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import springboot01.model.Reserva;
import springboot01.model.Usuario;

@Repository
public interface ReserveDao extends JpaRepository<Reserva, Integer> {

	public List<Reserva> findByUser(Usuario user);
}
