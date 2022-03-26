package ptithcm.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;

@Embeddable
public class BillDetailPK implements Serializable{
	
	@ManyToOne
	private ProductEntity productEntity;
	
	@ManyToOne 
	private BillEntity billEntity;

	public BillDetailPK() {
		super();
	}

	public BillDetailPK(ProductEntity productEntity, BillEntity billEntity) {
		super();
		this.productEntity = productEntity;
		this.billEntity = billEntity;
	}

	public ProductEntity getProductEntity() {
		return productEntity;
	}

	public void setProductEntity(ProductEntity productEntity) {
		this.productEntity = productEntity;
	}

	public BillEntity getBillEntity() {
		return billEntity;
	}

	public void setBillEntity(BillEntity billEntity) {
		this.billEntity = billEntity;
	}
	
	
}
