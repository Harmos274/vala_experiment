class Demo.HelloWorld : GLib.Object {

    public static int main(string[] args) {

        stdout.printf("Hello World\n");
        stdout.printf("%s\n", args[1]);

        return (0);
    }
}