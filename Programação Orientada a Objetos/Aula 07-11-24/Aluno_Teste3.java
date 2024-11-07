import java.util.Scanner;

public class Aluno_Teste3 {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        Aluno[] aluno1;
        int leia;

        System.out.println("Quantos alunos deseja ler?:");
        leia = s.nextInt();
        aluno1 = new Aluno[leia];

        for (int i = 0; i < leia; i++) {
            aluno1[i] = new Aluno();
            System.out.println("Nome: ");
            aluno1[i].nome = s.nextLine();
            System.out.println("Semestre: ");
            aluno1[i].semestre = s.nextInt();
            System.out.println("Sala: ");
            aluno1[i].sala = s.nextInt();
            System.out.println("Curso: ");
            aluno1[i].curso = s.nextLine();
            System.out.println("Rua: ");
            aluno1[i].endereco.rua = s.nextLine();
            System.out.println("Cidade: ");
            aluno1[i].endereco.cidade = s.nextLine();
            System.out.println("Estado: ");
            aluno1[i].endereco.estado = s.nextLine();
            System.out.println("Bairro: ");
            aluno1[i].endereco.bairro = s.nextLine();
            System.out.println("CEP: ");
            aluno1[i].endereco.cep = s.nextLine();
            // String formattedNotas = "";

            for (int in = 0; in < aluno1[i].notas.length; in++) {
                System.out.println("Nota [" + (in + 1) + "]: ");
                aluno1[i].notas[in] = s.nextInt();
                // formattedNotas += String.format("%.2f", aluno1[i].notas[i]) + " | ";
            }
        }

        for (int i = 0; i < aluno1.length; i++) {
            System.out.println("Nome: " + aluno1[i].nome);
            System.out.println("Semestre: " + aluno1[i].semestre);
            System.out.println("Sala: " + aluno1[i].sala);
            System.out.println("Curso: " + aluno1[i].curso);
            System.out.println("Notas: " + aluno1[i].toString());
            System.out.println("Rua: " + aluno1[i].endereco.rua);
            System.out.println("Cidade: " + aluno1[i].endereco.cidade);
            System.out.println("Estado: " + aluno1[i].endereco.estado);
            System.out.println("Bairro: " + aluno1[i].endereco.bairro);
            System.out.println("CEP: " + aluno1[i].endereco.cep);
        }

        s.close();
    }
}
