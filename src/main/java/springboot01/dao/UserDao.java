package springboot01.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import springboot01.model.Usuario;

@Repository
public interface UserDao extends JpaRepository<Usuario, Integer>{
	
	public Usuario findByEmailAndSenha(String email, String senha);
}
