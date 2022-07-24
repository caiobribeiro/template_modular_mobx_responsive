import 'package:mobx/mobx.dart';

part 'page01_store.g.dart';

// ignore: library_private_types_in_public_api
class Page01Store = _Page01StoreBase with _$Page01Store;

abstract class _Page01StoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
