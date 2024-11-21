import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Integer> list = new ArrayList<>();

        System.out.println("Quantos salarios você quer adicionar?");
        int qt = scanner.nextInt();
        System.out.println("Criando lista de salarios.");
        for (int i = 0; i < qt; i++) {
            System.out.println("Digite um salario:");

            list.add(scanner.nextInt());
        }

        for (int i = 0; i < qt; i++) {
            String msg = String.format("Salario %s: %d", i + 1, list.get(i));
            System.out.println(msg);

        }

        scanner.close();
    }
}
