package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductModel {

	public synchronized void doSave(Prodotto p) throws SQLException {

		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ "(`idprodotto`, `nome`, `descrizione`, `categoria`, `sottocategoria`, `quantitadisp`, `prezzo`, `vetrina`, `iva`) VALUES (?, ?, ?, ?, ?, ?, ?,?, ?);";

		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(insertSQL);
			preparedStatement.setString(1, p.getId());
			preparedStatement.setString(2, p.getNome());
			preparedStatement.setString(3, p.getDescrizione());
			preparedStatement.setString(4, p.getCategoria());
			preparedStatement.setString(5, p.getSottoCategoria());
			preparedStatement.setInt(6, p.getQuantitaDisponibile());
			preparedStatement.setDouble(7, p.getPrezzo());
			preparedStatement.setBoolean(8, p.isVetrina());
			preparedStatement.setDouble(9, p.getIva());

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

	public synchronized Prodotto doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Prodotto bean = new Prodotto();
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE idprodotto = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getString("idprodotto"));
				bean.setNome(rs.getString("nome"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setSottoCategoria(rs.getString("sottocategoria"));
				bean.setQuantitaDisponibile(rs.getInt("quantitadisp"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setVetrina(rs.getBoolean("vetrina"));
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

	public synchronized void doDelete(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// int result =0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE idprodotto = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);

			preparedStatement.executeUpdate();
			connection.commit();


		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		// return (result != 0);

	}

	public synchronized ArrayList<Prodotto> doSearch(String categ) throws SQLException {

		ArrayList<Prodotto> lista = new ArrayList<Prodotto>();
		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String searchSQL = "SELECT * FROM " + TABLE_NAME + " WHERE categoria = ?";

		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(searchSQL);
			preparedStatement.setString(1, categ);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String id = rs.getString("idprodotto");
				String nome = rs.getString("nome");
				String descrizione = rs.getString("descrizione");
				String categoria = rs.getString("categoria");
				String sottocategoria = rs.getString("sottocategoria");
				int quantitadisp = rs.getInt("quantitadisp");
				Double prezzo = rs.getDouble("prezzo");
				Boolean vetrina = rs.getBoolean("vetrina");
				Double iva = rs.getDouble("iva");
				if(quantitadisp>0) {
				lista.add(
						new Prodotto(id, nome, descrizione, categoria, sottocategoria, quantitadisp, prezzo, vetrina,iva));
				}

			}
			conn.commit();
			return lista;

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}
	}

	public synchronized ArrayList<Prodotto> doSearch(String categ, String sottocateg) throws SQLException {

		ArrayList<Prodotto> lista = new ArrayList<Prodotto>();
		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String searchSQL = "SELECT * FROM " + TABLE_NAME + " WHERE categoria = ? AND sottocategoria = ?";

		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(searchSQL);
			preparedStatement.setString(1, categ);
			preparedStatement.setString(2, sottocateg);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String id = rs.getString("idprodotto");
				String nome = rs.getString("nome");
				String descrizione = rs.getString("descrizione");
				String categoria = rs.getString("categoria");
				String sottocategoria = rs.getString("sottocategoria");
				int quantitadisp = rs.getInt("quantitadisp");
				Double prezzo = rs.getDouble("prezzo");
				Boolean vetrina = rs.getBoolean("vetrina");
				Double iva = rs.getDouble("iva");
				if(quantitadisp>0) {
				lista.add(
						new Prodotto(id, nome, descrizione, categoria, sottocategoria, quantitadisp, prezzo, vetrina,iva));
				}

			}
			conn.commit();
			return lista;

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}
	}

	public synchronized ArrayList<Prodotto> doResearch(String ric) throws SQLException {

		ArrayList<Prodotto> lista = new ArrayList<Prodotto>();
		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String researchSQL = "SELECT * FROM " + TABLE_NAME +  " prodotto WHERE idprodotto LIKE ? OR nome LIKE ? OR descrizione LIKE ?";
		String word = "%" + ric + "%";

		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(researchSQL);
			preparedStatement.setString(1, word);
			preparedStatement.setString(2, word);
			preparedStatement.setString(3, word);


			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String id = rs.getString("idprodotto");
				String nome = rs.getString("nome");
				String descrizione = rs.getString("descrizione");
				String categoria = rs.getString("categoria");
				String sottocategoria = rs.getString("sottocategoria");
				int quantitadisp = rs.getInt("quantitadisp");
				Double prezzo = rs.getDouble("prezzo");
				Boolean vetrina = rs.getBoolean("vetrina");
				Double iva = rs.getDouble("iva");
				if(quantitadisp>0) {
				lista.add(
						new Prodotto(id, nome, descrizione, categoria, sottocategoria, quantitadisp, prezzo, vetrina,iva));

				}
			}
			conn.commit();
			return lista;

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}
	}
	
	public synchronized ArrayList<Prodotto> doResearchWithNull(String ric) throws SQLException {

		ArrayList<Prodotto> lista = new ArrayList<Prodotto>();
		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String researchSQL = "SELECT * FROM " + TABLE_NAME +  " prodotto WHERE idprodotto LIKE ? OR nome LIKE ? OR descrizione LIKE ?";
		String word = "%" + ric + "%";

		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(researchSQL);
			preparedStatement.setString(1, word);
			preparedStatement.setString(2, word);
			preparedStatement.setString(3, word);


			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String id = rs.getString("idprodotto");
				String nome = rs.getString("nome");
				String descrizione = rs.getString("descrizione");
				String categoria = rs.getString("categoria");
				String sottocategoria = rs.getString("sottocategoria");
				int quantitadisp = rs.getInt("quantitadisp");
				Double prezzo = rs.getDouble("prezzo");
				Boolean vetrina = rs.getBoolean("vetrina");
				Double iva = rs.getDouble("iva");
				lista.add(
						new Prodotto(id, nome, descrizione, categoria, sottocategoria, quantitadisp, prezzo, vetrina,iva));

				
			}
			conn.commit();
			return lista;

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(conn);
			}
		}
	}
	
	public synchronized boolean isPresent(String id) throws SQLException {

		if (id == null)
			return false;

		Connection connection = null;
		Statement statement = null;

		String controlSQL = "SELECT * FROM " + TABLE_NAME;
		try {
			connection = DriverManagerConnectionPool.getConnection();
			statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(controlSQL);
			while (rs.next()) {
				if (rs.getString("idprodotto").equalsIgnoreCase(id)) {
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

	public synchronized void doModify(Prodotto p) throws SQLException {

		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String modifySQL = "UPDATE " + TABLE_NAME +  " SET `nome` = ?, `descrizione` = ?, `categoria` = ?, `sottocategoria` = ?, `quantitadisp` = ?, `prezzo` = ?, `vetrina` = ?, `iva` = ? WHERE (`idprodotto` = ?);";


		try {
			conn = DriverManagerConnectionPool.getConnection();
			preparedStatement = conn.prepareStatement(modifySQL);
			
			preparedStatement.setString(1, p.getNome());
			preparedStatement.setString(2, p.getDescrizione());
			preparedStatement.setString(3, p.getCategoria());
			preparedStatement.setString(4, p.getSottoCategoria());
			preparedStatement.setInt(5, p.getQuantitaDisponibile());
			preparedStatement.setDouble(6, p.getPrezzo());
			preparedStatement.setBoolean(7, p.isVetrina());
			preparedStatement.setDouble(8, p.getIva());
			preparedStatement.setString(9, p.getId());

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

	public synchronized void setQuantityToZero(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		// int result =0;

		String deleteSQL = "UPDATE " + TABLE_NAME +  " SET `quantitadisp` = '0' WHERE (`idprodotto` = ?);" + 
				"";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);

			preparedStatement.executeUpdate();
			connection.commit();


		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		// return (result != 0);

	}

	public synchronized void doDecraseProduct(String idProduct,int qnt) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		

		String deleteSQL = "UPDATE prodotto SET quantitadisp = quantitadisp - ? WHERE idprodotto = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, qnt);
			preparedStatement.setString(2, idProduct);

			preparedStatement.executeUpdate();
			connection.commit();


		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		// return (result != 0);

	}
	public synchronized ArrayList<Prodotto> doRetrieveVetrina() throws SQLException {
		Connection conn = null;
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE vetrina = 1";
		ArrayList<Prodotto> prodottiVetrina = new ArrayList<Prodotto>();

		try {
			conn = DriverManagerConnectionPool.getConnection();
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery(selectSQL);
			while (rs.next()) {
				String id = rs.getString("idprodotto");
				String nome = rs.getString("nome");
				String descrizione = rs.getString("descrizione");
				String categoria = rs.getString("categoria");
				String sottocategoria = rs.getString("sottocategoria");
				int quantitadisp = rs.getInt("quantitadisp");
				Double prezzo = rs.getDouble("prezzo");
				Boolean vetrina = rs.getBoolean("vetrina");
				Double iva = rs.getDouble("iva");
				prodottiVetrina.add(
						new Prodotto(id, nome, descrizione, categoria, sottocategoria, quantitadisp, prezzo, vetrina, iva));
				}
			
			conn.commit();
			return prodottiVetrina;

		} finally {
			
				DriverManagerConnectionPool.releaseConnection(conn);
			
		}
	}
	
	private static final String TABLE_NAME = "prodotto";

}
