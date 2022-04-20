package revsqueeze;
import java.util.Scanner;

//문자열s에서 문자c를 제거하고 역변환 
public class revsqueeze {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열을 입력하시오: ");
		String s = sc.nextLine();
		System.out.print("문자를 입력하시오: ");
		char c = sc.next().charAt(0);
		
		String result = revsqueeze(s,c);
		System.out.println("결과: " + result);
	}
	
	public static String revsqueeze (String s, char c){
		
		String result = "";
		String del = String.valueOf(c); //문자 c를 String형으로 변환 
		
		s = s.replace(del, "");
		
		for(int i = s.length()-1; 0 <= i; i--) {
			result += s.charAt(i);
		}
		
		return result;
	}
}
