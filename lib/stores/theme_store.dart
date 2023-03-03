import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  // store variables:-----------------------------------------------------------
  @observable
  bool dark = false;

  @observable
  bool home = true;

  // actions:-------------------------------------------------------------------

}
