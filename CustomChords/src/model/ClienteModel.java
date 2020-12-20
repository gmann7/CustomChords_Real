package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.Utente.Sesso;

public class ClienteModel {

	public synchronized boolean checkLogin(String email, String pass) throws SQLException {

		if (email == null || pass == null)
			return false;

		Connection connection = null;
		Statement statement = null;

		String loginSQL = "SELECT * FROM " + TABLE_NAME;
		try {
			connection = DriverManagerConnectionPool.getConnection();
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(loginSQL);
			while (rs.next()) {
				if (rs.getString("email").equals(email) && rs.getString("pass").equals(pass)) {
					return true;
				}
			}
			return false;

		} finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
	public synchronized boolean checkEmail(String email) throws SQLException {

		if (email == null)
			return false;

		Connection connection = null;
		Statement statement = null;

		String controlSQL = "SELECT * FROM " + TABLE_NAME;
		try {
			connection = DriverManagerConnectionPool.getConnection();
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(controlSQL);
			while (rs.next()) {
				if (rs.getString("email").equalsIgnoreCase(email)) {
					return true;
				}
			}
			return false;

		} finally {
			try {
				if (statement != null)
					statement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}

	public synchronized Utente doRetrieveByKey(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Utente bean = new Utente();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE email = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setDatanascita(rs.getDate("datanascita"));
				bean.setSesso(Sesso.valueOf(rs.getString("sesso")));
				bean.setEmail(rs.getString("email"));
				bean.setTelefono(rs.getString("telefono"));
				bean.setIndirizzo(rs.getString("indirizzo"));
				bean.setCitta(rs.getString("citta"));
				bean.setNazione(rs.getString("nazione"));
				bean.setAdmin(rs.getBoolean("admin"));

			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return bean;
	}

	public synchronized void doSave(Utente u,String password) throws SQLException {

		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ "(`nome`, `cognome`, `datanascita`, `email`, `pass`, `telefono`, `indirizzo`, `citta`, `nazione`, `admin`, `sesso`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(insertSQL);
			preparedStatement.setString(1, u.getNome());
			preparedStatement.setString(2, u.getCognome());
			DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");  
			preparedStatement.setString(3,  dateFormat.format(u.getDatanascita()));
			preparedStatement.setString(4, u.getEmail());
			preparedStatement.setString(5, password);
			preparedStatement.setString(6, u.getTelefono());
			preparedStatement.setString(7, u.getIndirizzo());
			preparedStatement.setString(8, u.getCitta());
			preparedStatement.setString(9,u.getNazione());
			preparedStatement.setBoolean(10, u.getAdmin());
			preparedStatement.setString(11, String.valueOf(u.getSesso()));
			

			preparedStatement.executeUpdate();

			conn.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}
	}

	public synchronized ArrayList<String> doRetrieveAllId() throws SQLException {
		Connection conn = null;
		Statement stm = null;
		ArrayList<String> list = new ArrayList<String>();

		String sql = "SELECT email from " + TABLE_NAME;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			stm=conn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				list.add(rs.getString("email"));
			}



			conn.commit();
		} finally {
			try {
				if (stm != null)
					stm.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}
		return list;
	}
	
	private static final String TABLE_NAME = "cliente";

}
