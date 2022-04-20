package prac8;
import java.util.Scanner;

//추상클래서 Calculator를 상속받는 GoodCalc클래스를 구현하라 
public class GoodCalc extends Caculator{

	public int add(int a, int b) {
		return a + b;
	}
	public int subtract(int a, int b) {
		return a - b;
	}
	public double average(int[] a) {
		double sum = 0;
		for(int i = 0; i < a.length; i++) {
			sum += a[i];
		}
		return sum/a.length;
	}
	
	public static void main(String[] args) {
		GoodCalc c = new GoodCalc();
		System.out.println(c.add(2, 3));
		System.out.println(c.subtract(2, 3));
		System.out.println(c.average(new int[] {2,3,4}));
	}
}

abstract class Caculator {
	public abstract int add(int a, int b);
	public abstract int subtract(int a, int b);
	public abstract double average(int[] a); 
}