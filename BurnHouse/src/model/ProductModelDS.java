package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.ProductModelDS;

public class ProductModelDS implements ProductModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/burn_house");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "product";



	@Override
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE CODICE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
				
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}


	@Override
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}


	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (codice, nome, prezzo, descrizione, gradazione, tipo, img) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, product.getCode());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setString(4, product.getDescription());
			preparedStatement.setFloat(5, product.getDegree());
			preparedStatement.setString(6,product.getType());
			preparedStatement.setString(7, product.getImg());
			preparedStatement.executeUpdate();

			//connection.setAutoCommit(false);
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		
	}


	@Override
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME + " WHERE CODICE = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
	
	@Override
	public void doModify(ProductBean product, int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String insertSQL = "UPDATE " + ProductModelDS.TABLE_NAME
				+ " SET codice=?, nome=?, prezzo=?, descrizione=?, gradazione=?, tipo=?, img=? "
				+ "WHERE codice = ?";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setInt(1, product.getCode());
			preparedStatement.setString(2, product.getName());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setString(4, product.getDescription());
			preparedStatement.setFloat(5, product.getDegree());
			preparedStatement.setString(6,product.getType());
			preparedStatement.setString(7, product.getImg());
			preparedStatement.setInt(8, code);

			preparedStatement.executeUpdate();
			connection.setAutoCommit(false);
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		
	}
	
	@Override
	public Collection<ProductBean> doFilter(int min, int max) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		
		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME
				+ " WHERE gradazione >= ? AND gradazione <= ?";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, min);
			preparedStatement.setInt(2, max);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		
		//products.forEach(e -> System.out.println(e.getName()+", "+e.getDegree()));
		return products;
	}


	@Override
	public Collection<ProductBean> doRetrieveByVino() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE TIPO = 'vino'";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}


	@Override
	public Collection<ProductBean> doRetrieveByDistillato() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE TIPO = 'distillato'";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}


	@Override
	public Collection<ProductBean> doRetrieveByLiquore() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE TIPO = 'liquore'";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				
				bean.setCode(rs.getInt("codice"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setDegree(rs.getFloat("gradazione"));
				bean.setType(rs.getString("tipo"));
				bean.setImg(rs.getString("img"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}

}
