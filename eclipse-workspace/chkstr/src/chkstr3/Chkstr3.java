package chkstr3;
import java.util.Scanner;


public class Chkstr3 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String s = sc.next();
		String t = sc.next();
		
		Select P;
		Tr Q;
		
		P = new Select(s,t);
		Q = P.check();
		
		System.out.println(Q.cmp());
	}
}

abstract class Tr { //두 문자열과 두 문자열의 상태 정보를 가지는 부모클래스 
	String s;
	String t;
	
	public Tr(String s, String t) {
		this.s = s;
		this.t = t;
	}
	public abstract int cmp();
}

class Strcmp extends Tr {
	
	public Strcmp(String s, String t) {
		super(s,t);
	}
	public int cmp() {
		return s.compareTo(t);
	}
}

class Numcmp extends Tr {
	
	public Numcmp(String s, String t) {
		super(s,t);
	}
	
	public int cmp() {
		double a = Double.parseDouble(s);
		double b = Double.parseDouble(t);
		
		if(a > b) return 1;
		else if(a < b) return -1;
		else return 0;
	}
}

class Select {
	
	String s;
	String t;
	
	public Select(String s, String t) {
		this.s = s;
		this.t = t;
	}
	
	public Tr check() {
		for(int i = 0; i < s.length(); i++) {
			if(!Character.isDigit(s.charAt(i)) && s.charAt(i) != '-' && s.charAt(i) != '.') return new Strcmp(s,t);
		}
		for(int j = 0; j < t.length(); j++) {
			if(!Character.isDigit(t.charAt(j)) && t.charAt(j) != '-' && t.charAt(j) != '.') return new Strcmp(s,t);
		}
		
		return new Numcmp(s,t);
	}
}




