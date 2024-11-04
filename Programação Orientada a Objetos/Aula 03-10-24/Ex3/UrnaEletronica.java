package Ex3;

import java.util.InputMismatchException;
import java.util.Scanner;

class UrnaEletronica {
    private static Scanner scanner = new Scanner(System.in);

    public static int getValidNumber(String mensagem) {
        int numero = 0;
        boolean numeroValido = false;

        while (!numeroValido) {
            System.out.println(mensagem);

            try {
                numero = scanner.nextInt();

                numeroValido = true;
            } catch (InputMismatchException e) {
                System.err.println("Entrada inválida. Por favor, insira um número inteiro maior que 0.");

                scanner.next();
            }
        }

        return numero;
    }

    public static void main(String[] args) {
        int quantidadeCandidatos = getValidNumber("Quantos candidatos deseja cadastrar?");

        Candidato[] candidatos = new Candidato[quantidadeCandidatos];

        for (int i = 0; i < quantidadeCandidatos; i++) {
            System.out.println("Cadastramento número: " + (i + 1));
            System.out.println("Digite o número do candidato: ");
            int numero = scanner.nextInt();
            scanner.nextLine();
            System.out.println("Digite o nome do candidato: ");
            String nome = scanner.nextLine();

            candidatos[i] = new Candidato(numero, nome);
        }

        System.out.println("\nQuantos votos serão lidos? ");
        int quantidadeVotos = scanner.nextInt();

        for (int i = 0; i < quantidadeVotos; i++) {
            System.out.println("Digite o número do candidato para votar: ");
            int numeroVoto = scanner.nextInt();
            boolean candidatoEncontrado = false;

            for (Candidato candidato : candidatos) {
                if (candidato.getNumero() == numeroVoto) {
                    candidato.incrementarVoto();
                    candidatoEncontrado = true;
                    break;
                }
            }

            if (!candidatoEncontrado) {
                i--;
                System.out.println("Candidato não encontrado: " + numeroVoto);
            }
        }

        System.out.println("\nResultado da votação:");
        for (Candidato candidato : candidatos) {
            candidato.exibir();
        }

        scanner.close();
    }
}

class Candidato {
    private int numero;
    private String nome;
    private int votos;

    public Candidato(int numero, String nome) {
        this.numero = numero;
        this.nome = nome;
        this.votos = 0;
    }

    public int getNumero() {
        return numero;
    }

    public String getNome() {
        return nome;
    }

    public int getVotos() {
        return votos;
    }

    public void incrementarVoto() {
        this.votos++;
    }

    public void exibir() {
        System.out.println("Nome: " + nome);
        System.out.println("Numero: " + numero);
        System.out.println("Quantidade de votos: " + votos);
        System.out.println("--------------------------------");
    }
}
