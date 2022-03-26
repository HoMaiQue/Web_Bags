package ptithcm.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.entity.ContactEntity;

@Transactional
@Controller
@RequestMapping("admin/")
public class ManageContactAdminController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("contact")
	public String showContact( ModelMap model){
		List<ContactEntity> contact = this.getContact();
		model.addAttribute("contact", contact);
		return "manage-contact-admin/manageContact";
	}
	
	
	@RequestMapping(value="contact/{id}.htm",params = "delete")
	public String delete(ModelMap model, @PathVariable("id") Integer id) {
		this.deleteContact(this.getContact(id));
		List<ContactEntity> contact = this.getContact();
		
		
		model.addAttribute("contact", contact);
		return "manage-contact-admin/manageContact";
	}
	
	public List<ContactEntity> getContact(){
		Session session = factory.getCurrentSession();
		String hql = "FROM ContactEntity";
		Query query = session.createQuery(hql);
		List<ContactEntity> list = query.list();
		return list;
	}
	
	public Integer deleteContact(ContactEntity ct) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.delete(ct);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	public ContactEntity getContact(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ContactEntity where id_contact = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ContactEntity list = (ContactEntity) query.list().get(0);
		return list;
	}
}
