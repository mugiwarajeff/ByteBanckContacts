import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/src/features/formulary_contact/widgets/button_formulary.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input_list.dart';
import 'package:my_app/src/features/home/home_page.dart';
import 'package:my_app/src/features/transferencies/models/transferency_model.dart';
import 'package:my_app/src/features/transferencies/widgets/transferency_list.dart';
import "package:mockito/annotations.dart";
import '../matchers/matchers.dart';
import "save_contact_flow_test.mocks.dart";
import "../../lib/database/dao/contacts_dao.dart";

@GenerateMocks([ContactDAO])
void main() {
  testWidgets("Should create a contact ", (WidgetTester tester) async {
    MockContactDAO mockContactDao = MockContactDAO();
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),
    ));

    Finder dashboard = find.byWidgetPredicate((widget) {
      if (widget is Image) {
        return true;
      }

      return false;
    });
    expect(dashboard, findsOneWidget);

    Finder transferFeature = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, "Transfer", Icons.monetization_on));
    expect(transferFeature, findsOneWidget);

    await tester.tap(transferFeature);
    await tester.pumpAndSettle();

    Finder transferencyListItem = find.byType(TransferencyList);
    expect(transferencyListItem, findsOneWidget);

    verify(mockContactDao.getAll()).called(1);

    Finder fabItem = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabItem, findsOneWidget);

    await tester.tap(fabItem);
    await tester.pumpAndSettle();

    Finder inputFormularyNameItem =
        find.byWidgetPredicate((widget) => inputItemMatcher(widget, "Name"));
    expect(inputFormularyNameItem, findsOneWidget);
    await tester.enterText(inputFormularyNameItem, "Maria");

    Finder inputFormularyNumberItem =
        find.byWidgetPredicate((widget) => inputItemMatcher(widget, "Number"));
    expect(inputFormularyNumberItem, findsOneWidget);
    await tester.enterText(inputFormularyNumberItem, "1000");

    Finder buttonFormularyItem =
        find.widgetWithText(ButtonFormulary, "Confirm");
    expect(buttonFormularyItem, findsOneWidget);

    await tester.tap(buttonFormularyItem);
    await tester.pumpAndSettle();

    //verify(mockContactDao.insertDataBase(Transferency(id: 0, name: "Maria", number: 1000))).called(1);

    Finder transferencyItemListBack = find.byType(TransferencyList);
    expect(transferencyItemListBack, findsOneWidget);

    //verify(mockContactDao.getAll()).called(1);
  });
}
