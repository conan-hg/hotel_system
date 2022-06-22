package models.validators;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import models.Booking;

public class BookingValidator {
	public static List<String> validate(Booking b) {
		ArrayList<String> errors = new ArrayList<String>();

		String room_type_error = _validateRoom_type(b.getRoom_type());
        if(!room_type_error.equals("")) {
            errors.add(room_type_error);
        }

        String adult_people_error = _validateAdult_people(b.getAdult_people());
        if(!adult_people_error.equals("")) {
            errors.add(adult_people_error);
        }

        String child_people_error = _validateChild_people(b.getChild_people());
        if(!child_people_error.equals("")) {
            errors.add(child_people_error);
        }

        String adult_people_child_people_error = _validateAdult_people_Child_people(b.getAdult_people(), b.getChild_people());
        if(!adult_people_child_people_error.equals("")) {
            errors.add(adult_people_child_people_error);
        }


        /*
		String check_in_date_error = _validateCheck_in_date(String.valueOf(b.getCheck_in_date()));
        if(!check_in_date_error.equals("")) {
            errors.add(check_in_date_error);
        }
        */

        String check_out_date_error = _validateCheck_out_date(String.valueOf(b.getCheck_in_date()), String.valueOf(b.getCheck_out_date()));
        if(!check_out_date_error.equals("")) {
            errors.add(check_out_date_error);
        }

        Date ci = b.getCheck_in_date();
        Date co = b.getCheck_out_date();

        long miliseconds = System.currentTimeMillis();
        Date date = new Date(miliseconds);

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        calendar.add(Calendar.DATE, -1);

        java.util.Date d1 = calendar.getTime();

        if(ci.after(co) || d1.after(ci) || d1.after(co)) {
        	errors.add("日程を確認して下さい。");
        }




        return errors;
	}

	private static String _validateRoom_type(String room_type) {
        if(room_type.equals("0")) {
            return "お部屋のタイプを入力して下さい。";
            }

        return "";
    }

    private static String _validateAdult_people(String adult_people) {
        if(adult_people.equals("0")) {
            return "大人の人数を入力して下さい。";
            }

        return "";
    }

    private static String _validateChild_people(String child_people) {
        if(child_people.equals("0")) {
            return "小人の人数を入力して下さい。";
            }

        return "";
    }

    private static String _validateAdult_people_Child_people(String adult_people, String child_people) {
        if(adult_people.equals("1") && child_people.equals("1")) {
            return "人数を確認して下さい。";
            }

        return "";
    }

 /*  private static String _validateCheck_in_date(String check_in_date) {
        if(check_in_date == null ) {
            return "チェックインを入力してください。";
            }

        return "";
    }
*/
    private static String _validateCheck_out_date(String check_out_date, String check_in_date) {
        if(check_out_date.equals(check_in_date)) {
            return "日程をを確認して下さい。";
            }

        return "";
    }


}














