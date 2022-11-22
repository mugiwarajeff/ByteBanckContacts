import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/app_dependencies.dart';
import 'package:my_app/database/dao/contacts_dao.dart';
import 'package:my_app/http/http_client.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input.dart';
import 'package:my_app/src/features/home/home_page.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';
import 'package:my_app/src/features/transferencies/models/transferency_model.dart';
import 'package:my_app/src/features/transferencies/widgets/transferency_item.dart';
import 'package:my_app/src/features/transferencies/widgets/transferency_list.dart';
import 'package:my_app/src/features/transferency_form/widgets/confirm_dialog.dart';
import 'package:my_app/src/shared/response_dialog.dart';

import '../matchers/matchers.dart';
import 'transferency_flow_test.mocks.dart';

@GenerateMocks(
  [ContactDAO, TransactionWebClient],
)
Future<void> main() async {
  testWidgets("Should create a transferency", (WidgetTester tester) async {
    MockTransactionWebClient mockTransactionWebClient =
        MockTransactionWebClient();
    MockContactDAO mockContactDAO = MockContactDAO();
    final Transferency maria = Transferency(id: 0, name: "Maria", number: 1000);

    await tester.pumpWidget(AppDependencies(
      contactDAO: mockContactDAO,
      transactionWebClient: mockTransactionWebClient,
      child: const MaterialApp(
        home: HomePage(),
      ),
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

    when(mockContactDAO.getAll()).thenAnswer((realInvocation) async {
      return const [Transferency(id: 0, name: "Maria", number: 1000)];
    });

    when(mockTransactionWebClient.postTransaction(
            Transaction(id: "0", transferency: maria, value: 1000), "1000"))
        .thenAnswer((realInvocation) async {
      return Transaction(id: "0", transferency: maria, value: 1000);
    });

    await tester.tap(transferFeature);
    await tester.pumpAndSettle();

    Finder transferencyListItem = find.byType(TransferencyList);
    expect(transferencyListItem, findsOneWidget);

    verify(mockContactDAO.getAll()).called(1);
    Finder transferencyItem = find.byWidgetPredicate((widget) {
      if (widget is TrasferencyItem) {
        if (widget.contact == maria) {
          return true;
        }
      }
      return false;
    });
    expect(transferencyItem, findsOneWidget);

    await tester.tap(transferencyItem);
    await tester.pumpAndSettle();

    Finder transferencyNameItem = find.widgetWithText(Column, "Maria");
    expect(transferencyNameItem, findsOneWidget);

    Finder transferencyAccountItem = find.widgetWithText(Column, "1000");
    expect(transferencyAccountItem, findsOneWidget);

    Finder inputTransferencyItem = find.byWidgetPredicate((widget) {
      if (widget is FormularyInput) {
        if (widget.label == "value") {
          return true;
        }
      }
      return false;
    });
    expect(inputTransferencyItem, findsOneWidget);
    await tester.enterText(inputTransferencyItem, "1000");

    Finder confirmTransferency = find.widgetWithText(ElevatedButton, "Confirm");
    expect(confirmTransferency, findsOneWidget);

    await tester.tap(confirmTransferency);
    await tester.pumpAndSettle();

    Finder transactionAuthDialog = find.byType(ConfirmDialog);
    expect(transactionAuthDialog, findsOneWidget);

    Finder inputAuthDialog = find.byKey(const Key("authDialogInputPassword"));
    expect(inputAuthDialog, findsOneWidget);
    await tester.enterText(inputAuthDialog, "1000");

    Finder cancelButton = find.widgetWithText(TextButton, "Cancel");
    expect(cancelButton, findsOneWidget);

    Finder confirmButton = find.widgetWithText(TextButton, "Approve");
    expect(confirmButton, findsOneWidget);

    await tester.tap(confirmButton);
    await tester.pumpAndSettle();

    verify(mockTransactionWebClient.postTransaction(
            Transaction(id: "0", transferency: maria, value: 1000), "1000"))
        .called(1);

    Finder sucessDialog = find.byType(SuccessDialog);
    expect(sucessDialog, findsOneWidget);

    Finder okButton = find.widgetWithText(TextButton, 'Ok');
    expect(okButton, findsOneWidget);

    await tester.tap(okButton);
    await tester.pumpAndSettle();

    Finder contactsListBack = find.byType(TransferencyList);
    expect(contactsListBack, findsOneWidget);
  });
}
