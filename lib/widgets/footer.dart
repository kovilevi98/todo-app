import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todo_app/configs/colors.dart';
import 'package:todo_app/stores/home_store.dart';
import 'package:todo_app/widgets/dialogs/new_card_dialog.dart';

class Footer extends StatefulWidget {
  final bool dark;
  final int index;
  final void Function(String, int) addTask;
  const Footer({Key? key, required this.index, required this.dark, required this.addTask}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Adaptive.px(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: (widget.dark)
                  ? MaterialStatePropertyAll(AppColors.blue)
                  : MaterialStatePropertyAll(AppColors.blue),
            ),
            onPressed: () async {
              var result = await showNewCardDialog(
                  context: context,
                  backgroundColor:
                  (widget.dark) ? AppColors.darkBlack : AppColors.grey, rename: false);
              if (result != null) {
                widget.addTask(result, widget.index);
              }
            },
            child: Text('add'.i18n()),
          ),
        ],
      ),
    );
  }
}
