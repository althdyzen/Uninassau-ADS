
public class Aluno_Teste2 {
    public static void main(String[] args) {
        Aluno aluno1 = new Aluno();
        aluno1.nome = "Caio";
        aluno1.semestre = 2;
        aluno1.sala = 103;
        aluno1.curso = "ADS";
        aluno1.endereco.rua = "R. Hello World";
        aluno1.endereco.cidade = "Recife";
        aluno1.endereco.estado = "PE";
        aluno1.endereco.bairro = "Graças";
        aluno1.endereco.cep = "50761-421";
        String formattedNotas = "";

        for (int i = 0; i < aluno1.notas.length; i++) {
            aluno1.notas[i] = Math.random() * 10;
            formattedNotas += String.format("%.2f", aluno1.notas[i]) + " | ";
        }

        System.out.println("Nome: " + aluno1.nome);
        System.out.println("Semestre: " + aluno1.semestre);
        System.out.println("Sala: " + aluno1.sala);
        System.out.println("Curso: " + aluno1.curso);
        // System.out.println("Notas: " + Arrays.toString(aluno1.notas));
        System.out.println("Notas: " + formattedNotas);
        System.out.println("Rua: " + aluno1.endereco.rua);
        System.out.println("Cidade: " + aluno1.endereco.cidade);
        System.out.println("Estado: " + aluno1.endereco.estado);
        System.out.println("Bairro: " + aluno1.endereco.bairro);
        System.out.println("CEP: " + aluno1.endereco.cep);
    }
}
