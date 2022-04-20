package prac1;
import java.util.Scanner;

//배열의 length 필드를 이용하여 배열 크기만큼 정수를 입력받고 평균을 출력 
public class ArrayLength {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int intArray[] = new int[5]; //배열 수만큼 정수 입력 
		
		double sum = 0.0;
		for (int i = 0; i < intArray.length; i++) {
			intArray[i] = sc.nextInt();
		}
		
		for(int i = 0; i < intArray.length; i++) {
			sum += intArray[i];
		}
		
		System.out.print("평균은" + sum/intArray.length); //평균 출력 
		sc.close();
	}
}
