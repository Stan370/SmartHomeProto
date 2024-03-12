import java.util.ArrayList;
import java.util.List;

public class Solution {
    public int fabo(int n){
        if(n<=2)return 1;
        else return fabo(n-1)+fabo(n-2);
    }
    public List<Integer> main1(int n){
        List<Integer> res = new ArrayList<Integer>();
        for(int i=0;i<n;i++){
            res.add(fabo(i));
        }
        System.out.println(res);
        return res;
    }

    public static void main(String[] args) {
        Solution s = new Solution();
        s.main1(4);
    }
}
