package springboot01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import springboot01.model.Reserva;

public class ReservaDAO {

	private final Connection connection;
	
	public ReservaDAO() {
		this.connection = new ConnectionFactory().getConnection();
	}

	// Inserir Reserva
	// Horário será A (8 as 10), B (10 as 12), C (13:30 as 15:30), D (15:30 as
	// 17:30), E (18 as 20), F (20 as 22)
	public void insertReserva(int matriculaUser, int idSala, String descricao, char horario, int dia, int mes) {
		String sql = "insert into reservas (matriculauser, idsala, descricao, horario, dia, mes) values (?,?,?,?,?,?)";

		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, matriculaUser);
			st.setInt(2, idSala);
			st.setString(3, descricao);
			st.setString(4, String.valueOf(horario));
			st.setInt(5, dia);
			st.setInt(6, mes);

			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Deletando usando o id da reserva
	public void deleteReservaById(int id) {
		String sql = "delete from reservas where id = ?";

		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, id);

			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Deletando usando matriculaUser, idSala, horario, dia, mes
	public void deleteReservaComplexo(int matriculaUser, int idSala, char horario, int dia, int mes) {
		String sql = "delete from reservas where matriculauser = ? AND idsala = ? AND horario = ? AND dia = ? AND mes = ?";

		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, matriculaUser);
			st.setInt(2, idSala);
			st.setString(3, String.valueOf(horario));
			st.setInt(4, dia);
			st.setInt(5, mes);

			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// Update com apenas o ID
	public void updateReservaById(int id, int matriculaUser, int idSala, String descricao, char horario, int dia,
			int mes) {
		String sql = "update reservas set matriculauser = ?, idsala = ?, descricao = ?, horario = ?, dia = ?, mes = ? where id = ?";

		try {
			PreparedStatement st = connection.prepareStatement(sql);
			st.setInt(1, matriculaUser);
			st.setInt(2, idSala);
			st.setString(3, descricao);
			st.setString(4, String.valueOf(horario));
			st.setInt(5, dia);
			st.setInt(6, mes);
			st.setInt(7, id);

			st.executeUpdate();
			st.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// FALTA O UPDATE MAIS COMPLEXO

	// Todas as reservas
//	public List<Reserva> selectAllReserva() {
//		String sql = "select * from reservas";
//
//		try {
//			PreparedStatement st = connection.prepareStatement(sql);
//			ResultSet rs = st.executeQuery();
//			ArrayList<Reserva> reservas = new ArrayList<>();
//
//			while (rs.next()) {
//				int id = rs.getInt("id");
//				int matriculaUser = rs.getInt("matriculauser");
//				int idSala = rs.getInt("idsala");
//				String descricao = rs.getString("descricao");
//				char horario = rs.getString("horario").charAt(0);
//				int dia = rs.getInt("dia");
//				int mes = rs.getInt("mes");
//
//				reservas.add(new Reserva(id, matriculaUser, idSala, descricao, horario, dia, mes));
//			}
//
//			rs.close();
//			st.close();
//			return reservas;
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
	
	public void close() throws SQLException{
		connection.close();
	}
}
