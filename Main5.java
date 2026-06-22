public class Main5 {
    public static void main(String[] args) {
        String host = "www.is.kyusan-u.ac.jp";
        String path = "/~toshi/";
        String cmd = String.format("GET %s HTTP/1.1\r\nHost: %s\r\n\r\n", path, host);
        System.out.println(cmd);
    }
    
}
