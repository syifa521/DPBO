using Gtk;

public class CatatanBaruWindow : Window {
    private Entry judulEntry;
    private Entry deskripsiEntry;

    public CatatanBaruWindow() {
        
        this.title = "Catatan Pribadi";
        this.default_width = 400;
        this.default_height = 300;
        this.destroy.connect(Gtk.main_quit);

    
        judulEntry = new Entry();
        deskripsiEntry = new Entry();

        var judulLabel = new Label("Judul");
        var deskripsiLabel = new Label("Deskripsi");

        var simpanButton = new Button.with_label("Simpan");
        simpanButton.clicked.connect(onSimpanButtonClicked);


        var grid = new Grid();
        grid.orientation = Orientation.VERTICAL;
        grid.column_spacing = 10;
        grid.row_spacing = 10;

        grid.attach(judulLabel, 0, 0, 1, 1);
        grid.attach(judulEntry, 1, 0, 1, 1);
        grid.attach(deskripsiLabel, 0, 1, 1, 1);
        grid.attach(deskripsiEntry, 1, 1, 1, 1);
        grid.attach(simpanButton, 0, 2, 2, 1);

    
        var cssProvider = new CssProvider();
        cssProvider.load_from_data("css here");

        var styleContext = grid.get_style_context();
        styleContext.add_provider(cssProvider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

        add(grid);

        show_all();
    }

    private void onSimpanButtonClicked(Button button) {
        string judul = judulEntry.text;
        string deskripsi = deskripsiEntry.text;

        if (judul.length == 0 || deskripsi.length == 0) {
        
            var errorDialog = new MessageDialog(this,
                DialogFlags.MODAL,
                MessageType.ERROR,
                ButtonsType.CLOSE,
                "Judul dan Deskripsi tidak boleh kosong");
            errorDialog.run();
            errorDialog.destroy();
        } else {
        
            var infoDialog = new MessageDialog(this,
                DialogFlags.MODAL,
                MessageType.INFO,
                ButtonsType.CLOSE,
                "Catatan disimpan:\nJudul: %s\nDeskripsi: %s".printf(judul, deskripsi));
            infoDialog.run();
            infoDialog.destroy();
        }
    }
}

public class CatatanBaruApp : Gtk.Application {
    public CatatanBaruApp() {
        Object(application_id: "org.example.catatanbaru", flags: ApplicationFlags.FLAGS_NONE);
    }

    public static int main(string[] args) {
        var app = new CatatanBaruApp();
        return app.run(args);
    }

    protected override void activate() {
        var window = new CatatanBaruWindow();
        add_window(window);
        window.present();
    }
}
