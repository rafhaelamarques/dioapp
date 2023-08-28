// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dioapp/data/model/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      "Verifica IMC para valores não nulos",
      () =>
          expect(Person(name: 'Maria', weight: 60, height: 1.65).imc(), 22.04));
  test(
      "Testa quando o peso e/ou altura são 0",
      () => expect(Person(name: 'Maria', weight: 0, height: 0).imc(),
          throwsA(isA<ArgumentError>())));
}
