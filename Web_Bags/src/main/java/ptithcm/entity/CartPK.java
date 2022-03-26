package ptithcm.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@Embeddable
public class CartPK implements Serializable{
	
	@ManyToOne
	private ProductEntity productEntity;
	
	@ManyToOne
	private CustomerEntity customerEntity;

	public CartPK() {
		super();
	}

	public CartPK(ProductEntity productEntity, CustomerEntity customerEntity) {
		super();
		this.productEntity = productEntity;
		this.customerEntity = customerEntity;
	}

	public ProductEntity getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(ProductEntity productEntity) {
		this.productEntity = productEntity;
	}

	public CustomerEntity getCustomerEntity() {
		return customerEntity;
	}

	public void setCustomerEntity(CustomerEntity customerEntity) {
		this.customerEntity = customerEntity;
	}
	
	
}
