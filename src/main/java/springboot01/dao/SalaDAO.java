package springboot01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import springboot01.model.Sala;

@Component
public class SalaDAO {

	private final Connection connection;
	
	public SalaDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}
	
	//Inserir uma sala
	public void insertSala(String nPorta, String bloco, String descricao){
		String sql = "insert into salas(nporta, bloco, descricao) values (?,?,?)";
		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, nPorta);
			st.setString(2, bloco);
			st.setString(3, descricao);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//Deletando uma sala usando o Id
	public void deleteSalaById(int id){
		String sql = "delete from salas where id = ?";
		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//Deletando uma sala usando nPorta e o bloco
	public void deleteSalaByPortaBloco(String nPorta, String bloco){
		String sql = "delete from salas where nporta = ? AND bloco = ?";
		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, nPorta);
			st.setString(2, bloco);
			
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//Atualizar uma sala usando seu id
	public void updateSalaById(int id, String nPorta, String bloco, String descricao){
		String sql = "update salas set nporta = ?, bloco = ?, descricao = ? where id = ?";
		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, nPorta);
			st.setString(2, bloco);
			st.setString(3, descricao);
			st.setInt(4, id);
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//Atualizar uma sala usando nPorta e Bloco
	public void updateSalaByPortaBloco(String nPortaOld, String blocoOld, String nPorta, String bloco, String descricao){
		String sql = "update salas set nporta = ?, bloco = ?, descricao = ? where nporta = ? AND bloco = ?";
		
		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setString(1, nPorta);
			st.setString(2, bloco);
			st.setString(3, descricao);
			st.setString(4, nPortaOld);
			st.setString(5, blocoOld);
			
			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Sala> selectAllSala(){
		String sql = "select * from salas order by id";
		try {
			ArrayList<Sala> salas = new ArrayList<>();
			PreparedStatement st = connection.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()){
				int id = rs.getInt("id");
				String nPorta = rs.getString("nporta");
				String bloco = rs.getString("bloco");
				String descricao = rs.getString("descricao");
				
				salas.add(new Sala(id, nPorta, bloco, descricao));
			}
			
			rs.close();
			st.close();
			return salas;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void close() throws SQLException{
		connection.close();
	}
}
