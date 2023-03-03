// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStore, Store {
  late final _$darkAtom = Atom(name: '_ThemeStore.dark', context: context);

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

  late final _$homeAtom = Atom(name: '_ThemeStore.home', context: context);

  @override
  bool get home {
    _$homeAtom.reportRead();
    return super.home;
  }

  @override
  set home(bool value) {
    _$homeAtom.reportWrite(value, super.home, () {
      super.home = value;
    });
  }

  @override
  String toString() {
    return '''
dark: ${dark},
home: ${home}
    ''';
  }
}
