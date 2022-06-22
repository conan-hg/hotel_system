package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Guest;

public class GuestValidator {
	public static List<String> validate(Guest g, Boolean passwordCheckFlag) {
		List<String> errors = new ArrayList<String>();

		String name_error = validateName(g.getName());
		if(!name_error.equals("")){
			errors.add(name_error);
		}


		String password_error = validatePassword(g.getPassword(), passwordCheckFlag);
		if(!password_error.equals("")) {
			errors.add(password_error);
		}

		String phone_error = validatePhone(g.getPhone());
		if(!phone_error.equals("")) {
			errors.add(phone_error);
		}

		String mail_error = validateMail(g.getMail());
		if(!mail_error.equals("")) {
			errors.add(mail_error);
		}

		return errors;
	}

	public static String validateName(String name) {
		if(name == null || name.equals("")){
			return "ゲスト名を入力してください。";
		}
		return "";
	}

	public static String validatePassword(String password, Boolean passwordCheckFlag) {
		if(passwordCheckFlag && (password == null || password.equals(""))) {
			return "パスワードを入力してください。";
		}
		return "";
	}

	public static String validatePhone(String phone){
		if(phone == null || phone.equals("")) {
			return "電話番号を入力してください。";
		}
		return "";
	}

	public static String validateMail(String mail){
		if(mail == null || mail.equals("")) {
			return "メールアドレスを入力してください。";
		}
		return "";
	}


}




















