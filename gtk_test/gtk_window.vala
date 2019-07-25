class Demo.WindowMaker : GLib.Object {

    public static int main(string[] args) {

        Gtk.init(ref args);

        var header = new Gtk.HeaderBar();
        header.set_show_close_button(true);

        var window = new Gtk.Window();

        window.destroy.connect(Gtk.main_quit);
        window.set_titlebar(header);
        window.set_default_size(350, 700);
        window.border_width = 10;

        window.add(new Gtk.Button.with_label("Hello World."));
        window.show_all();

        Gtk.main();
        return (0);
    }   
}
