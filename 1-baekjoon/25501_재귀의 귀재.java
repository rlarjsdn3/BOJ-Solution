import java.util.*;

public class main{
    static int count = 1;

    public static int recursion(String s, int l, int r){
        if(l >= r) return 1;
        else if(s.charAt(l) != s.charAt(r)) return 0;
        else {
            count += 1;
            return recursion(s, l+1, r-1); 
        }
    }
    
    public static int isPalindrome(String s){
        return recursion(s, 0, s.length()-1);
    }
    
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        
        int n = sc.nextInt();
        String[] s = new String[n];
        for(int i=0; i<n; i++) {
            s[i] = sc.next();
        }

        for(int i=0; i<n; i++) {
            System.out.println(isPalindrome(s[i]) + " " + count);
            count = 1;
        }
    }
}
