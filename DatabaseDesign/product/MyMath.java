package design.vo;

import java.math.BigDecimal;

public class MyMath {
	public static double round(double num, int scale) {
		BigDecimal bd = new BigDecimal(num);
		return bd.divide(new BigDecimal(1), scale, BigDecimal.ROUND_HALF_UP)
				.doubleValue();
	}
}
 