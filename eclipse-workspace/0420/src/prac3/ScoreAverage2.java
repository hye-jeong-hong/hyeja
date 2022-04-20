package prac3;
import java.util.Scanner;

public class ScoreAverage2 {

	public static void main(String[] args) {
		
		double score[][] = {
				{0.0, 0.0, 0.0},
				{0.0, 0.0, 0.0},
				{0.0, 0.0, 0.0},
				{0.0, 0.0, 0.0},
				{0.0, 0.0, 0.0}
		};
		
		Scanner sc = new Scanner(System.in);
		double sum = 0.0;
		double total = 0.0;
		System.out.println("점수를 입력하시오 ");
		
		for(int i = 0; i < 4; i++) {
			for(int j = 1; j < 3; j++) {
				System.out.print(i+1 + "학년 " + j + "학기 >> ");
				score[i][j-1] = sc.nextDouble();
			}
		}
		
		for(int i = 0; i < 4; i++) {
			score[i][2] = (score[i][0] + score[i][1])/2;
		}
		
		for(int i = 0; i < 5; i++) {
			score[4][0] = score[i][0]/4;
		}
	
		
		for(int i = 0; i < 5; i++) {
			score[4][1] = score[i][1]/4;
		}
		
		
		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 2; j++) {
				
				score[i][2] = (score[i][0]+score[i][1])/2; //각 학년 평균 
				
				sum = (score[0][0] + score[1][0]+score[2][0]+score[3][0]); //1학기 평균 
				score[4][0] = sum/4.0; 
				sum = 0;
				
				sum = (score[0][1] + score[1][1]+score[2][1]+score[3][1]);
				score[4][1] = (sum)/4; //2학기 평균 
				sum = 0;
				
				
			}
		}
		
		for (int year = 0; year < 3; year++) {
			for (int term = 0; term < 2; term++) {
				total += score[year][term];
			}
		}
		
		score[4][2] = (total)/8.0; //전체 평균 
		
		System.out.print("1학기   2학기   평균\n");
		for (int year = 0; year < score.length; year++) {
			for (int term = 0; term < score[year].length; term++) {
				
				System.out.print(score[year][term] +  "    ");
				
			}
			System.out.println();
		}
		
		
	}
}
