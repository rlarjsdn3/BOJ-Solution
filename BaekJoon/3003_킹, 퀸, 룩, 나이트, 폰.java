import java.util.*;

public class main {
    public static void main(String[] args) {
        int[] chessPieces = new int[]{ 1, 1, 2, 2, 2, 8 };
        String[] myChessPieces = new Scanner(System.in).nextLine().split(" ");
        for(int i=0; i<chessPieces.length; i++) {
            System.out.print(chessPieces[i] 
                            - Integer.parseInt(myChessPieces[i]) + " ");
        }
    }
}
