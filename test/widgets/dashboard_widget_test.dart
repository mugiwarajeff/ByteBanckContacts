import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:my_app/database/dao/contacts_dao.dart';
import 'package:my_app/src/features/home/home_page.dart';

import '../matchers/matchers.dart';
import 'dashboard_widget_test.mocks.dart';

@GenerateMocks([ContactDAO])
void main() {
  MockContactDAO mockContactDao = MockContactDAO();
  testWidgets("should show one image when the dashboard is loaded",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: HomePage(
      contactDAO: mockContactDao,
    )));
    final Finder image = find.byType(Image);

    expect(image, findsOneWidget);
  });

  testWidgets("should show the Transfer feature when de dashboard is loadaded",
      ((WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomePage(contactDAO: mockContactDao),
    ));

    final transferFeatureItem = find.byWidgetPredicate(((widget) =>
        featureItemMatcher(widget, "Transfer", Icons.monetization_on)));

    expect(transferFeatureItem, findsOneWidget);
  }));

  testWidgets(
      "should show the Transaction feature when the dashboard is loaded ",
      ((WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomePage(
        contactDAO: mockContactDao,
      ),
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