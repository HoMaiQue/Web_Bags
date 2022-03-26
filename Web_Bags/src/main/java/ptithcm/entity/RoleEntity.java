package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ROLE")
public class RoleEntity {
	@Id
	@Column(name="ID_ROLE")
	private int id_role;
	@Column(name="ROLE")
	private String role;
	@OneToMany(mappedBy = "roles", fetch = FetchType.EAGER)
	private Collection<CustomerEntity> customers;
	public int getId_role() {
		return id_role;
	}
	public void setId_role(int id_role) {
		this.id_role = id_role;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Collection<CustomerEntity> getCustomers() {
		return customers;
	}
	public void setCustomers(Collection<CustomerEntity> customers) {
		this.customers = customers;
	}
	
}
