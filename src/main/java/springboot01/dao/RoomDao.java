package springboot01.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import springboot01.model.Sala;
import springboot01.model.Usuario;

@Repository
public interface RoomDao extends JpaRepository<Sala, Integer> {
	
}
