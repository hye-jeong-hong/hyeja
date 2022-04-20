package clac_time;
import java.util.Scanner;

public class time2 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		Time first_time = new Time(0, 10, 10, 10);
		
		int hour = sc.nextInt();
		int min = sc.nextInt();
		int sec = sc.nextInt();
		
		Time second_time = new Time(0, hour, min, sec);
		Time add_time = first_time.add(second_time);
		Time sub_time = first_time.sub(second_time);
		
		System.out.println("두 시간의 합은");
		add_time.print();
		
		System.out.println("두 시간의 차는");
		sub_time.print();
		
		String result = first_time.compare(second_time);
		System.out.println(result);
	}
}

class Time {
	//필드 선언 
	private int day;
	private int hour;
	private int min;
	private int sec;

	//초기화(생성자) 메소드 정의 
	public Time(int day, int hour, int min, int sec) {
		this.day = day;
		this.hour = hour;
		this.min = min;
		this.sec = sec;
	}
	
	// add 메소드 정의 
	public Time add(Time time) {
		
		int add_sec = (this.hour*3600+this.min*60+this.sec)
				+ (time.hour*3600+time.min*60+time.sec); //초로 변환해서 add
		
		int hour = add_sec/3600;
		add_sec %= 3600;
		int min = add_sec/60;
		int sec = add_sec%60;
		
		if(sec >= 60) {
			min++;
			sec -= 60;
		} 
		if(min >= 60) {
			hour++;
			min -= 60;
		}
		if(hour >= 24) {
			day ++;
			hour -= 24;
		}
		
		return new Time(day, hour, min, sec);
	}
	// sub 메소드 정의 
	public Time sub(Time time) {
		int sub_sec = (this.hour*3600+this.min*60+this.sec)
				- (time.hour*3600+time.min*60+time.sec); //초로 변환해서 sub
		
		
		
		sub_sec = Math.abs(sub_sec); //절대값 반환 
		
		int hour = sub_sec/3600;
		sub_sec %= 3600;
		int min = sub_sec/60;
		int sec = sub_sec%60;
		
		
		if(sec < 0) {
			min--;
			sec += 60;
		} 
		if(min < 60) {
			hour--;
			min += 60;
		}
		if(hour < 0) {
			day --;
			hour += 24;
		}
		
		return new Time(day, hour, min, sec);
	}
	
	public String compare(Time time) {
		
		int time_1 = this.hour*3600+this.min*60+this.sec;
		int time_2 = time.hour*3600+time.min*60+time.sec;
		
		if(time_1>time_2) {
			return "뒤에 시간이 더 느립니다.";
		} else if (time_1 == time_2) {
			return "두 시간은 같습니다.";
		} else {
			return "앞에 시간이 더 느립니다.";
		}
	}
	
	public void print() {
		
		if(this.day == 1) System.out.print("전");
		else if(this.day == 0) System.out.print("당");
		else System.out.print("후");
		
		System.out.println("일 " + hour + "시 " + min + "분 " + sec + "초 입니다");
	}
	
}


