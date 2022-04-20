package chkstr5;
import java.util.Scanner;

//지역클래스 
public class Chkstr5 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String s = sc.next();
		String t = sc.next();
		
		Select P = new Select(s,t);
		
		System.out.println(P.check());
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

class Select extends Tr {
	public Select(String s, String t) {
		super(s,t);
	}
	
	int check() {
		
		class Numcmp{
			
			int cmp() {
				double a = Double.parseDouble(s);
				double b = Double.parseDouble(t);
				
				if(a > b) return 1;
				else if(a < b) return -1;
				else return 0;
			}
		}
		
		class Strcmp{
			
			int cmp() {
				return s.compareTo(t);
			}
		}

	
		for(int i=0; i < s.length(); i++) {
			if(!Character.isDigit(s.charAt(i)) && s.charAt(i) != '-' && s.charAt(i) != '.') {
				return new Strcmp().cmp();
			}
		}
		for(int j=0; j < t.length(); j++) {
			if(!Character.isDigit(t.charAt(j)) && t.charAt(j) != '-' && t.charAt(j) != '.') {
				return new Strcmp().cmp();
			}
		}
		
		return new Numcmp().cmp();
		
	}
}
