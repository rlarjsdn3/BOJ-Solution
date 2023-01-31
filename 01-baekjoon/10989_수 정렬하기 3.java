import java.util.*;
import java.io.*;

public class main {
    public static void main(String[] args) {
        BufferedReader br = new BufferedReader(
                                    new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(
                                    new OutputStreamWriter(System.out));

        try {
            int[] counting = new int[10001];
            int n = Integer.parseInt(br.readLine());
            for(int i=0; i<n; i++) {
                counting[Integer.parseInt(br.readLine())] += 1;
            }

            for(int i=0; i<counting.length; i++) {
                if(counting[i] != 0) {
                    while(counting[i]-- > 0) {
                        bw.write(i + "\n");
                    }
                }
            }
            bw.flush();
            br.close();
            bw.close();
        } catch(IOException ie) { 
            ie.printStackTrace();
        }
    }
}
