package midstr;
import java.util.Scanner;

public class Midstr {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열 입력: ");
		String s = sc.next();
		System.out.print("시작 순서: ");
		int a = sc.nextInt();
		System.out.print("개수: ");
		int b = sc.nextInt();
		String result = midstr(s, a, b);
		
		if(a > s.length() | a+b > s.length()) {
			System.out.println("잘못된 입력값 입니다.");
		} else {
			System.out.println(result);	
		}	
	}
	
	public static String midstr(String s, int a, int b) {
		
		String result = "";
		
		for(int i = a-1; i<a+b-1; i++) {
			result += s.charAt(i);
		}
		return result;
	}
}
