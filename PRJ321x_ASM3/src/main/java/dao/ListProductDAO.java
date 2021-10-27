/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author ad
 */
public class ListProductDAO {

    // get the product
   public List<Product> search(String keyword) throws Exception {
		List<Product> listProduct = new ArrayList<>();
		try {
			Connection conn = DBContext.getConnection();

			String sql = "select * from products where product_name like'%" + keyword.toLowerCase() + "%'";
			if ("".equals(keyword)) {
				sql = "select * from products";
			}
			try {
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				while (rs.next()) {
					Product p = new Product(rs.getInt("product_id"), rs.getString("product_name"), 
                                                rs.getString("product_des"), rs.getFloat("product_price"), 
                                                rs.getString("product_img_source"),rs.getString("product_type"), 
                                                rs.getString("product_brand"));
					listProduct.add(p);
				}
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return listProduct;
	}

	// get the product
	public Product getProduct(String keyword) throws Exception {
		DBContext db = new DBContext();
		Connection conn = db.getConnection();
		String sql = "select * from products where product_id=" + keyword;
		Product p = null;
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				p = new Product(rs.getInt("product_id"), rs.getString("product_name"), rs.getString("product_des"), rs.getFloat("product_price"), rs.getString("product_img_source"),
                           rs.getString("product_type"), rs.getString("product_brand"));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
}
