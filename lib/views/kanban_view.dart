import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:todo_app/widgets/kanban_card_widget.dart';
import 'package:todo_app/widgets/kanban_title_widget.dart';


class KanbanView extends StatefulWidget {
  @override
  _KanbanViewState createState() => _KanbanViewState();
}

class _KanbanViewState extends State<KanbanView> {
  bool light = false;
  String text = "asd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('welcome-text'.i18n()),
            IconButton(
                onPressed: () {
                  setState(() {
                    if (light) {
                      ThemeManager.of(context)
                          .setBrightnessPreference(BrightnessPreference.dark);
                      light = false;
                    } else {
                      ThemeManager.of(context)
                          .setBrightnessPreference(BrightnessPreference.light);
                      light = true;
                    }
                  });
                },
                icon: Icon((light) ? Icons.sunny : Icons.dark_mode))
          ],
        ),
      ),
      body: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            KanbanTitleWidget(icon: FontAwesomeIcons.box, title: 'labels.todo'.i18n(),),
            KanbanCardWidget(),
          ],
        ),
      ),
    );
  }
}
