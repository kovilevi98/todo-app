

import 'package:flutter/material.dart';

Future<void> createDialog({required BuildContext context, BoxConstraints? constraints,required Widget Function(BuildContext context) builder,bool dismissable=true}){
  return showModalBottomSheet<void>(
      context: context,
      isDismissible: dismissable,
      enableDrag: dismissable,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      constraints: (constraints != null) ? constraints : BoxConstraints(
        maxWidth:  600,
      ),
      builder: (BuildContext dialogContext) {
        return Padding(
          padding: MediaQuery.of(dialogContext).viewInsets,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 80.0, bottom:40.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              child: builder(dialogContext),
            ),
          ),
        );
      }
  );
}