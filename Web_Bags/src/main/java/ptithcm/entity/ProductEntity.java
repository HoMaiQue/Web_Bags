package ptithcm.entity;



import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;



@Entity
@Table(name="PRODUCT")
public class ProductEntity {
	@Id
	@GeneratedValue
	@Column(name="ID_PRODUCT")
	private int id_product;
	@Column(name="PRICCE")
	@Min(value=1, message = "giá tiền tối thiểu là 1")
	private float price;
	@Column(name="DESCR")
	@NotEmpty(message = "Mô tả sản phẩm không được để trống")
	private String descr;
	@Column(name="TITLE")	
	@NotEmpty(message = "Tên sản phẩm không được để trống")
	private String title;
	@Column(name="IMAGE")
	@NotEmpty(message = "Vui lòng chọn hình sản phẩm ")
	private String image;
	@ManyToOne
	@JoinColumn(name="ID_COLOR")
	private ColorEntity colors;
	@ManyToOne
	@JoinColumn(name="ID_BRAND")
	private BrandEntity brands;
	@Column(name="QUANTITY")
	@Min(value=1, message = "số lượng tối thiểu là 1")
	private Integer quantity;
	
	@OneToMany(mappedBy = "pk.productEntity", fetch = FetchType.EAGER,
	        cascade = CascadeType.ALL,
	        orphanRemoval = true)
	private Collection<BillDetailEntity> billDetailEntities;
	
	@OneToMany(mappedBy = "pk.productEntity", fetch = FetchType.EAGER,  cascade = CascadeType.ALL,
	        orphanRemoval = true)
	private Collection<CartEntity> cartEntities;

	public ProductEntity() {
		super();
	}

	public ProductEntity(int id_product, float price, String descr, String title, String image, ColorEntity colors,
			BrandEntity brands, Integer quantity, Collection<BillDetailEntity> billDetailEntities,
			Collection<CartEntity> cartEntities) {
		super();
		this.id_product = id_product;
		this.price = price;
		this.descr = descr;
		this.title = title;
		this.image = image;
		this.colors = colors;
		this.brands = brands;
		this.quantity = quantity;
		this.billDetailEntities = billDetailEntities;
		this.cartEntities = cartEntities;
	}

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public ColorEntity getColors() {
		return colors;
	}

	public void setColors(ColorEntity colors) {
		this.colors = colors;
	}

	public BrandEntity getBrands() {
		return brands;
	}

	public void setBrands(BrandEntity brands) {
		this.brands = brands;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Collection<BillDetailEntity> getBillDetailEntities() {
		return billDetailEntities;
	}

	public void setBillDetailEntities(Collection<BillDetailEntity> billDetailEntities) {
		this.billDetailEntities = billDetailEntities;
	}

	public Collection<CartEntity> getCartEntities() {
		return cartEntities;
	}

	public void setCartEntities(Collection<CartEntity> cartEntities) {
		this.cartEntities = cartEntities;
	}
	
	

	
	
	
}
