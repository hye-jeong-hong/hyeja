package prac4;
import java.util.Scanner;

//반지름과 이름을 가진 Circle 클래스를 작성하고, Circle 클래스의 객체를 생성 

public class Circle {

	int radius;
	String name;
	
	public double getArea() {
		return 3.14*radius*radius;
	}
	
	public static void main(String[] args) {
		
		Circle pizza;
		pizza = new Circle();
		pizza.radius = 10;
		pizza.name = "자바피자";
		double area = pizza.getArea();
		System.out.println(pizza.name + "의 면적은 " + area);
		
		Circle dount = new Circle();
		dount.radius = 2;
		dount.name = "자바도넛";
		area = dount.getArea();
		System.out.println(dount.name + "의 면적은 " + area);
	}
}
