import java.util.Scanner;

public class Main {
    static int media;
    static int menorValor;

    public static void main(String[] args) {
        int[] numbers = preencherArray(new int[5]);
        menorValor = encontrarMenorValor(numbers);
        media = encontrarMedia(numbers);

        separador();

        exibirArray(numbers);

        separador();

        exibirMenorValor(menorValor);

        separador();

        exibirMedia();

        separador();

    }

    public static void exibirMedia() {
        System.out.println("Media é " + media);
    }

    public static void exibirMenorValor(int n) {
        System.out.println("Menor valor é " + n);
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

        for (int i = 0; i < array.length; i++) {
            soma += array[i];
        }


        return soma / array.length;
    }
}
