import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todo_app/configs/colors.dart';
import 'package:todo_app/models/board_list.dart';

class Header extends StatefulWidget {
  final BoardListData list;
  final bool dark;

  const Header({Key? key, required this.list, required this.dark}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Adaptive.px(15), vertical: Adaptive.px(10)),
            child: Text(
              widget.list.title!,
              style: TextStyle(
                  fontSize: 20,
                  color:
                  (widget.dark) ? AppColors.blue : AppColors.darkBlack),
            )));
  }
}
