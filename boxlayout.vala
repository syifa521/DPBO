public class Application : Gtk.Window {
    public Application () {
        this.tittle = "Gtk.Box";
        this.window_position = Gtk.WindowPosition.CENTER;
        this.destroy.connect (Gtk.main_quit);
        this.set_default_size (350, 70);
        Gtk.Box box = NEW Gtk.Box (Gtl.orientation.VERTICAL, 0);

        box.pack_start (new Gtk.Button.with_label ("Nada"), false, false, 0)
        box.pack_start (new Gtk.Button.with_label ("Kamiliya"), false, false, 0)
        box.pack_start (new Gtk.Button.with_label ("Zahra"), true, false, 0)

        this.add (box):
    }
    public static int main (string[] args) {
        Gtk.init (ref args);

        Application app = new Application
        app.show_all ();
        Gtk.main ();
        return 0;
    }
}