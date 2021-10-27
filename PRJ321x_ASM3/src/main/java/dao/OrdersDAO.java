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
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.Cart;
import model.Orders;
import model.Product;

/**
 *
 * @author ad
 */
public class OrdersDAO {

    public boolean insertOrder(Orders o, Cart c) throws Exception {
        Connection conn = DBContext.getConnection();
        PreparedStatement ps;
        String sql = "";
        int status = 0;
        boolean a = false;

        // insert data into table orders
        try {
            sql = "INSERT INTO orders(user_mail, order_status, order_date, order_discount_code, order_address) VALUES (?,?,?,?,?)";
            ps = conn.prepareCall(sql);

            ps.setString(1, o.getUserMail());
            ps.setInt(2, 2);

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
            ps.setString(3, formatter.format(LocalDateTime.now()));
            ps.setString(4, o.getDiscount());
            ps.setString(5, o.getAddress());

            a = ps.execute();

            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        status = 0;
		conn = DBContext.getConnection();

		sql = "select count(*) from orders";
		Statement stmt = conn.createStatement();
		// Executing the query
		ResultSet rs = stmt.executeQuery(sql);
		// Retrieving the result
		rs.next();
		int count = rs.getInt(1);
		o.setOrderId(count);

		// insert data into table orders_detail
		try {
			for (int i = 0; i < c.getItems().size(); i++) {
				Product p = c.getItems().get(i);

				sql = "insert into Orders_detail(order_id, product_id, amount_product, price_product) values (?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, o.getOrderId());
				ps.setInt(2, p.getId());
				ps.setInt(3, p.getNumber());
				ps.setFloat(4, p.getPrice());

				status = ps.executeUpdate();
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return a;
    }
}
