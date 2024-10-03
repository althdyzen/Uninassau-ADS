package Ex3;

import java.util.Scanner;

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

    @Override
    public String toString() {
        return numero + " - " + nome + " - " + votos;
    }
}

public class UrnaEletronica {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Cadastramento de candidatos
        System.out.print("Quantos candidatos deseja cadastrar? ");
        int quantidadeCandidatos = scanner.nextInt();
        scanner.nextLine(); // Consumir a nova linha

        Candidato[] candidatos = new Candidato[quantidadeCandidatos];

        for (int i = 0; i < quantidadeCandidatos; i++) {
            System.out.println("Cadastramento número: " + (i + 1));
            System.out.print("Digite o número do candidato: ");
            int numero = scanner.nextInt();
            scanner.nextLine(); // Consumir a nova linha
            System.out.print("Digite o nome do candidato: ");
            String nome = scanner.nextLine();
            System.out.println("");

            candidatos[i] = new Candidato(numero, nome);
        }

        // Leitura dos votos
        System.out.print("Quantos votos serão lidos? ");
        int quantidadeVotos = scanner.nextInt();

        for (int i = 0; i < quantidadeVotos; i++) {
            System.out.print("Digite o número do candidato para votar: ");
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

        // Listagem dos candidatos e seus votos
        System.out.println("\nResultado da votação:");
        for (Candidato candidato : candidatos) {
            System.out.println(candidato);
        }

        scanner.close();
    }
}
