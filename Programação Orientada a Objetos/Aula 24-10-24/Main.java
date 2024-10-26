import java.util.Scanner;

class Main {
    public static void main(String[] args) {
        double notas[] = new double[5];
        Scanner s = new Scanner(System.in);

        for (int i = 0; i < notas.length; i++) {
            System.out.println("Digite a nota: ");

            try {
                notas[i] = s.nextDouble();
            } catch (java.util.InputMismatchException e) {
                i--;
                System.out.println("A nota precisa ser um número!");
                s.next();
            }
        }

        System.out.println("Notas > 7.5");
        for (double nota : notas) {
            if (nota > 7.5) {
                System.out.println(nota);
            }
        }
    }
}

class Aluno {
    double nota;

    public Aluno(double n) {
        this.nota = n;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

}
