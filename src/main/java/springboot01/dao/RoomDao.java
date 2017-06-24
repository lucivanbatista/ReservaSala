package springboot01.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import springboot01.model.Sala;

@Repository
public interface RoomDao extends JpaRepository<Sala, Integer> {
	
	public List<Sala> findBynPortaAndBloco(String nPorta, String bloco);
	
	public List<Sala> findBynPorta(String nPorta);
	
	public List<Sala> findByBloco(String bloco);
}
