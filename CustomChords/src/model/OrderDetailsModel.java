package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class OrderDetailsModel {
	
	
	public synchronized DettagliOrdine doRetrieveByKey(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		DettagliOrdine bean = new DettagliOrdine();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idordine = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setIdOrdine(rs.getInt("idordine"));
				bean.setIdProdotto(rs.getString("idprodotto"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				
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

	public synchronized void doSave(DettagliOrdine d) throws SQLException {

		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+  " (`idordine`, `idprodotto`, `quantita`, `prezzo`, `iva`) VALUES (?, ?, ?, ?, ?);";


		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(insertSQL);
			preparedStatement.setInt(1, d.getIdOrdine());
			preparedStatement.setString(2,  d.getIdProdotto());
			preparedStatement.setInt(3, d.getQuantita());
			preparedStatement.setDouble(4, d.getPrezzo());
			preparedStatement.setDouble(5, d.getIva());

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

	public synchronized ArrayList<DettagliOrdine> doRetrieveOrdersByKey(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<DettagliOrdine> list = new ArrayList<DettagliOrdine>();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idordine = ?";
		DettagliOrdine bean= new DettagliOrdine();
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
				bean.setIdOrdine(rs.getInt("idordine"));
				bean.setIdProdotto(rs.getString("idprodotto"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				
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

	public synchronized ArrayList<DettagliOrdine> doRetrieveOrdersByEmail(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<DettagliOrdine> list = new ArrayList<DettagliOrdine>();
		String selectSQL = "SELECT  b.* FROM ordine a, dettagliordine b WHERE a.idordine = b.idordine && a.email = ?;";
		DettagliOrdine bean= new DettagliOrdine();
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean = new DettagliOrdine();
				bean.setIdOrdine(rs.getInt("idordine"));
				bean.setIdProdotto(rs.getString("idprodotto"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				
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
	
	public synchronized ArrayList<DettagliOrdine> takeAllOrderDetails() throws SQLException {
		Connection connection = null;
		Statement stm = null;
		ArrayList<DettagliOrdine> list = new ArrayList<DettagliOrdine>();
		DettagliOrdine bean = new DettagliOrdine();
		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		try {
			connection = DriverManagerConnectionPool.getConnection();
			stm=connection.createStatement();
			ResultSet rs = stm.executeQuery(selectSQL);

			while (rs.next()) {
				bean = new DettagliOrdine();
				bean.setIdOrdine(rs.getInt("idordine"));
				bean.setIdProdotto(rs.getString("idprodotto"));
				bean.setQuantita(rs.getInt("quantita"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setIva(rs.getDouble("iva"));
				
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

	
	private static final String TABLE_NAME = "dettagliordine";
	


}
