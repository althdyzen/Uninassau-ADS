package Ex1;

class Candidato {
    private String nome;
    private int numero;
    private int votos;

    public Candidato(int num, String name) {
        numero = num;
        nome = name;
        votos = 0;
    }

    public String getNome() {
        return nome;
    }

    public int getNumero() {
        return numero;
    }

    public int getVotos() {
        return votos;
    }

    public void incrementVotos() {
        votos++;
    }

}
