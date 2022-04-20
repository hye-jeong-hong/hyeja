package prac9;
import java.util.Scanner;
import java.util.Vector;

// 정수만 다루는 Vector<Integer> 제네릭 백터를 생성하고 활용하는 사례 
public class VectorEx {

	public static void main(String[] args) {
		Vector<Integer> v = new Vector<Integer>();
		v.add(5);
		v.add(4);
		v.add(-1);
		
		v.add(2, 100);
		System.out.println("백터 내의 요소 객체 수: " + v.size());
		System.out.println("백터의 현재 용량: " + v.capacity());
		
		for(int i = 0; i < v.size(); i++) {
			int n = v.get(i);
			System.out.println(n);
		}
		int sum = 0;
		for(int i = 0; i < v.size(); i++) {
			int n = v.elementAt(i);
			sum += n;
		}
		System.out.println("벡터에 있는 정수의 합: " + sum);
	}
	
}
