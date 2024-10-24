class Main {
    // 1 - Metodo
    public static void main(String[] args) {

        Aluno[] notas = new Aluno[20];

        for (int i = 0; i < notas.length; i++) {
            notas[i] = new Aluno(Math.random() * 10);

            if (notas[i].getNota() > 7.5) {
                System.out.printf("Nota: %.1f%n", notas[i].getNota());
            }
        }
    }

    // 2 - Metodo
    // public static void main(String[] args) {

    // double[] notas = new double[20];

    // for (int i = 0; i < notas.length; i++) {
    // notas[i] = Math.random() * 10;
    // // System.out.println(notas[i]);

    // if (notas[i] > 7.5) {
    // System.out.printf("Nota: %.1f%n", notas[i]);
    // }
    // }
    // }

    // 3 - Metodo
    // public static void main(String[] args) {
    // double[] notas = { 9.2, 7.5, 2.7, 5.5, 8.8, 1.9, 4.4, 8.2, 5.6, 3.9, 8.0,
    // 4.3, 6.1, 4.5, 3.3, 7.1, 4.4, 6.7,
    // 5.8, 6.5 };

    // for (double nota : notas) {
    // if (nota > 7.5) {
    // System.out.println(notas[i]);
    // }
    // }
    // }
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
