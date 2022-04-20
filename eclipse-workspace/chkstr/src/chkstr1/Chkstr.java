package chkstr1;
import java.util.Scanner;

public class Chkstr {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String s = sc.nextLine();
		String t = sc.nextLine();
		double a, b;
		int result;
		
		Ts P = new Ts(s,t); //str, num중에 뭐가 반환될지 모르기때문에 Ts사용 
		int cond = P.check();
		
		if(cond == Ts.STR) {
			result = s.compareTo(t); //두 개의 값을 비교하여 int값으로 변환 
		} else {
			a = Double.parseDouble(s);
			b = Double.parseDouble(t);
			if(a > b) result = 1;
			else if(a < b) result = -1;
			else result = 0;
		}
		System.out.println(result);
	}
}

class Ts {
	final static int NUM = 0;
	final static int STR = 1;
	private String s, t;
	
	public Ts(String s, String t) {
		this.s = s;
		this.t = t;
	}
	
	int check() {
		
		for(int i = 0; i < s.length(); i++) {
			if(!Character.isDigit(s.charAt(i)) && s.charAt(i) != '-' && s.charAt(i) != '.') return STR;
		}
		for (int j = 0; j < t.length(); j++) {
			if(!Character.isDigit(s.charAt(j)) && t.charAt(j) != '-' && t.charAt(j) != '.') return STR;
		}
		
		return NUM;
	}
	
}