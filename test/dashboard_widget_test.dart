import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/src/features/home/home_page.dart';

import 'matchers.dart';

void main() {
  testWidgets("should show one image when the dashboard is loaded",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    final Finder image = find.byType(Image);

    expect(image, findsOneWidget);
  });

  testWidgets("should show the Transfer feature when de dashboard is loadaded",
      ((WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    final transferFeatureItem = find.byWidgetPredicate(((widget) =>
        featureItemMatcher(widget, "Transfer", Icons.monetization_on)));

    expect(transferFeatureItem, findsOneWidget);
  }));

  testWidgets(
      "should show the Transaction feature when the dashboard is loaded ",
      ((WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    final transactionFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, "Transaction Feed", Icons.description));

    expect(transactionFeatureItem, findsOneWidget);
  }));
}


/**
 * Forma mais complicada de se fazer os testes de widget
 * final Finder transactionIcon = find.byIcon(Icons.description);
    expect(transactionIcon, findsOneWidget);
    final Finder transactionText =
        find.widgetWithText(FeatureBox, "Transaction Feed");
    expect(transactionText, findsOneWidget);
 */