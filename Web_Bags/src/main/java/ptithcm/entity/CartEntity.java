package ptithcm.entity;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.Min;

@Entity
@Table(name="CART")
@AssociationOverrides({
    @AssociationOverride(name = "pk.productEntity", 
        joinColumns = @JoinColumn(name = "ID_PRODUCT")),
    @AssociationOverride(name = "pk.customerEntity", 
        joinColumns = @JoinColumn(name = "ID_USER")) })
public class CartEntity {
	@EmbeddedId CartPK pk;
	

	@Column(name = "QUANTITY")
	@Min(value=1, message = "Số lượng tối thiểu là 1")
	private int quantity;
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public CartEntity() {
		super();
	}

	public CartEntity(CartPK pk) {
		super();
		this.pk = pk;
	}

	public CartPK getPk() {
		return pk;
	}

	public void setPk(CartPK pk) {
		this.pk = pk;
	}
	
	
}
