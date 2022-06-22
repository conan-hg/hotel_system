package models;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "booking")
@NamedQueries({
	@NamedQuery(
			name = "getAllbooking",
			query = "SELECT b FROM Booking AS b ORDER BY b.id DESC"
	),
	@NamedQuery(
			name = "getMyAllbooking",
			query = "SELECT b FROM Booking AS b WHERE b.guest = :guest ORDER BY b.id DESC"
	)
})
@Entity
public class Booking {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "guest_id", nullable = false)
	private Guest guest;

	@Column(name = "room_type", nullable = false)
	private String room_type;

	@Column(name = "adult_people", nullable = false)
	private String adult_people;

	@Column(name = "child_people", nullable = false)
	private String child_people;

	@Column(name = "check_in_date", nullable = false)
	private Date check_in_date;

	@Column(name = "check_out_date", nullable = false)
	private Date check_out_date;

	@Lob
	@Column(name = "content", nullable = false)
	private String content;

	@Column(name = "created_at",  nullable = false)
	private Timestamp created_at;

	@Column(name = "updated_at",  nullable = false)
	private Timestamp updated_at;

	@Column(name = "delete_flag",  nullable = false)
	private Integer delete_flag;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Guest getGuest() {
		return guest;
	}

	public void setGuest(Guest guest) {
		this.guest = guest;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getAdult_people() {
		return adult_people;
	}

	public void setAdult_people(String adult_people) {
		this.adult_people = adult_people;
	}

	public String getChild_people() {
		return child_people;
	}

	public void setChild_people(String child_people) {
		this.child_people = child_people;
	}

	public Date getCheck_in_date() {
		return check_in_date;
	}

	public void setCheck_in_date(Date check_in_date) {
		this.check_in_date = check_in_date;
	}

	public Date getCheck_out_date() {
		return check_out_date;
	}

	public void setCheck_out_date(Date check_out_date) {
		this.check_out_date = check_out_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Integer getDelete_flag() {
		return delete_flag;
	}

	public void setDelete_flag(Integer delete_flag) {
		this.delete_flag = delete_flag;
	}














}

















