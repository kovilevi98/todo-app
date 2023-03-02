import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:todo_app/configs/colors.dart';
import 'package:todo_app/models/board_item.dart';
import 'package:todo_app/widgets/dialogs/new_card_dialog.dart';

class ItemWidget extends StatefulWidget {
  final bool dark;
  final BoardItemData itemObject;
  final int listIndex;
  final Future<void> refresh;
  final void Function(String) sendArchive;
  final void Function(String) start;
  final void Function(String, int) onTimeChanged;

  const ItemWidget(
      {Key? key,
      required this.dark,
      required this.itemObject,
      required this.listIndex,
      required this.refresh,
      required this.sendArchive,
      required this.start, required this.onTimeChanged})
      : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final stopWatchTimer = StopWatchTimer(mode: StopWatchMode.countUp);

  @override
  void initState() {
    super.initState();
    stopWatchTimer.setPresetSecondTime(widget.itemObject.currentTimeSpent ?? 0);
  }

  @override
  void dispose() async {
    super.dispose();
    await stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    stopWatchTimer.secondTime.listen((value) => {
        widget.onTimeChanged(widget.itemObject.uuid, value)
    });

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Adaptive.px(8.0)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(Adaptive.px(8.0)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.itemObject.title!),
                  PopupMenuButton(
                    onSelected: (value) async {
                      if (value == 'edit') {
                        var result = await showNewCardDialog(
                            context: context,
                            backgroundColor: (widget.dark)
                                ? AppColors.darkBlack
                                : AppColors.grey,
                            rename: true,
                            text: widget.itemObject.title);

                        if (result != null) {
                          widget.itemObject.title = result;
                          widget.refresh;
                          setState(() {});
                        }
                      }

                      if (value == 'archive') {
                        widget.sendArchive(widget.itemObject.uuid);
                      }

                      if (value == 'start') {
                        stopWatchTimer.onStartTimer();
                      }

                      if (value == 'stop') {
                        stopWatchTimer.onStopTimer();
                      }
                      // your logic
                    },
                    itemBuilder: (BuildContext bc) {
                      if (stopWatchTimer.isRunning) {
                        return [
                          PopupMenuItem(
                            value: 'edit',
                            child: Text("edit".i18n()),
                          ),
                          PopupMenuItem(
                            value: 'archive',
                            child: Text("archive".i18n()),
                          ),
                          PopupMenuItem(
                            value: 'stop',
                            child: Text("stop".i18n()),
                          )
                        ];
                      } else {
                        return [
                          PopupMenuItem(
                            value: 'edit',
                            child: Text("edit".i18n()),
                          ),
                          PopupMenuItem(
                            value: 'archive',
                            child: Text("archive".i18n()),
                          ),
                          PopupMenuItem(
                            value: 'start',
                            child: Text("start".i18n()),
                          ),
                        ];
                      }
                    },
                  ),
                ],
              ),
              StreamBuilder<int>(
                stream: stopWatchTimer.rawTime,
                initialData: (widget.itemObject.currentTimeSpent != null)
                    ? widget.itemObject.currentTimeSpent
                    : 0,
                builder: (context, snap) {
                  final value = snap.data;
                  final displayTime =
                      StopWatchTimer.getDisplayTime(value!, milliSecond: false);
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      displayTime,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
