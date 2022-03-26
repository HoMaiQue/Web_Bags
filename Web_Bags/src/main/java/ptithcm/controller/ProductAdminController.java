package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.UploadFile;
import ptithcm.entity.BillDetailEntity;
import ptithcm.entity.CartEntity;
import ptithcm.entity.ColorEntity;
import ptithcm.entity.CustomerEntity;
import ptithcm.entity.ProductEntity;



@Transactional
@Controller
@RequestMapping("admin/")
public class ProductAdminController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	UploadFile baseUploadFile;
	
	@RequestMapping(value="product", method = RequestMethod.GET)
	public String index(ModelMap model, @ModelAttribute("product") ProductEntity product ) {
		List<ProductEntity> products = this.getProduct();
		model.addAttribute("products", products);
		model.addAttribute("btnStatus", "BtnAdd");
		model.addAttribute("title", "Thêm Sản phẩm");
		return "product_admin/productadmin";
	}

	@RequestMapping(value="product",params = "BtnAdd", method = RequestMethod.POST)
	public String insert(ModelMap model,@RequestParam("image") MultipartFile image, @Validated  @ModelAttribute("product") ProductEntity product, BindingResult errors) {
		model.addAttribute("btnStatus", "BtnAdd");
		System.out.println(product.getTitle());
		System.out.println(product.getPrice());
		System.out.println(product.getQuantity());
		System.out.println(product.getImage());
		System.out.println(product.getBrands().getId_brand());
		System.out.println(product.getColors().getId_color());
		System.out.println(product.getDescr());
		
		if(image.isEmpty()) {
			model.addAttribute("msgImage", "Vui lòng chọn ảnh");
		}
		else {
		try {
			String fileName  = image.getOriginalFilename();
			String photoPath =  baseUploadFile.getBasePath() + File.separator +  fileName;
		
			image.transferTo(new File(photoPath));
			product.setImage(fileName);
		}catch(Exception e) {
			
		}
		}
		
		
		Integer temp = this.insertProduct(product);
		if (temp != 0) {
			model.addAttribute("message123", "Thêm thành công");
		} else {
			model.addAttribute("message123", "Thêm thất bại!");
		}
		
		List<ProductEntity> products = this.getProduct();
		model.addAttribute("products", products);
		product.setTitle("");
		product.setPrice(0);
		product.setQuantity(0);
		product.setDescr("");
		return "product_admin/productadmin";
	}

	
// xoa san pham
	@RequestMapping(value="product/{id}.htm",params = "delete")
	public String delete(ModelMap model, @ModelAttribute("product") ProductEntity product, HttpServletRequest request, @PathVariable("id") Integer id) {
		model.addAttribute("title", "Thêm Sản phẩm");
		List<CartEntity> idUser  =this.getIdUserInCart();
		
		for (CartEntity item : idUser) {
			System.out.println(item.getPk().getCustomerEntity().getId_user());
			if (id==item.getPk().getProductEntity().getId_product()) {
				model.addAttribute("errDe", "Sản phẩm đã được mua không thể xóa");
				List<ProductEntity> products = this.getProduct();
				model.addAttribute("products", products);
				model.addAttribute("btnStatus", "BtnAdd");
				return "product_admin/productadmin";
			}
		}
		
		List<BillDetailEntity> idBill = this.getIdUserInBill();
		for (BillDetailEntity item1 : idBill) {
			if (id==item1.getPk().getProductEntity().getId_product()) {
				model.addAttribute("errDe", "Sản phẩm đã được mua không thể xóa");
				List<ProductEntity> products = this.getProduct();
				model.addAttribute("products", products);
				model.addAttribute("btnStatus", "BtnAdd");
				return "product_admin/productadmin";
			}
		}
		this.deleteProduct(this.getProduct(id));
		List<ProductEntity> products = this.getProduct();
		model.addAttribute("products", products);
		model.addAttribute("btnStatus", "BtnAdd");
		 return "product_admin/productadmin";
	}
