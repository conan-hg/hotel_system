package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "guest")
@NamedQueries({
	@NamedQuery(
	        name = "checkLoginNameAndPassword",
	        query = "SELECT g FROM Guest AS g WHERE g.name = :name AND g.password = :pass"
	    )
})
@Entity
public class Guest {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

	@Column(name = "name", nullable = false, unique = true)
    private String name;

	@Column(name = "password", length = 64, nullable = false)
	private String password;

	@Column(name = "phone", nullable = false, unique = true)
    private String phone;

	@Column(name = "mail",  nullable = false, unique = true)
	private String mail;

	@Column(name = "created_at",  nullable = false)
	private Timestamp created_at;

	@Column(name = "updated_at",  nullable = false)
	private Timestamp updated_at;

	@Column(name = "admin_flag", nullable = false)
    private Integer admin_flag;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public Timestamp getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}

	public Integer getAdmin_flag() {
		return admin_flag;
	}

	public void setAdmin_flag(Integer admin_flag) {
		this.admin_flag = admin_flag;
	}






}
















