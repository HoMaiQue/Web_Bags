package ptithcm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="CONTACT")
public class ContactEntity {
	@Id
	@GeneratedValue
	@Column(name="ID_CONTACT")
	private int id_contact;
	@Column(name="NAME")
	@NotEmpty(message ="Tên không được để trống")
	private String name;
	@Column(name="EMAIL")
	@NotEmpty(message ="Email không được để trống")
	@Email(message ="Sai định dạng email ")
	private String email;
	@Column(name="TOPIC")
	private String topic;
	@Column(name="[CONTENT]")
	@NotEmpty(message ="Nội dung không được để trống !")
	private String content;
	public int getId_contact() {
		return id_contact;
	}
	public void setId_contact(int id_contact) {
		this.id_contact = id_contact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
