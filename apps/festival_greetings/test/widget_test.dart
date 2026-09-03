import 'package:festival_greetings/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'root tabs switch between the three Festival Greetings skeletons',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      expect(find.text('情寄佳节 心意相连'), findsOneWidget);
      expect(find.text('首页'), findsOneWidget);
      expect(find.text('创作'), findsOneWidget);
      expect(find.text('我的'), findsOneWidget);

      await tester.tap(find.text('创作'));
      await tester.pumpAndSettle();
      expect(find.text('创作祝福'), findsOneWidget);
      expect(find.text('生成祝福文案'), findsOneWidget);

      await tester.tap(find.text('我的'));
      await tester.pumpAndSettle();
      expect(find.text('我的祝福'), findsOneWidget);
      expect(find.text('我的文案'), findsOneWidget);
    },
  );
}
