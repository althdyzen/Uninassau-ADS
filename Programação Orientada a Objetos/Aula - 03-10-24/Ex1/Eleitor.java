package Ex1;

class Candidato {
    private int numero;
    private String nome;
    private int votos;

    public Candidato(String name, int number) {
        this.numero = number;
        this.nome = name;
        this.votos = 0;
    }

    public int getNumero() {
        return this.numero;
    }

    public String getNome() {
        return this.nome;
    }

    public int getVotos() {
        return this.votos;
    }

    public void addVote() {
        this.votos++;
    }

    public void getInfo() {
        System.out.println("Nome: " + this.nome);
        System.out.println("Número: " + this.numero);
        System.out.println("Votos: " + this.votos);
    }

}

public class Eleitor {
    public static void main(String[] args) {
        Candidato cand = new Candidato("Marquinhos", 69);

        cand.getInfo();
        // System.out.println();
    }
}
