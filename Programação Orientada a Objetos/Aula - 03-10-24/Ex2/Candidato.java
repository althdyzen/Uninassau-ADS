package Ex2;

class Candidato {
    private String nome;
    private int numero;
    private int votos;

    public Candidato(int num, String name) {
        numero = num;
        nome = name;
        votos = 0;
    }

    public void exibir() {
        System.out.println();
        System.out.println("Candidato com nome: " + nome);
        System.out.println("Número: " + numero);
        System.out.println("Votos: " + votos);
        System.out.println();
    }

    public void incrementVotos() {
        votos++;
    }

    public static void main(String[] args) {
        Candidato c = new Candidato(55, "Pedro");
        c.incrementVotos();
        c.exibir();
    }
}
