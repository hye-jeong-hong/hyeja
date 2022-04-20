package n_bit_circular_shift_r;
import java.util.Scanner;

//n-bit 만큼 입력된 정수형 데이터를 오른쪽으로 이동시키는 프로그램 
public class bitshiftr {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int check = 0x80000000;
		System.out.print("정수형 데이터를 입력하시오: ");
		int num = sc.nextInt();
		System.out.println(Integer.toBinaryString(num));
		System.out.print("비트수를 입력하시오: ");
		int n = sc.nextInt();
		
		// 1안: 산술쉬프트( >> ) 사용하여 구현
		/*
		 >> 연산자는 비트값을 오른쪽으로 이동시킨 후에 왼쪽 빈 공간에 양수는 모두 0으로 
		 음수는 모두 1로 채운다. 
		 */
		System.out.println("\n산술쉬프트 사용");
		for(int i = 0; i<n; i++) {
			if(num >= 0) {
				if((num&1) == 0) { // 마지막 비트가 0일때 
					num = num >> 1;
				} else { // 마지막 비트가 1일때 
					num = num >> 1;
					num = num | check;
				}
			} else {
				if((num&1) == 1) { // 마지막 비트가 1일떄 
					num = num >> 1;
				} else { // 마지막 비트가 0일때 
					num = num >> 1;
					num = num & (~check);
				}
			}
		}
		
		System.out.println(Integer.toBinaryString(num));
		
	}
}
