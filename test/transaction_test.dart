import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/src/features/transaction_feed/models/transaction_model.dart';
import 'package:my_app/src/features/transferencies/models/transferency_model.dart';

void main() {
  test("Should return the value when create a transaction", () {
    Transferency transferency = Transferency(id: 0, name: "", number: 0);
    Transaction transaction =
        Transaction(id: "", value: 200, transferency: transferency);

    expect(transaction.value, 200);
  });

  test("Should show error when create transaction with value less than zero",
      () {
    Transferency transferency = Transferency(id: 0, name: "", number: 0);
    expect(() => Transaction(id: "", value: 0, transferency: transferency),
        throwsAssertionError);
  });
}
