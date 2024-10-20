package Ex2;

class Teste_Candidato {
    private String nome;
    private int numero;
    private int votos;

    public Teste_Candidato(int num, String name) {
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
        Teste_Candidato c = new Teste_Candidato(55, "Pedro");
        c.incrementVotos();
        c.exibir();
    }
}
