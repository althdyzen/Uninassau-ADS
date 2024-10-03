package Ex2;

class Candidato {
    String name;
    int number;
    int votos = 53;

    public Candidato(String nome, int numero) {
        this.name = nome;
        this.number = numero;
    }

    public void addVote() {
        this.votos++;
    }

    public void exibir() {
        System.out.println("O candidato com nome: " + this.name + ", que você criou tem " + this.votos + " votos");
        System.out.println("Você acabou de votar nele");
        System.out.println("Número anterior de votos: " + this.votos);

        addVote();
        System.out.println("Número atual de votos: " + this.votos);
    }

    public static void main(String[] args) {
        Candidato c = new Candidato("Carlos", 55);
        c.exibir();
    }
}
