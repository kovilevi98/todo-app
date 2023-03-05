import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todo_app/configs/colors.dart';
import 'package:todo_app/widgets/glass_container.dart';

class HistoryItem extends StatelessWidget {
  final String title;
  final DateTime finishedTime;
  final String spentTime;
  final bool dark;

  const HistoryItem(
      {Key? key, required this.title, required this.finishedTime, required this.dark, required this.spentTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Adaptive.px(20), vertical: Adaptive.px(5)),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                //set border radius more than 50% of height and width to make circle
              ),
              child: GlassMorphism(
                start: 0.9,
                end: 0.2,
                dark: dark,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Adaptive.px(40), vertical: Adaptive.px(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      Text("spent_time".i18n() + spentTime),
                      Text("finished_at".i18n() +
                          DateFormat('yyyy-MM-dd').format(finishedTime))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
