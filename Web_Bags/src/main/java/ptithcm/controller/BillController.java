package ptithcm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.BillDetailEntity;
import ptithcm.entity.BillDetailPK;
import ptithcm.entity.BillEntity;
import ptithcm.entity.CartEntity;
import ptithcm.entity.CustomerEntity;
import ptithcm.entity.ProductEntity;
@Transactional
@Controller
@RequestMapping("bill")
public class BillController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("index")
	public String index(ModelMap model, HttpSession session) {
		
		String currentUser = (String) session.getAttribute("username");
		if(currentUser == null )
		{
			model.addAttribute("loginStatus", "nav-login-no-login");
			
		}
		else
		{
			model.addAttribute("loginStatus", "");
			model.addAttribute("currentUser", currentUser);
			int id = this.getIDUser(currentUser);
			List<CartEntity> getCart = this.getCart(id);
			model.addAttribute("getCart", getCart);
		}
		
		String username = session.getAttribute("username").toString();
		CustomerEntity user = this.getCustomer(username);
		List<CartEntity> carts = this.getCarts(user.getId_user());
		if(!carts.isEmpty()) {
			model.addAttribute("carts", carts);
			float totalBefore = 0;
			float Vat;
			float totalAfter = 0;
			for(CartEntity cart: carts) {
				totalBefore += cart.getQuantity() * cart.getPk().getProductEntity().getPrice();
			}
			Vat = (float) (totalBefore * 0.1);
			totalAfter = totalBefore + Vat;
			model.addAttribute("totalBefore", totalBefore);
			model.addAttribute("totalAfter", totalAfter);
			
		}else {
			return "bill/cart-no-product";
		}
		

		return "bill/cart-detail";
	}
	
	
	@RequestMapping(value="index/{id}.htm", params="deleteCart")
	public String deletePr(ModelMap model, @ModelAttribute("bill") BillEntity bill, HttpSession session, @PathVariable("id") Integer id
			) throws ParseException {
		String username = session.getAttribute("username").toString();
		CustomerEntity user = this.getCustomer(username);
		List<CartEntity> carts = this.getCarts(user.getId_user());
		for(CartEntity cart : carts) {
			if(cart.getPk().getProductEntity().getId_product() == id) {
				this.deleteCart(cart);
				carts.remove(cart);
				break;
			}
		}
		if(!carts.isEmpty()) {
			model.addAttribute("carts", carts);
			float totalBefore = 0;
			float Vat;
			float totalAfter = 0;
			for(CartEntity cart: carts) {
				totalBefore += cart.getQuantity() * cart.getPk().getProductEntity().getPrice();
			}
			Vat = (float) (totalBefore * 0.1);
			totalAfter = totalBefore + Vat;
			model.addAttribute("totalBefore", totalBefore);
			model.addAttribute("totalAfter", totalAfter);
			
		}else {
			return "bill/cart-no-product";
		}
		

		return "bill/cart-detail";
		
	}
	
	@RequestMapping(value="index", params="confirm")
	public String index1(ModelMap model, @ModelAttribute("bill") BillEntity bill, HttpSession session,
			@ModelAttribute("billDetail") BillDetailEntity billDetail, @ModelAttribute("pk") BillDetailPK pk) throws ParseException {
		String username = session.getAttribute("username").toString();
		CustomerEntity user = this.getCustomer(username);
		List<CartEntity> carts = this.getCarts(user.getId_user());
		System.out.print(123);
		if(!carts.isEmpty()) {
			Date now = new Date();
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
			String dateBuy = ft.format(now);
			bill.setId_user(user.getId_user());
			bill.setDate_bill(ft.parse(dateBuy));
			bill.setVat(10);
			Integer temp = this.CreateBill(bill);

			System.out.print(bill.getId_bill());
			for(CartEntity cart: carts) {
				pk.setBillEntity(bill);
				pk.setProductEntity(this.getProduct(cart.getPk().getProductEntity().getId_product()));
				billDetail.setPk(pk);
				billDetail.setQuantity(cart.getQuantity());
				billDetail.setPrice(cart.getPk().getProductEntity().getPrice());
				billDetail.setTotal(billDetail.getPrice() * billDetail.getQuantity());
				this.CreateBillDetail(billDetail);
				this.deleteCart(cart);
				
				int quantityAfterOrder = billDetail.getPk().getProductEntity().getQuantity() - billDetail.getQuantity();
				billDetail.getPk().getProductEntity().setQuantity(quantityAfterOrder);
				
				this.updateProduct(billDetail.getPk().getProductEntity());
				
				
			}
			List<BillDetailEntity> purchase = this.getProductinBillDetail();
			model.addAttribute("purchase", purchase);
			
			
			return "redirect:/purchase.htm";
		}
			return "bill/cart-no-product";
			
		
						
		
		
	}
	
//lay 1 user cung id 	
	public CustomerEntity getCustomer(String username) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomerEntity where username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		CustomerEntity list = (CustomerEntity) query.list().get(0);
		return list;
	}
	
	public ProductEntity getProduct(int id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity where id_product = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ProductEntity list = (ProductEntity) query.list().get(0);
		return list;
	}
	
// lay tat ca san pham trong gio hang cua user	
	public List<CartEntity> getCarts(int id){
		Session session = factory.getCurrentSession();
		String hql = "FROM CartEntity where id_user = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<CartEntity> list = query.list();
		return list;
	}
//tao bill 
	public Integer CreateBill(BillEntity bill) {
		Session session = factory.openSession();
		
		Transaction t = session.beginTransaction();

		try {
			session.save(bill);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
//tao bill chi tiet	
	public Integer CreateBillDetail(BillDetailEntity billDtail) {
		Session session = factory.openSession();
		
		Transaction t = session.beginTransaction();

		try {
			session.save(billDtail);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	public Integer deleteCart(CartEntity cart) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(cart);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	public List<BillDetailEntity> getProductinBillDetail(){
		Session session = factory.getCurrentSession();
		String hql = "FROM BillDetailEntity";
		Query query = session.createQuery(hql);
		List<BillDetailEntity> list = query.list();
		return list;
	}
	
	public Integer updateProduct(ProductEntity pd) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(pd);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	public Integer getIDUser(String username) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT id_user FROM CustomerEntity where username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		Integer id = (Integer) query.list().get(0);
		return id;
	}
	public List<CartEntity> getCart(Integer id){
		Session session = factory.getCurrentSession();
		String hql = "FROM CartEntity where ID_USER = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		List<CartEntity> list = query.list();
		return list;
	}
}
