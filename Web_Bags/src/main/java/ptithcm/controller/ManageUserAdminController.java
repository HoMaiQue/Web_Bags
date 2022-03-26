package ptithcm.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import ptithcm.entity.BillEntity;
import ptithcm.entity.CartEntity;
import ptithcm.entity.CartPK;
import ptithcm.entity.CustomerEntity;
import ptithcm.entity.ProductEntity;

@Transactional
@Controller
@RequestMapping("admin/")
public class ManageUserAdminController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("users")
	public String showUsers( ModelMap model){
		List<CustomerEntity> users = this.getCustomers();
		model.addAttribute("users", users);
		
		 
		return "manage-users-admin/manageUsers";
	}
	
	
	@RequestMapping(value="users/{id}.htm",params = "delete")
	public String delete(ModelMap model, @PathVariable("id") Integer id) {
		List<CartEntity> idUser  =this.getIdUserInCart();
		
		for (CartEntity item : idUser) {
			System.out.println(item.getPk().getCustomerEntity().getId_user());
			if (id==item.getPk().getCustomerEntity().getId_user()) {
				model.addAttribute("errDe", "Tài khoản đã mua hàng không thể xóa");
				List<CustomerEntity> users = this.getCustomers();
				model.addAttribute("users", users);
				return "manage-users-admin/manageUsers";
			}
		}
		
		List<Integer> idBill = this.getIdUserInBill();
		for (Integer item1 : idBill) {
			if (id==item1) {
				model.addAttribute("errDe", "Tài khoản đã mua hàng không thể xóa");
				List<CustomerEntity> users = this.getCustomers();
				model.addAttribute("users", users);
				return "manage-users-admin/manageUsers";
			}
		}
		this.deleteUser(this.getUser(id));	
		List<CustomerEntity> users = this.getCustomers();
		model.addAttribute("users", users);
		return "manage-users-admin/manageUsers";
	}
	
	public List<CustomerEntity> getCustomers(){
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomerEntity";
		Query query = session.createQuery(hql);
		List<CustomerEntity> list = query.list();
		return list;
	}
	
	public Integer deleteUser(CustomerEntity us) {
		Session session = factory.getCurrentSession();
		

		try {
			session.delete(us);
	
		} catch (Exception e) {
		
			return 0;
		} 
		return 1;
	}
	public CustomerEntity getUser(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomerEntity where id_user = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CustomerEntity list =(CustomerEntity) query.list().get(0);
		return list;
	}
	public List<CartEntity> getIdUserInCart() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CartEntity";
		Query query = session.createQuery(hql);
		List<CartEntity> list = query.list();
		return list;
	}
	
	public List<Integer> getIdUserInBill() {
		Session session = factory.getCurrentSession();
		String hql = "select id_user FROM BillEntity";
		Query query = session.createQuery(hql);
		List<Integer> list = query.list();
		return list;
	}
}
