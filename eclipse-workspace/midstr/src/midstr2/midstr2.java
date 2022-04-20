package midstr2;
import java.util.Scanner;

//가변 매개변수 사용 
public class midstr2 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("문자열을 입력하시오: ");
		String s = sc.next();
		System.out.print("시작순서를 입력하시오: ");
		String a = sc.next();
		System.out.print("개수를 입력하시오: ");
		String b = sc.next();
		
		String result = midstr(s, a, b);
		System.out.println("결과: " + result);
	}
	
	public static String midstr(String ...s) {
		
		int a = Integer.parseInt(s[1]);
		int b = Integer.parseInt(s[2]);
		
		if(a > s[0].length() | a+b > s[0].length()) {
			System.out.println("잘못된 입력값 입니다");
			System.exit(1);
		}

		return s[0].substring(a-1, a+b-1);
	}
	
}
