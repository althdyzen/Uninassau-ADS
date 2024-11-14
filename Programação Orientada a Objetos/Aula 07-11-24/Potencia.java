public class Potencia {
    public static void main(String[] args) {
        System.out.println(rec(2, 3));
    }

    public static int rec(int base, int potencia) {
        if (potencia == 0) {
            return 1;
        }

        return base * rec(base, potencia - 1);
    }
}
