
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:todo_app/widgets/dialogs/dialog.dart';

Future<String?> showNewCardDialog({required BuildContext context, required Color backgroundColor}) async{

  var textController=TextEditingController();
  bool rename=false;

  await createDialog(
      context: context,
      builder: (context){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('add'.i18n() ,style: Theme.of(context).textTheme.headline3),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical:10.0, horizontal: 30.0),
                    child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        controller: textController,
                        minLines: 1,
                        maxLines: 1,
                        autofocus: true
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: ElevatedButton(
                      onPressed: (){
                        rename=true;
                        Navigator.of(context).pop();
                      },
                      child: Text("save".i18n())),
                )

              ],
            ),
          ),
        );
      }
  );

  return rename ? textController.text : null;
}