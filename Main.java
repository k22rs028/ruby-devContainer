public class Main {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        int a = 5;
        String s = "Ruby";
        double d = 3.14;
        System.out.println(a);
        System.out.println(s);
        System.out.println(d);

        System.out.println("a:" + a);
        System.out.println("s:" + s);
        System.out.println("d:" + d);
        System.out.println(s.length());
        System.out.println(((Double)d).toString().length());

        

        if(a > 5){
            System.out.println("Large");
        }else{
            System.out.println("Little");
        }
        for(int  i = 0; i < 5; i++){
            System.out.print("*");
        }
    }
}