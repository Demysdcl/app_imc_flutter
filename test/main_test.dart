import 'package:app_imc/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App IMC Test', (WidgetTester tester) async {
    await tester.pumpWidget(const AppIMC());

    expect(find.text('Calculadora de IMC'), findsOneWidget);

    await tester.enterText(find.byKey(const Key('nome')), 'John Doe');
    await tester.enterText(find.byKey(const Key('peso')), '70');
    await tester.enterText(find.byKey(const Key('altura')), '1.75');

    await tester.tap(find.text('Calcular IMC'));
    await tester.pump();

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('IMC'), findsOneWidget);
    expect(find.text('Resultado'), findsOneWidget);
  });
}
