package springboot01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import springboot01.model.Usuario;


public class UsuarioDAO {
	
	private final Connection connection;
	
	public UsuarioDAO(){
		this.connection = new ConnectionFactory().getConnection();
	}
	
	public void insertUser(int matricula, String nome, String email, String senha, int tipoUser){
		//Tipo de Usuário: 1-Aluno, 2-Professor, 0-Admin
		String sql = "insert into usuarios values (?,?,?,?,?)";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, matricula);
			st.setString(2, nome);
			st.setString(3, email);
			st.setString(4, senha);
			st.setInt(5, tipoUser);
			
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void deleteUser(int matricula){
		String sql = "delete from usuarios where matricula = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, matricula);
			
			st.executeUpdate();
	        st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void updateUser(int matricula, String nome, String email, String senha){
		String sql = "update usuarios set nome = ?, email = ?, senha = ? where matricula = ?";
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, nome);
			st.setString(2, email);
			st.setString(3, senha);
			st.setInt(4, matricula);
			
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Usuario> selectAllUser(){
		String sql = "select * from usuarios";
		try {
			ArrayList<Usuario> user = new ArrayList<>();
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				int matricula = rs.getInt("matricula");
				String nome = rs.getString("nome");
				String email = rs.getString("email");
				int tipoUser = rs.getInt("tipouser");
				String senha = rs.getString("senha");
				
				user.add(new Usuario(matricula, nome, email, senha, tipoUser));
			}
			
			rs.close();
			st.close();
			return user;
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public Usuario selectUserByEmailSenha(String emailGet, String senhaGet){
		String sql = "select * from usuarios where email = ? AND senha = ?";
		
		try {
			Usuario user = null;
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, emailGet);
			st.setString(2, senhaGet);
			
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				int matricula = rs.getInt("matricula");
				String nome = rs.getString("nome");
				String email = rs.getString("email");
				int tipoUser = rs.getInt("tipouser");
				String senha = rs.getString("senha");
				
				user = new Usuario(matricula, nome, email, senha, tipoUser);
			}
			
			rs.close();
			st.close();
			
			return user;
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public void close() throws SQLException{
		connection.close();
	}
}