// cap nhat san pham	
	@RequestMapping(value="product/{id}.htm",params = "update")
	public String update(ModelMap model, @ModelAttribute("product") ProductEntity product, HttpServletRequest request, @PathVariable("id") Integer id) {
//		model.addAttribute("title", "Cập nhật Sản phẩm");
//		List<CartEntity> idUser  =this.getIdUserInCart();
//		
//		for (CartEntity item : idUser) {
//			System.out.println(item.getPk().getCustomerEntity().getId_user());
//			if (id==item.getPk().getProductEntity().getId_product()) {
//				model.addAttribute("errDe", "Sản phẩm đã được mua không thể cập nhật");
//				List<ProductEntity> products = this.getProduct();
//				model.addAttribute("products", products);
//				model.addAttribute("btnStatus", "BtnAdd");
//				return "product_admin/productadmin";
//			}
//		}
//		
//		List<BillDetailEntity> idBill = this.getIdUserInBill();
//		for (BillDetailEntity item1 : idBill) {
//			if (id==item1.getPk().getProductEntity().getId_product()) {
//				model.addAttribute("errDe", "Sản phẩm đã được mua không thể cập nhật");
//				List<ProductEntity> products = this.getProduct();
//				model.addAttribute("products", products);
//				model.addAttribute("btnStatus", "BtnAdd");
//				return "product_admin/productadmin";
//			}
//		}
		
		model.addAttribute("product", this.getProduct(id));
		model.addAttribute("btnStatus", "BtnUpdate");
		HttpSession session = request.getSession();
		session.setAttribute("idPR", id);
		model.addAttribute("title", "Cập nhật Sản phẩm");
		 return "product_admin/productadmin";
	}
	
	@RequestMapping(value="product.htm",params = "BtnUpdate" )
	public String updateProduct1(ModelMap model,@RequestParam("image") MultipartFile image, @Validated  @ModelAttribute("product") ProductEntity product, BindingResult errors, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int id = Integer.parseInt(session.getAttribute("idPR").toString());
		product.setId_product(id);
		System.out.println(product.getId_product());
		System.out.println(product.getTitle());
		System.out.println(product.getPrice());
		System.out.println(product.getQuantity());
		System.out.println(product.getImage());
		System.out.println(product.getBrands().getId_brand());
		System.out.println(product.getColors().getId_color());
		System.out.println(product.getDescr());
		if(image.isEmpty()) {
			model.addAttribute("msgImage", "Vui lòng chọn ảnh");
		}else {
		try {
			String fileName  = image.getOriginalFilename();
			String photoPath =  baseUploadFile.getBasePath() + File.separator +  fileName;
		
			image.transferTo(new File(photoPath));
			product.setImage(fileName);
		}catch(Exception e) {
			
		}
		}
		Integer temp = this.updateProduct(product);
		if (temp != 0) {
			model.addAttribute("message123", "Update thành công");
			product.setTitle("");
			product.setPrice(0);
			product.setQuantity(0);
			product.setDescr("");
			model.addAttribute("title", "Thêm Sản phẩm");
			model.addAttribute("btnStatus", "BtnAdd");
		} else {
			model.addAttribute("message123", "Update thất bại!");
			product.setTitle(product.getTitle());
			product.setPrice(product.getPrice());
			product.setQuantity(product.getQuantity());
			product.setDescr(product.getDescr());
			model.addAttribute("title", "Cập nhật Sản phẩm");
			model.addAttribute("btnStatus", "BtnUpdate");
		}
		
		List<ProductEntity> products = this.getProduct();
		model.addAttribute("products", products);
		
		return "product_admin/productadmin";
	}
	
// lay 1 san pham	
	public ProductEntity getProduct(Integer id) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity where id_product = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		ProductEntity list = (ProductEntity) query.list().get(0);
		return list;
	}
	
//	them san pham
	public Integer insertProduct(ProductEntity pd) {
		Session session = factory.openSession();
		
		Transaction t = session.beginTransaction();

		try {
			session.save(pd);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
//xoa san pham
	public Integer deleteProduct(ProductEntity pd) {
		Session session = factory.getCurrentSession();
		

		try {
			session.delete(pd);
			
		} catch (Exception e) {
			
			return 0;
		}
		return 1;
	}
//cap nhat san pham	
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
//	lay tat ca san pham
	public List<ProductEntity> getProduct(){
		Session session = factory.getCurrentSession();
		String hql = "FROM ProductEntity";
		Query query = session.createQuery(hql);
		List<ProductEntity> list = query.list();
		return list;
	}
//lay tat ca color	
	@ModelAttribute("colorlist")
	public List<ColorEntity> getColor(){
		Session session = factory.getCurrentSession();
		String hql = "FROM ColorEntity";
		Query query = session.createQuery(hql);
		List<ColorEntity> list = query.list();
		return list;
	}
// lay tat ca brand	
	@ModelAttribute("brandlist")
	public List<ColorEntity> getBrand(){
		Session session = factory.getCurrentSession();
		String hql = "FROM BrandEntity";
		Query query = session.createQuery(hql);
		List<ColorEntity> list = query.list();
		return list;
	}
	
// Lay tat ca cart vs billdetail
	public List<CartEntity> getIdUserInCart() {
		Session session = factory.getCurrentSession();
		String hql = "FROM CartEntity";
		Query query = session.createQuery(hql);
		List<CartEntity> list = query.list();
		return list;
	}
	
	public List<BillDetailEntity> getIdUserInBill() {
		Session session = factory.getCurrentSession();
		String hql = "FROM BillDetailEntity";
		Query query = session.createQuery(hql);
		List<BillDetailEntity> list = query.list();
		return list;
	}
	

	}

