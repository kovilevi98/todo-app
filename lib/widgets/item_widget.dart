import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:todo_app/configs/colors.dart';
import 'package:todo_app/models/board_item.dart';
import 'package:todo_app/widgets/dialogs/new_card_dialog.dart';

class ItemWidget extends StatefulWidget {
  final bool dark;
  final BoardItemData itemObject;
  const ItemWidget({Key? key, required this.dark, required this.itemObject}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.px(8.0)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(Adaptive.px(8.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.itemObject.title!),
              PopupMenuButton(
                onSelected: (value) async {
                  if(value == 'edit'){
                    var result = await showNewCardDialog(context: context,backgroundColor:
                    (widget.dark) ? AppColors.darkBlack : AppColors.grey, rename: true, text: widget.itemObject.title);

                    if(result != null){
                      widget.itemObject.title = result;
                      setState(() {});
                    }
                  }
                  // your logic
                },
                itemBuilder: (BuildContext bc) {
                  return [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text("edit".i18n()),
                    ),
                  ];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
