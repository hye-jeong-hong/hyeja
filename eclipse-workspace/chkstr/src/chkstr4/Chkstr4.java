package chkstr4;
import java.util.Scanner;

//내부클래스 만들어 구현 (맴버클래스)
public class Chkstr4 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String s = sc.next();
		String t = sc.next();
		
		Tr P;
		
		P = new Select(s,t);

		
		
		System.out.println(((Select)P).check());
	}
}


class Tr {
	String s;
	String t;
	
	public Tr(String s, String t) {
		this.s = s;
		this.t = t;
	}
}

class Select extends Tr{
	
	
	public Select(String s, String t) {
		super(s,t);
	}
	
	class Numcmp {
		
		int cmp(String s, String t) {
			double a = Double.parseDouble(s);
			double b = Double.parseDouble(t);
			
			if(a > b) return 1;
			else if (a < b) return -1;
			else return 0;
		}
	}
	
	class Strcmp {
		
		int cmp(String s, String t) {
			return s.compareTo(t);
		}
	}
	
	public int check() {
		
		for(int i = 0; i < s.length(); i++) {
			if(!Character.isDigit(s.charAt(i)) && s.charAt(i) != '-' && s.charAt(i) != '.') {
				return new Strcmp().cmp(s,t);
			}
		}
		for(int j = 0; j < t.length(); j++) {
			if(!Character.isDigit(t.charAt(j)) && t.charAt(j) != '-' && t.charAt(j) != '.') {
				return new Strcmp().cmp(s,t);
			}
		}
		
		return new Numcmp().cmp(s,t);
	}
}