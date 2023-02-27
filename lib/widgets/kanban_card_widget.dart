import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KanbanCardWidget extends StatelessWidget {
  const KanbanCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Adaptive.px(150),
      child: Card(
        child: Padding(padding: EdgeInsets.all(Adaptive.px(10),),
        child: Text("dsadasdd")),
      ),
    );
  }
}
