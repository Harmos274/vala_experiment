using Gtk;

class ValaTermEmu : Gtk.Window {

    //Vte.Terminal term;
    private int click_counter;

    ValaTermEmu () {

        this.title = "ValaTermEmu";
        this.window_position = Gtk.WindowPosition.CENTER;
        this.set_default_size (500, 600);
        this.border_width = 0;

        //A Random Button---------------------
        Gtk.Button button = new Gtk.Button.with_label ("Click me (0)");
        //this.add (button);

        button.clicked.connect (() => {
            button.label = "Click me (%d)".printf (++this.click_counter);
        });
        //------------------------------------

        //Terminal----------------------------
        Vte.Terminal term = new Vte.Terminal ();
        term.child_exited.connect( () => {
            destroy();
        } );
        term.eof.connect( () => {
            destroy();
        } );
        string[] argv = {"/usr/bin/zsh"};

        term.spawn_sync(DEFAULT, null, argv, null, CHILD_INHERITS_STDIN, null, null, null);
        //------------------------------------

        this.add (term);

    }

    static int main (string[] args) {

        Gtk.init(ref args);

        ValaTermEmu window = new ValaTermEmu ();
        window.destroy.connect (Gtk.main_quit);
        window.show_all ();

        Gtk.main();

        return (0);
    }
}
