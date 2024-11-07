
public class Aluno_Teste1 {
    public static void main(String[] args) {
        Aluno aluno1 = new Aluno();
        aluno1.nome = "Caio";
        aluno1.semestre = 2;
        aluno1.sala = 103;
        aluno1.curso = "ADS";

        for (int i = 0; i < aluno1.notas.length; i++) {
            aluno1.notas[i] = Math.random() * 10;

        }

        System.out.println("Nome:" + aluno1.nome);
        System.out.println("Semestre" + aluno1.semestre);
        System.out.println("Sala" + aluno1.sala);
        System.out.println("Curso" + aluno1.curso);
        System.out.println("Notas" + aluno1.notas[0]);
    }
}
