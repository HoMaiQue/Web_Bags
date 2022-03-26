package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.BillDetailEntity;
import ptithcm.entity.CustomerEntity;

@Transactional
@Controller
@RequestMapping("admin")
public class StatisticsController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("statistics")
	public String index(ModelMap model) {
		List<BillDetailEntity> billDetailEntities = this.getBillDetail();
		List<CustomerEntity> users = this.getAllUser();
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
	}
	
	
	public List<BillDetailEntity> getBillDetail() {
		Session session = factory.getCurrentSession();
		String hql = "FROM BillDetailEntity";
		Query query = session.createQuery(hql);
		List<BillDetailEntity> list = query.list();
		return list;
		}
	
	public List<CustomerEntity> getAllUser() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CustomerEntity";
		Query query = session.createQuery(hql);
		List<CustomerEntity> list = query.list();
		return list;
		}
	
	
	
}
