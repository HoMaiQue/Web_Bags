package ptithcm.entity;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="BILL_DETAIL")
@AssociationOverrides({
    @AssociationOverride(name = "pk.billEntity", 
        joinColumns = @JoinColumn(name = "ID_BILL")),
    @AssociationOverride(name = "pk.productEntity", 
        joinColumns = @JoinColumn(name = "ID_PRODUCT")) })
public class BillDetailEntity {
	
	@EmbeddedId BillDetailPK pk;
	
	
	@Column(name="QUANTITY")
	private int quantity;
	
	@Column(name="PRICE")
	private float price;
	
	@Column(name="TOTAL")
	private float total;
	
	
	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public BillDetailEntity() {
		super();
	}

	public BillDetailEntity(BillDetailPK pk) {
		super();
		this.pk = pk;
	}

	public BillDetailPK getPk() {
		return pk;
	}

	public void setPk(BillDetailPK pk) {
		this.pk = pk;
	}

	public BillDetailEntity(BillDetailPK pk, int quantity, float price) {
		super();
		this.pk = pk;
		this.quantity = quantity;
		this.price = price;
	}
	
	
	
}
