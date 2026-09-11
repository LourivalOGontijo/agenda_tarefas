import 'package:flutter_test/flutter_test.dart';

import 'package:agenda_tarefas/main.dart';

void main() {
  testWidgets('Aplicativo inicia na tela de login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const AgendaTarefasApp());

    expect(find.text('TASKFLOW'), findsOneWidget);
    expect(find.text('Bem-vindo!'), findsOneWidget);
    expect(find.text('ENTRAR'), findsOneWidget);
  });
}
