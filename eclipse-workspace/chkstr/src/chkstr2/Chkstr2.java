package chkstr2;
import java.util.Scanner;

public class Chkstr2 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		String s = sc.nextLine();
		String t = sc.nextLine();
		
		Tr P, Q;
		
		P = new Select(s,t);
		Q = ((Select)P).check();
		
		System.out.println(((Select)P).connect(Q));
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

class Strcmp extends Tr { //cmp메소드를 가지는 자식클래스 
	
	public Strcmp(String s, String t) { //super 초기화 
		super(s,t);
	}
	
	public int cmp() { //cmp메소드 
		return s.compareTo(t);
	}
}

class Numcmp extends Tr { //cmp메소드를 가지는 자식클래스 
	
	public Numcmp(String s, String t) { //super 초기화 
		super(s,t);
	}
	
	public int cmp() { //실수로 변환하여 비교하는 cmp메소드 
		double a = Double.parseDouble(s);
		double b = Double.parseDouble(t);
		
		if(a > b) return 1;
		else if(a < b) return -1;
		else return 0;
	}
}

class Select extends Tr { //cmp메소드를 실행시키는 자식클래스 
	
	public Select(String s, String t) { //super 초기화 
		super(s,t);
	}
	
	public Tr check() { //둘중에 하나를 return 하므로 Tr
	
		for(int i = 0; i < s.length(); i++) {
			if(!Character.isDigit(s.charAt(i)) && s.charAt(i) != '-' && s.charAt(i) != '.') return new Strcmp(s,t);
		}
		for(int j = 0; j < t.length(); j++) {
			if(!Character.isDigit(s.charAt(j)) && t.charAt(j) != '-' && t.charAt(j) != '.') return new Strcmp(s,t); 
		}
		return new Numcmp(s,t);
	}
	
	public int connect(Tr tr) { //매개변수로 받은 객체의 CMP메소드 실행 결과를 return 
		if(tr instanceof Strcmp) { //레퍼런스이름 instanceof 클래스이름 
			return ((Strcmp)tr).cmp();
		} else {
			return ((Numcmp)tr).cmp();
		}
	}
}
