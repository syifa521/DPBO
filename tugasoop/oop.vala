using Gtk;
class MainWindow : Window {
    string[] storeData;

    construct {
        title = "UI Store Box Layout Reference";
        default_size = new SizeRequest(400, 300);
        destroy.connect(Gtk.main_quit);
        storeData = DataProvider.get_data();
        var vbox = new Gtk.Box(Orientation.VERTICAL, 5);
        add(vbox);
        var label = new Label("Welcome to the UI Store Box Layout Reference");
        vbox.pack_start(label, false, true, 10);
        var hbox = new Gtk.Box(Orientation.HORIZONTAL, 5);
        vbox.pack_start(hbox, true, true, 0);
        foreach (var item in storeData) {
            hbox.pack_start(createStoreItem(item), true, true, 0);
        }

        show_all();
int main(string[] args) {
    Gtk.init(ref args);

    var mainWindow = new MainWindow();

    Gtk.main();

    return 0;
}
