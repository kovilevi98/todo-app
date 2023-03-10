// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$listDataAtom =
      Atom(name: '_HomeStore.listData', context: context);

  @override
  ObservableList<BoardListData> get listData {
    _$listDataAtom.reportRead();
    return super.listData;
  }

  @override
  set listData(ObservableList<BoardListData> value) {
    _$listDataAtom.reportWrite(value, super.listData, () {
      super.listData = value;
    });
  }

  late final _$listAtom = Atom(name: '_HomeStore.list', context: context);

  @override
  ObservableList<BoardList> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<BoardList> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$darkAtom = Atom(name: '_HomeStore.dark', context: context);

  @override
  bool get dark {
    _$darkAtom.reportRead();
    return super.dark;
  }

  @override
  set dark(bool value) {
    _$darkAtom.reportWrite(value, super.dark, () {
      super.dark = value;
    });
  }

  late final _$dragAbleAtom =
      Atom(name: '_HomeStore.dragAble', context: context);

  @override
  bool get dragAble {
    _$dragAbleAtom.reportRead();
    return super.dragAble;
  }

  @override
  set dragAble(bool value) {
    _$dragAbleAtom.reportWrite(value, super.dragAble, () {
      super.dragAble = value;
    });
  }

  late final _$addTaskAsyncAction =
      AsyncAction('_HomeStore.addTask', context: context);

  @override
  Future<void> addTask(String title, int index) {
    return _$addTaskAsyncAction.run(() => super.addTask(title, index));
  }

  late final _$refreshAsyncAction =
      AsyncAction('_HomeStore.refresh', context: context);

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$onTimeChangedAsyncAction =
      AsyncAction('_HomeStore.onTimeChanged', context: context);

  @override
  Future<void> onTimeChanged(String uuid, int time) {
    return _$onTimeChangedAsyncAction
        .run(() => super.onTimeChanged(uuid, time));
  }

  late final _$sendArchiveAsyncAction =
      AsyncAction('_HomeStore.sendArchive', context: context);

  @override
  Future<void> sendArchive(String uuid) {
    return _$sendArchiveAsyncAction.run(() => super.sendArchive(uuid));
  }

  late final _$startAsyncAction =
      AsyncAction('_HomeStore.start', context: context);

  @override
  Future<void> start(String uuid) {
    return _$startAsyncAction.run(() => super.start(uuid));
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void changeDragAble() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.changeDragAble');
    try {
      return super.changeDragAble();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void init(BoardData? boardData) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.init');
    try {
      return super.init(boardData);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listData: ${listData},
list: ${list},
dark: ${dark},
dragAble: ${dragAble}
    ''';
  }
}
