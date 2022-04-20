package n_bit_circular_shift;
import java.util.Scanner;

//n-bit 만큼 입력된 숫자를 왼쪽으로 이동시켜주는 프로그램 

public interface bitshift {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("정수형 데이터를 입력하시오: ");
		int num = sc.nextInt();
		System.out.println(Integer.toBinaryString(num));
		
		System.out.print("bit 수를 입력하시오: ");
		int n = sc.nextInt();
		int check = 0x80000000;
		
		for(int i = 0; i < n; i++) {
			if((num&check) == 0) {
				num = num << 1;
			} else {
				num = num << 1;
				num += 1;
			}
		}
		System.out.print(Integer.toBinaryString(num));
	}
}

