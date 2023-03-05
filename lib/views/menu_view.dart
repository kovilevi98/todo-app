import 'package:custom_sidemenu/custom_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:localization/localization.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:todo_app/configs/colors.dart';
import 'package:todo_app/models/board.dart';
import 'package:todo_app/services/csv_service.dart';
import 'package:todo_app/stores/theme_store.dart';
import 'package:todo_app/views/history_view.dart';
import 'package:todo_app/views/home_view.dart';

class MenuPage extends StatefulWidget {
  BoardData? init;

  MenuPage({super.key, this.init});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  ThemeStore store = ThemeStore();

  @override
  Widget build(BuildContext context) {
    List<CustomMenuItem> menuItemsList = [
      CustomMenuItem(
        callback: () {
          if (store.dark) {
            store.dark = false;
            ThemeManager.of(context)
                .setBrightnessPreference(BrightnessPreference.light);
          } else {
            store.dark = true;
            ThemeManager.of(context)
                .setBrightnessPreference(BrightnessPreference.dark);
          }
        },
        title: 'theme'.i18n(),
        leadingIcon: Icons.sunny,
        iconSize: 22,
        titleSize: 16,
      ),
      CustomMenuItem(
        callback: () {
          store.home = true;
          setState(() {});
        },
        title: 'home'.i18n(),
        leadingIcon: Icons.home,
        iconSize: 22,
        titleSize: 16,
      ),
      CustomMenuItem(
        callback: () {
          store.home = false;
          setState(() {});
        },
        title: 'history'.i18n(),
        leadingIcon: Icons.history,
        iconSize: 22,
        titleSize: 16,
      ),
      CustomMenuItem(
        callback: () async {
          var result = await CsvExportService().generateCsv();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(result),
          ));
        },
        title: 'export'.i18n(),
        leadingIcon: Icons.import_export,
        iconSize: 22,
        titleSize: 16,
      ),
    ];

    return Scaffold(
        body: Observer(
      builder: (_) => CustomDrawer(
        homeWidget: Center(
          child: (store.home)
              ? HomeView(init: widget.init)
              : HistoryPage(
                  dark: store.dark,
                ),
        ),
        menuItemsList: menuItemsList,
        appBarActions: [],
        appBarTitle: Text(''),
        menuIcon: const Icon(Icons.menu),
      ),
    ));
  }
}
