// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app_imc/utils/interpretador_imc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Teste para classificar IMC corretamente', () {
    expect(interpretarIMC(15), "Magreza grave");
    expect(interpretarIMC(16.5), "Magreza moderada");
    expect(interpretarIMC(18), "Magreza leve");
    expect(interpretarIMC(22), "Saudável");
    expect(interpretarIMC(27), "Sobrepeso");
    expect(interpretarIMC(32), "Obesidade Grau I");
    expect(interpretarIMC(37), "Obesidade Grau II (severa)");
    expect(interpretarIMC(42), "Obesidade Grau III (mórbida)");
  });

  test('Teste para valores extremos', () {
    expect(interpretarIMC(10), "Magreza grave");
    expect(interpretarIMC(50), "Obesidade Grau III (mórbida)");
  });

  test('Teste para valores na faixa de limites', () {
    expect(interpretarIMC(16), "Magreza moderada");
    expect(interpretarIMC(17), "Magreza leve");
    expect(interpretarIMC(18.5), "Saudável");
    expect(interpretarIMC(25), "Sobrepeso");
    expect(interpretarIMC(30), "Obesidade Grau I");
    expect(interpretarIMC(35), "Obesidade Grau II (severa)");
    expect(interpretarIMC(40), "Obesidade Grau III (mórbida)");
  });
}
