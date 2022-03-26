package ptithcm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.CartEntity;
import ptithcm.entity.CartPK;
import ptithcm.entity.CustomerEntity;
import ptithcm.entity.ProductEntity;
import ptithcm.entity.RoleEntity;
@Transactional
@Controller
public class SingleProductController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(value ="singleproduct", method = RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request) {
		String getID = request.getParameter("id");
		if(getID == null) {
			getID = "1";
		}
		int currentIDpr=Integer.parseInt(getID);
		
//		for(ProductEntity pro: products) {
//			if(pro.getId_product() == Integer.parseInt(getID)) {
//				model.addAttribute("pro", pro);
//				break;
//			}
//		}
		HttpSession session1 = request.getSession();
		String currentUser = (String) session1.getAttribute("username");
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
		
		ProductEntity pro = this.getPro(currentIDpr);
		model.addAttribute("pro", pro);
		List<ProductEntity> products = this.getProducts();
		model.addAttribute("products", products);
		return "products/single-product";
	}
	
	@RequestMapping(value = "singleproduct", method = RequestMethod.POST)
	public String insertCart(ModelMap model, HttpServletRequest request, @Validated @ModelAttribute("addCart")  CartEntity cart,
			BindingResult errors, @RequestParam("quantity") Integer quantity) {
		
		String getID = request.getParameter("id");
		int currentIDpr=Integer.parseInt(getID);
		ProductEntity pro = this.getPro(currentIDpr);
		model.addAttribute("pro", pro);
			int OldQuantity = this.getQuantity(currentIDpr);
			if(cart.getQuantity()>OldQuantity)
			{
				model.addAttribute("messCart", "Quá số lượng còn lại !");
				return "products/single-product";
			}
			
			HttpSession session1 = request.getSession();
			String currentUser = (String) session1.getAttribute("username");
			int id = this.getIDUser(currentUser);
			CartPK pk = new CartPK();
			CustomerEntity user = new CustomerEntity();
			user.setId_user(id);
			ProductEntity product = new ProductEntity();
			product.setId_product(currentIDpr);
			pk.setProductEntity(product);
			pk.setCustomerEntity(user);
			cart.setPk(pk);
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				session.save(cart);
				t.commit();
				model.addAttribute("messCart", "Thêm vào giỏ hàng thành công !");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("messCart", "Sản phẩm đã được đặt !");
				return "products/single-product";
			} finally {
				session.close();

			}
			return "redirect:/products/index.htm";
		}
		
		
//		return "login/register";
		
	
	
	@RequestMapping(value="singleproduct/{id}.htm",params = "delete")
	public String delete(ModelMap model, @ModelAttribute("product") ProductEntity product, HttpServletRequest request, @PathVariable("id") Integer id) {
		HttpSession session1 = request.getSession();
		String currentUser = (String) session1.getAttribute("username");
		int idUser = this.getIDUser(currentUser);
		this.deleteCart(this.getOneCart(idUser,id));
		
		List<CartEntity> getCart = this.getCart(idUser);
		model.addAttribute("getCart", getCart);
		ProductEntity pro = this.getPro(id);
		model.addAttribute("pro", pro);
		List<ProductEntity> products = this.getProducts();
		model.addAttribute("products", products);
		return "redirect:/products/index.htm";
	}
	
	
	public List<ProductEntity> getProducts(){
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity";
		Query query = session.createQuery(hql);
		List<ProductEntity> list = query.list();
		return list;
	}
	
	public ProductEntity getPro(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity where id_product = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ProductEntity list =(ProductEntity) query.list().get(0);
		return list;
	}
	public Integer getQuantity(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT quantity FROM ProductEntity where id_product = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Integer sl = (Integer) query.list().get(0);
		return sl;
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
	public CartEntity getOneCart(Integer id,Integer idPr) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CartEntity where id_product = :idPr and ID_USER = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		query.setParameter("idPr", idPr);
		CartEntity list =(CartEntity) query.list().get(0);
		return list;
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
}
