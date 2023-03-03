// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArchiveStore on _ArchiveStore, Store {
  late final _$listAtom = Atom(name: '_ArchiveStore.list', context: context);

  @override
  ObservableList<Archive> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Archive> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$getListAsyncAction =
      AsyncAction('_ArchiveStore.getList', context: context);

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
