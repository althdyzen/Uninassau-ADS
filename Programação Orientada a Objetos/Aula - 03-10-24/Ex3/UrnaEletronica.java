package Ex3;

import java.util.Scanner;

class UrnaEletronica {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int quantidadeCandidatos = 0;

        while (quantidadeCandidatos <= 0) {
            System.out.println("Quantos candidatos deseja cadastrar? ");

            if (scanner.hasNextInt()) {
                quantidadeCandidatos = scanner.nextInt();

                if (quantidadeCandidatos <= 0) {
                    System.out.println("Por favor, insira um número maior que 0.");
                }
            } else {
                System.out.println("Entrada inválida. Por favor, insira um número inteiro.");
                scanner.next();
            }
        }

        scanner.nextLine();

        Candidato[] candidatos = new Candidato[quantidadeCandidatos];

        for (int i = 0; i < quantidadeCandidatos; i++) {
            System.out.println();
            System.out.println("Cadastramento número: " + (i + 1));
            System.out.println("Digite o número do candidato: ");
            int numero = scanner.nextInt();
            scanner.nextLine();
            System.out.println("Digite o nome do candidato: ");
            String nome = scanner.nextLine();
            System.out.println();

            candidatos[i] = new Candidato(numero, nome);
        }

        System.out.println("Quantos votos serão lidos? ");
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
