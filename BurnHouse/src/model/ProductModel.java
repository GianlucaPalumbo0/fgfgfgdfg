package model;

import java.sql.SQLException;
import java.util.Collection;


public interface ProductModel {

	public void doSave(ProductBean product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;
	
	public ProductBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ProductBean> doRetrieveByVino() throws SQLException;
	
	public Collection<ProductBean> doRetrieveByDistillato() throws SQLException;
	
	public Collection<ProductBean> doRetrieveByLiquore() throws SQLException;
	
	public Collection<ProductBean> doRetrieveAll(String order) throws SQLException;
	
	public void doModify(ProductBean product, int code) throws SQLException;
	
	public Collection<ProductBean> doFilter(int min, int max) throws SQLException;
	
}

