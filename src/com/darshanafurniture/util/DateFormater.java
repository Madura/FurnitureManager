package com.darshanafurniture.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormater {
	
	public static Date StringDateToDate(String strDate) {
		Date dateAndTime = null;
		try {
			dateAndTime = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss").parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("Date formate exception");
		}
		return dateAndTime;
	}
	
	public static String DateToStringDate(Date date) {
		String strDate = new SimpleDateFormat("YYY-MM-DD HH:mm:ss").format(date);
		return strDate;
	}
	

}
