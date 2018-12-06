package com.playchoice.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

public class SqlInsert {
	static Random rand = new Random();

	static int rand(int max) {
		return rand.nextInt(max) + 1;
	}

	public static void main(String[] args) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = sdf.parse("2018-12-01 00:00:00");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		Calendar end = Calendar.getInstance();
		end.setTime(sdf.parse("2018-12-30 23:00:00"));
		int i = 0;
		while (calendar.before(end)) {
			++i;
			int quantity = rand(4);
			System.out.printf("INSERT INTO `payment` (`m_code`, `s_id`, `p_price`, `p_quantity`, `p_time`) "
							+ "VALUES(%d, %d, %d, %d, '%s');\n"
								, rand(16), rand(2403), 10000 * quantity, quantity, sdf.format(calendar.getTime()));
			calendar.add(Calendar.HOUR, 1);
		}

	}

}
