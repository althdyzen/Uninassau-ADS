import java.util.Scanner;

public class Alt {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);

        int[][] matriz = preencherMatriz(new int[2][4]);

        System.out.println();

        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[i].length; j++) {
                System.out.println("Item [" + i + "][" + j + "]" + " : " +
                        matriz[i][j]);
            }
        }

        s.close();

    }

    public static int[][] preencherMatriz(int[][] matriz) {
        Scanner s = new Scanner(System.in);

        for (int i = 0; i < matriz.length; i++) {
            for (int j = 0; j < matriz[i].length; j++) {
                System.out.printf("Digite um valor para o item [" + i + "][" + j + "]" + " : ");
                matriz[i][j] = s.nextInt();
            }
        }

        s.close();

        return matriz;

    }

    // public static void main(String[] args) {
    // int somaPrColuna = 0;
    // int somaPrLinha = 0;
    // int somaDiag = 0;
    // int somaTotal = 0;

    // int[][] matriz = {
    // { 3, 6, 9 },
    // { 2, 4, 6 },
    // { 1, 2, 3 }
    // };

    // for (int i = 0; i < matriz.length; i++) {
    // for (int j = 0; j < matriz[i].length; j++) {
    // System.out.println("Item [" + i + "]" + "[" + j + "]" + " : " +
    // matriz[i][j]);
    // }
    // }

    // System.out.println();

    // for (int i = 0; i < matriz.length; i++) {
    // for (int j = 0; j < matriz[i].length; j++) {
    // somaTotal += matriz[i][j];

    // if (j == 0) {
    // somaPrColuna += matriz[i][j];
    // }

    // if (i == 0) {
    // somaPrLinha += matriz[i][j];
    // }

    // if (i == j) {
    // somaDiag += matriz[i][j];
    // }
    // }
    // }

    // System.out.println("Soma primeira coluna: " + somaPrColuna);
    // System.out.println("Soma primeira linha: " + somaPrLinha);
    // System.out.println("Soma diagonal: " + somaDiag);
    // System.out.println("Soma total: " + somaTotal);

    // }
}
