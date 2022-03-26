package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="COLOR")
public class ColorEntity {
	@Id
	@Column(name="ID_COLOR")
	private int id_color;
	@Column(name="NAME_COLOR")
	private String name_color;
	@OneToMany(mappedBy = "colors", fetch = FetchType.EAGER)
	private Collection<ProductEntity> products;
	public int getId_color() {
		return id_color;
	}
	public void setId_color(int id_color) {
		this.id_color = id_color;
	}
	public String getName_color() {
		return name_color;
	}
	public void setName_color(String name_color) {
		this.name_color = name_color;
	}
	public Collection<ProductEntity> getProducts() {
		return products;
	}
	public void setProducts(Collection<ProductEntity> products) {
		this.products = products;
	}
	
	
}
