package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="BILL")
public class BillEntity {
	@Id
	@Column(name="ID_BILL")
	@GeneratedValue
	private Integer id_bill;
	
	@Column(name="ID_USER")
	private Integer id_user;
	
	@Column(name="DATE_BILL")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date date_bill;
	
	@Column(name="VAT")
	private float vat;
	
	@OneToMany(mappedBy = "pk.billEntity", fetch = FetchType.EAGER)
	private Collection<BillDetailEntity> billDetailEntities;

	public BillEntity() {
		super();
	}

	public BillEntity(Integer id_bill, Integer id_user, Date date_bill, float vat,
			Collection<BillDetailEntity> billDetailEntities) {
		super();
		this.id_bill = id_bill;
		this.id_user = id_user;
		this.date_bill = date_bill;
		this.vat = vat;
		this.billDetailEntities = billDetailEntities;
	}

	public Integer getId_bill() {
		return id_bill;
	}

	public void setId_bill(Integer id_bill) {
		this.id_bill = id_bill;
	}

	public Integer getId_user() {
		return id_user;
	}

	public void setId_user(Integer id_user) {
		this.id_user = id_user;
	}

	public Date getDate_bill() {
		return date_bill;
	}

	public void setDate_bill(Date date_bill) {
		this.date_bill = date_bill;
	}

	public float getVat() {
		return vat;
	}

	public void setVat(float vat) {
		this.vat = vat;
	}

	public Collection<BillDetailEntity> getBillDetailEntities() {
		return billDetailEntities;
	}

	public void setBillDetailEntities(Collection<BillDetailEntity> billDetailEntities) {
		this.billDetailEntities = billDetailEntities;
	}
	
	
}
