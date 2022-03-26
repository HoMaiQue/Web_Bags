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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.entity.BillDetailEntity;
import ptithcm.entity.ColorEntity;
import ptithcm.entity.CustomerEntity;
import ptithcm.entity.ProductEntity;


@Transactional
@Controller
public class LoginController {

	@Autowired
	SessionFactory factory;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(ModelMap model, @ModelAttribute("register") CustomerEntity user, HttpServletRequest request ) {
		HttpSession session = request.getSession();
		session.setAttribute("username", null);
		return "login/login1";
	}

	
	public List<CustomerEntity> getUser() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomerEntity";
		Query query = session.createQuery(hql);
		List<CustomerEntity> list = query.list();
		return list;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST, params = "btnLogin")
	public String login(ModelMap model, @Validated @ModelAttribute("register")  CustomerEntity user,
			BindingResult errors, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession session, @RequestParam("capcha") String veriCapcha, HttpServletRequest request, @ModelAttribute("product") ProductEntity product) {
		String capcha1 = session.getAttribute("captcha_security").toString();
		List<CustomerEntity> users = this.getUser();		
		
		boolean verify = false;
		if(capcha1.equals(veriCapcha)) {
			verify = true;
		}else {
			verify = false;
		}
		
		if(!verify) {
			model.addAttribute("reCapcha", "Vui lòng nhập đúng Capcha");
			return "login/login1";
		}else {
			for (CustomerEntity userLogin : users) {
				if (userLogin.getUsername().equals(username) && userLogin.getPassword().equals(password) ) {
					model.addAttribute("mess", "Đăng nhập thành công");
					session.setAttribute("id_role", userLogin.getRoles().getId_role());
					session.setAttribute("username", username);
					if(userLogin.getRoles().getId_role() == 0) {
						
						List<BillDetailEntity> billDetailEntities = this.getBillDetail();
						int totalQuantity = 0;
						float totalMoney = 0;
						for(BillDetailEntity bill: billDetailEntities) {
							totalQuantity += bill.getQuantity();
							totalMoney += (bill.getPrice() * bill.getQuantity());
						}
						model.addAttribute("userQuantity", users.size());
						model.addAttribute("totalQuantity", totalQuantity);
						model.addAttribute("totalMoney", totalMoney);
						model.addAttribute("billDetailEntities", billDetailEntities);
						return "statistics/statistics";
					}else {
						return "redirect:/index.htm";
					}
									
				}
				
			
			}
		}
		
			model.addAttribute("mess", "Tên đăng nhập hoặc mật khẩu không chính xác ! ");
			return "login/login1";

		
	}
	
	public List<BillDetailEntity> getBillDetail() {
		Session session = factory.getCurrentSession();
		String hql = "FROM BillDetailEntity";
		Query query = session.createQuery(hql);
		List<BillDetailEntity> list = query.list();
		return list;
		}
	
	

}
