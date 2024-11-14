import java.text.NumberFormat;

class Main {
    public static void main(String argv[]) {
        String fx;
        NumberFormat nf = NumberFormat.getNumberInstance();
        nf.setMaximumFractionDigits(9);
        nf.setMinimumIntegerDigits(1);
        double r = 0;
        int[] vetor5 = criaVetor(100000);
        int[] vetor6 = new int[100000];
        // copia os elementos do vetor 5 para o outro vetor.
        for (int i = 0; i < vetor5.length; i++) {
            vetor6[i] = vetor5[i];
        }
        long t10 = System.nanoTime();
        ordenacao_bubbleSort(vetor5);
        long t11 = System.nanoTime();
        r = ((double) (t11 - t10)) / 1000000000;
        fx = nf.format(r);
        System.out.println("Tempo decorrido Bubble Sort: 100000 elementos " + fx + " segundos");

        long t12 = System.nanoTime();
        ordenacao_Selection_Sort(vetor6);
        long t13 = System.nanoTime();
        r = ((double) (t13 - t12)) / 1000000000;
        fx = nf.format(r);
        System.out.println("Tempo decorrido Selection Sort: 100000 elementos" + fx + " segundos");
    }

    public static int[] criaVetor(int tamanho) {
        int[] v = new int[tamanho];
        for (int i = 0; i < tamanho; i++) {
            v[i] = (int) (100 * Math.random() + 1);
        }
        return v;
    }

    public static void testBubbleSort(String argv[]) {
        int[] vetor1 = new int[] { 77, 99, 44, 55, 22, 88, 11, 27, 66, 33 };
        System.out.println("Antes da ordenação: ");
        for (int i = 0; i < vetor1.length; i++)
            System.out.print(" " + vetor1[i]);
        System.out.println();
        ordenacao_bubbleSort(vetor1);
        System.out.println("Depois da ordenação: ");
        for (int i = 0; i < vetor1.length; i++)
            System.out.print(" " + vetor1[i]);
    }

    public static void testSelectionSort(String argv[]) {
        int[] vetor1 = new int[] { 77, 99, 44, 55, 22, 88, 11, 27, 66, 33 };
        System.out.println("Antes da ordenação: ");
        for (int i = 0; i < vetor1.length; i++)
            System.out.print(" " + vetor1[i]);
        System.out.println();
        ordenacao_Selection_Sort(vetor1);
        System.out.println("Depois da ordenação: ");
        for (int i = 0; i < vetor1.length; i++)
            System.out.print(" " + vetor1[i]);
    }

    public static void ordenacao_bubbleSort(int[] vetor) {
        int out, in;
        int nElems = vetor.length;
        int temp = 0;
        for (out = nElems - 1; out > 0; out--) // loop externo (trás para frente)
            for (in = 0; in < out; in++) // loop interno (em frente)
                if (vetor[in] > vetor[in + 1]) { // fora de ordem?
                    temp = vetor[in];
                    vetor[in] = vetor[in + 1];
                    vetor[in + 1] = temp;
                }
    } // fim bubbleSort()

    public static void ordenacao_Selection_Sort(int[] vetor) {
        int out, in, min, temp;
        int nElems = vetor.length;
        for (out = 0; out < nElems - 1; out++) { // loop externo
            min = out; // minimum
            for (in = out + 1; in < nElems; in++) // loop interno
                if (vetor[in] < vetor[min]) // se min é maior,

                    min = in; // temos um novo mínimo
            // Coloca o novo mínimo no seu lugar correto no vetor
            temp = vetor[out];
            vetor[out] = vetor[min];
            vetor[min] = temp;
        } // fim do laço externo
    } // fim do selectionSort()
}
