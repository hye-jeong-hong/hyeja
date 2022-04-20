package prac2;
import java.util.Scanner;

public class useswitch {

	public static void main(String[] args) {
		
		char grade;
		Scanner sc = new Scanner(System.in);
		
		System.out.println("점수를 입력하세요 (0~100)");
		
		int score = sc.nextInt();
		
		score = score / 10;
		switch(score) {
			case 9: 
				System.out.println('A');
				break;
			
			case 8: 
				System.out.println('B');
				break;
			
			case 7: 
				System.out.println('C');
				break;
			
			case 6: 
				System.out.println('D');
				break;
			
			default: 
				System.out.println('F');
				break;	
		}
		

		
	}
}
