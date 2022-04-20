package exam;

import java.util.Scanner;

/**
 * 2022, 04. 18 (월)
 * 방아현
 */
public class test {

    public static void main(String[] args) {

        ListStack<Object> listStack = new ListStack<>(); 
        Scanner scanner = new Scanner(System.in);
        String input;

        System.out.println("1에서 5사이의 값을 입력해주세요.");
        System.out.println("1: insert, 2: delete, 3: output, 4: invert, 5:exit");
        while (!(input = scanner.nextLine()).equals("5")) {
            switch (input) {
                case "1" -> listStack.add(scanner.nextLine());
                case "2" -> listStack.delete();
                case "3" -> listStack.print();
                case "4" -> listStack.invert();
                default -> System.out.println("옳지 않은 번호입니다.");
            }
            System.out.println("1에서 5사이의 값을 입력해주세요.");
            System.out.println("1: insert, 2: delete, 3: output, 4: invert, 5:exit");
        }
    }
}

class ListStack <T> { //배열

    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_RESET = "\u001B[0m";

    private class Node <T> { //Node 내부클래스 
        private T item; //item은 어떤게 들어올지 모르니까 T 제네릭클래스
        private ListStack<T>.Node<T> next;

        public Node(T item) { //노드 한칸
            this.item = item;
            this.next = null; //처음 생성할때는 next값이 뭔지모르기때문에 null
        }
    }

    private Node<T> head; //맨 처음 노드를 가리키기 위한 애, 어떤 타입인지 모르기때문에 제네릭타입

    public ListStack() {
        this.head = null; //기본 초기 세팅
    }

    public void add(T t) { //이때부터 head가 가리키기 시작함, 어떤타입 들어올지 모르기때문에 제네릭타입
        Node<T> node = new Node<>(t); //노드를 가리키기 때문에 노드객체 생성
        if (this.head != null) { //이미 뭔가를 가리키는 상태라면
            node.next = this.head;
        }
        this.head = node;
    }

    public void delete() {
        Node<T> node = this.head; //this.head는 지금 가리키는 애 
        if (node == null) {
            System.out.println("삭제할 대상이 없습니다.");
        } else { //값이 있을 경우
            this.head = node.next;
            System.out.println("삭제되었습니다.");
        }
    }

    public void print() { 
        Node<T> node = this.head;
        if (node != null) {
            while (node.next != null) {
                System.out.print(node.item);
                node = node.next;
            }
            System.out.println(node.item);
        } else {
            System.out.println("ListStack이 비어있습니다.");
        }
    }

    public ListStack invert() {
        Node<T> now = this.head; /초기
        Node<T> prev = null; //초기
        if (now != null) {
            while (now != null) { //list를 한 번씩 다 돌린다
                Node<T> tmp = now.next;
                now.next = prev;
                prev = now;
                now = tmp;
            }
            this.head = prev;
            System.out.println("invert하였습니다.");
            return this;
        } else { //reverst할게 없을때 
            System.out.println("ListStack이 비어있습니다.");
            return null;
        }
    }
}
