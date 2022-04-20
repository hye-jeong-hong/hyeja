package prac1;
import java.util.Scanner;

public class money {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("돈의 금액을 입력하시오");
		
		int money = sc.nextInt();
		int m_50000 = 0, m_10000 = 0, m_5000 = 0, m_1000 = 0, m_500 = 0, m_100 = 0, m_50 = 0;
		
		
		
		m_50000 = money/50000;
		money %= 50000;
		
		m_10000 = money/10000;
		money %= 10000;
		
		m_5000 = money/5000;
		money %= 5000;
		
		m_1000 = money/1000;
		money %= 1000;
		
		m_500 = money/500;
		money %= 500;
		
		m_100 = money/100;
		money %= 100;
		
		m_50 = money/50;
		money %= 50;
		
		
		
		
		System.out.println("오만원 -> " + m_50000);
		System.out.println("만원 -> " + m_10000);
		System.out.println("오천원 -> " + m_5000);
		System.out.println("천원 -> " + m_1000);
		System.out.println("오백원 -> " + m_500);
		System.out.println("백원 -> " + m_100);
		System.out.println("오십원 -> " + m_50);
	}
}
