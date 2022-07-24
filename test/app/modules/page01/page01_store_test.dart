import 'package:flutter_test/flutter_test.dart';
import 'package:template_modular_mobx_responsive/app/modules/page01/page01_store.dart';
 
void main() {
  late Page01Store store;

  setUpAll(() {
    store = Page01Store();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}