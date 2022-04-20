package liststack1;
import java.util.Scanner;


public class ListStack {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		LinkedListStack<Integer> linkedList = new LinkedListStack<Integer>();

		//메뉴 만들어서 해당 메소드호출 
		while(true) {
			
			System.out.println("원하는 메뉴 번호를 입력하시오\n1.Insert 2.delete 3.output 4.invert 5.exit");
			
			int menu = sc.nextInt();
			
			if(menu == 1) {
				System.out.println("삽입할 data를 입력하시오");
				int data = sc.nextInt();
				linkedList.add(data);
				
			} else if(menu == 2) {
				linkedList.delete();
				
			} else if(menu == 3) {
				System.out.println("출력 결과 값");
				linkedList.output();
				
			} else if(menu == 4) {
				
				linkedList.invert();
				
			} else {
				System.exit(0); //시스템 종료 
			}
		}
		
	}
}

//제네릭으로 구현 
class LinkedListStack<T> {
	
	private Node head;
	
	int size = 0;
	
	//Node 내부클래스 
	class Node {
		private T data;
		private Node link;
		
		private Node(T data, Node link) {
			this.data = data;
			this.link = link;
		}
		
		public T getData() {
		     return this.data;
		}
		
	}
	
	//삽입  (add메소드) 
	public void add(T data) {
		
		final Node NewNode = new Node(data, null);
		NewNode.data = data;
		
		NewNode.link = head;
		
		head = NewNode;
		
		if(head == null) {
			head = head;
		}
		
		size ++;
	}

	public Node node(int index) {
		Node temp = head;
		
		for(int i = 0; i < index; i++) {
			temp = temp.link;
		}
		
		return temp;
	}

//삭제 (delete메소드) 
	 public void delete() {
	     Node pre;
	     Node temp;
	     
	     if(head == null) {
	    	 System.out.println("삭제할 데이터가 없습니다");
	         return;
	     }
	   
	     if(head.link == null) {
	         head = null;
	         
	     } else {
	        
	         pre = head;
	         temp = head.link;     
	
	         while(temp.link != null) {
	             pre = temp;
	             temp = temp.link;
	         }
	        
	         pre.link = null;
	     }
	 }
	
	
	
	//invert 메소드 
	public void invert() {
	     Node next = head;    
	     Node curr = null;
	     Node pre = null;
	     
	     while(next != null) {
	         pre = curr;    
	         curr = next;    
	         next = next.link;    
	         curr.link = pre;    
	     }
	     
	     head = curr;    
	 }
	
	
	//print 메소드 - 모든 노드의 내용 출력 
	 public void output() {
	     Node temp = this.head;    
	     
	     // temp가 null이 아닐 때까지 모든 노드의 내용 출력
	     while(temp != null) {
	         System.out.print(temp.getData() + " ");
	         temp = temp.link;    
	     }
	     
	     System.out.println();
	 }
}










