package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="BRAND")
public class BrandEntity {
	@Id
	@Column(name="ID_BRAND")
	private int id_brand;
	@Column(name="NAME_BRAND")
	private String name_brand;
	@OneToMany(mappedBy = "brands", fetch = FetchType.EAGER)
	private Collection<ProductEntity> products;
	public int getId_brand() {
		return id_brand;
	}
	public void setId_brand(int id_brand) {
		this.id_brand = id_brand;
	}
	public String getName_brand() {
		return name_brand;
	}
	public void setName_brand(String name_brand) {
		this.name_brand = name_brand;
	}
	public Collection<ProductEntity> getProducts() {
		return products;
	}
	public void setProducts(Collection<ProductEntity> products) {
		this.products = products;
	}
	
}
