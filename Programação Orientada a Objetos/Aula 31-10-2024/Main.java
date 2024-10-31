import java.util.Scanner;

public class Main {
    /**
     * This Java program takes input for 5 numbers, determines if each number is
     * even or odd, finds the
     * smallest value, calculates the average, and displays the results.
     */
    public static void main(String[] args) {
        int[] numbers = preencherArray(new int[5]);
        int menorValor = encontrarMenorValor(numbers);
        int media = encontrarMedia(numbers);

        separador();

        exibirArray(numbers);

        separador();

        System.out.println("Menor valor é " + menorValor);

        separador();

        System.out.println("Media é " + media);

        separador();

    }

    public static void exibirArray(int[] array) {
        for (int i = 0; i < array.length; i++) {
            int ind = i + 1;

            if (array[i] % 2 == 0) {
                System.out.println("Item " + ind + " é par: " + array[i]);
            } else {
                System.out.println("Item " + ind + " é impar: " + array[i]);
            }
        }
    }

    public static void separador() {
        System.out.println("------------------");
    }

    public static int[] preencherArray(int[] array) {
        Scanner s = new Scanner(System.in);

        for (int i = 0; i < array.length; i++) {
            System.out.printf("Digite o valor para o item " + (i + 1) + ": ");
            array[i] = s.nextInt();
        }

        s.close();

        return array;

    }

    public static int encontrarMenorValor(int[] array) {
        int menor = array[0];

        for (int i = 1; i < array.length; i++) {
            if (array[i] < menor) {
                menor = array[i];
            }
        }

        return menor;
    }

    public static int encontrarMedia(int[] array) {
        int soma = 0;
        int media = 0;

        for (int i = 0; i < array.length; i++) {
            soma += array[i];
        }

        media = soma / array.length;

        return media;
    }
}
