// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'material3DemoFlutterTeam_store.g.dart';

class Material3DemoFlutterTeamStore = _Material3DemoFlutterTeamStoreBase
    with _$Material3DemoFlutterTeamStore;

abstract class _Material3DemoFlutterTeamStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
