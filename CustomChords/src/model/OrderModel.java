package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;


public class OrderModel {

	public synchronized Ordine doRetrieveByKey(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Ordine bean = new Ordine();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idordine = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("idordine"));
				bean.setData(rs.getDate("dataordine"));
				bean.setStato(rs.getString("stato"));
				bean.setCommenti(rs.getString("commenti"));
				bean.setEmail(rs.getString("email"));
				bean.setCittaSpedizione(rs.getString("cittaspedizione"));
				bean.setIndirizzoSpedizione(rs.getString("indirizzospedizione"));
				bean.setNumerocarta(rs.getString("numerocarta"));

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

	public synchronized void doSave(Ordine o) throws SQLException {

		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+  "(`idordine`, `dataordine`, `stato`, `commenti`, `email`, `indirizzospedizione`, `numerocarta`, `cittaspedizione`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(insertSQL);
			preparedStatement.setNull(1, Types.INTEGER);
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
			preparedStatement.setString(2,  dateFormat.format(o.getData()));
			preparedStatement.setString(3, o.getStato());
			preparedStatement.setString(4, o.getCommenti());
			preparedStatement.setString(5, o.getEmail());
			preparedStatement.setString(6, o.getIndirizzoSpedizione());
			preparedStatement.setString(7, o.getNumerocarta());
			preparedStatement.setString(8, o.getCittaSpedizione());

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

	public synchronized int getNumberRow() throws SQLException {

		Connection conn = null;
		Statement stm = null;
		int num = 0;

		String sql = "SELECT COUNT(*) FROM " + TABLE_NAME;

		try {
			conn = DriverManagerConnectionPool.getConnection();
			stm=conn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			rs.next();
			num = rs.getInt(1);



			conn.commit();
		} finally {
			try {
				if (stm != null)
					stm.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}
		return num;
	}
	
	public synchronized int getLastId() throws SQLException {

		Connection conn = null;
		Statement stm = null;
		int num = 0;

		String sql = "SELECT idordine FROM " + TABLE_NAME + " ORDER BY idordine DESC LIMIT 1";

		try {
			conn = DriverManagerConnectionPool.getConnection();
			stm=conn.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			rs.next();
			num = rs.getInt(1);



			conn.commit();
		} finally {
			try {
				if (stm != null)
					stm.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}
		return num;
	}

	public synchronized ArrayList<Ordine> doRetrieveByEmail(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ArrayList<Ordine> list = new ArrayList<Ordine>();
		Ordine bean = new Ordine();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE email = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean = new Ordine();
				bean.setId(rs.getInt("idordine"));
				bean.setData(rs.getDate("dataordine"));
				bean.setStato(rs.getString("stato"));
				bean.setCommenti(rs.getString("commenti"));
				bean.setEmail(rs.getString("email"));
				bean.setCittaSpedizione(rs.getString("cittaspedizione"));
				bean.setIndirizzoSpedizione(rs.getString("indirizzospedizione"));
				bean.setNumerocarta(rs.getString("numerocarta"));
				list.add(bean);
				
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return list;
	}
	
	public synchronized ArrayList<Ordine> doRetrieveByDates(String da,String a) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ArrayList<Ordine> list = new ArrayList<Ordine>();
		Ordine bean = new Ordine();
		String selectSQL = "SELECT * FROM " + TABLE_NAME +  " WHERE (dataordine BETWEEN ? AND ?);";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1,  da);
			preparedStatement.setString(2, a);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean = new Ordine();
				bean.setId(rs.getInt("idordine"));
				bean.setData(rs.getDate("dataordine"));
				bean.setStato(rs.getString("stato"));
				bean.setCommenti(rs.getString("commenti"));
				bean.setEmail(rs.getString("email"));
				bean.setCittaSpedizione(rs.getString("cittaspedizione"));
				bean.setIndirizzoSpedizione(rs.getString("indirizzospedizione"));
				bean.setNumerocarta(rs.getString("numerocarta"));
				list.add(bean);
				
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return list;
	}

	public synchronized ArrayList<Ordine> takeAllOrders() throws SQLException {
		Connection connection = null;
		Statement stm = null;
		ArrayList<Ordine> list = new ArrayList<Ordine>();
		Ordine bean = new Ordine();
		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		try {
			connection = DriverManagerConnectionPool.getConnection();
			stm=connection.createStatement();
			ResultSet rs = stm.executeQuery(selectSQL);

			while (rs.next()) {
				bean = new Ordine();
				bean.setId(rs.getInt("idordine"));
				bean.setData(rs.getDate("dataordine"));
				bean.setStato(rs.getString("stato"));
				bean.setCommenti(rs.getString("commenti"));
				bean.setEmail(rs.getString("email"));
				bean.setCittaSpedizione(rs.getString("cittaspedizione"));
				bean.setIndirizzoSpedizione(rs.getString("indirizzospedizione"));
				bean.setNumerocarta(rs.getString("numerocarta"));
				list.add(bean);
				
			}

		} finally {
			try {
				if (stm != null)
					stm.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return list;
	}

	


	
	
	private static final String TABLE_NAME = "ordine";

}
