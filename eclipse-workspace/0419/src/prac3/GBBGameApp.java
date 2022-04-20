package prac3;
import java.util.Scanner;

public class GBBGameApp {

	public static void main(String[] args) {
		
		Scanner s = new Scanner(System.in);
		System.out.println("가위 바위 보 게임입니다. 가위, 바위, 보 중에서 입력하세요");
		System.out.print("철수 >> ");
		String a = s.next();
		System.out.print("영회 >> ");
		String b = s.next();
		
		
		if(a.equals("가위")) {
			if(b.equals("가위")) {
				System.out.print("무승부 입니다");
			} else if(b.equals("바위")) {
				System.out.print("영희가 이겼습니다");
			} else {
				System.out.print("철수가 이겼습니다");
			}
		} else if(a.equals("바위")) {
			if(b.equals("바위")) {
				System.out.print("무승부 입니다");
			} else if(b.equals("보")) {
				System.out.print("영희가 이겼습니다");
			} else {
				System.out.print("철수가 이겼습니다");
			}
		} else if(a.equals("보")) {
			if(b.equals("보")) {
				System.out.print("무승부 입니다");
			} else if(b.equals("가위")) {
				System.out.print("영희가 이겼습니다");
			} else {
				System.out.print("철수가 이겼습니다");
			}
		}
		
	}	
}
