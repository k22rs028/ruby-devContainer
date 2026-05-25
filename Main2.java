public class Main2 {
    public static void main(String[] args) {

        int [] ia = {1,3,5};
        String [] sa = new String[3];
        sa[0] = "Java";
        sa[1] = "Python";
        sa[2] = "C#";

        for(int i = 0; i < ia.length; i++){
            System.out.print(ia[i] + ",");
        }
        System.out.println();
        
        for(int i : ia){
            System.out.print(i + ",");
        }

        String xx = 5 > 3 ? "five" : "three";
        System.out.println(xx);

    }
    static int max(int x, int y){
        if(x > y){
            return x;
        }else{
            return y;
        }
    }
    
}
