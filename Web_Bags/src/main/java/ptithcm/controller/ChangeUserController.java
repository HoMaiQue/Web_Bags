package ptithcm.controller;



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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.CustomerEntity;
import ptithcm.entity.RoleEntity;

@Transactional
@Controller

public class ChangeUserController {
	@Autowired
	SessionFactory factory;
	@RequestMapping(value="changeUser", method = RequestMethod.GET)
	public String showUsers( ModelMap model,@Validated  @ModelAttribute("user") CustomerEntity user, BindingResult errors, HttpServletRequest request){
		HttpSession session = request.getSession();
		String currentUser = (String) session.getAttribute("username");
		int id = this.getIDUser(currentUser);
		model.addAttribute("user", this.getUser(id));
		System.out.println("1"+ session.getAttribute("username"));
		System.out.println("@@"+id);
		return "change-user/change-register";
	}
	@RequestMapping(value="changeUser.htm",method = RequestMethod.POST )
	public String updateUser(ModelMap model,@Validated  @ModelAttribute("user") CustomerEntity user, BindingResult errors, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String currentUser = (String) session.getAttribute("username");
		int id = this.getIDUser(currentUser);
		user.setId_user(id);
		user.setUsername(currentUser);
		RoleEntity r =new RoleEntity();
		r.setId_role(1);
		user.setRoles(r);
		Integer temp = this.updateUser(user);
		System.out.println(user.getId_user());
		System.out.println(user.getEmail());
		System.out.println(user.getUsername());
		System.out.println(user.getPhone());
		System.out.println(user.getAddress_customer());
		System.out.println(user.isSex());
		if (temp != 0) {
			System.out.println("success");
			return "redirect:/index.htm";
		} else {
			System.out.println("failed");
			
		}		
		return "change-user/change-register";
	}
	
	
	public CustomerEntity getUser(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomerEntity where id_user = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		CustomerEntity list =(CustomerEntity) query.list().get(0);
		return list;
	}
	public Integer getIDUser(String username) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT id_user FROM CustomerEntity where username = :username";
		Query query = session.createQuery(hql);
		query.setParameter("username", username);
		Integer id = (Integer) query.list().get(0);
		return id;
	}
	public Integer updateUser(CustomerEntity us) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(us);
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
