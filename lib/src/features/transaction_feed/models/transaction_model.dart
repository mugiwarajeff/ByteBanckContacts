import 'package:my_app/src/features/transferencies/models/transferency_model.dart';
import 'package:my_app/src/features/transferencies/widgets/transferency_item.dart';

class Transaction {
  late String id;
  late double value;
  late Transferency transferency;

  Transaction(
      {required this.id, required this.value, required this.transferency});

  static Transaction toTransaction(Map<String, dynamic> mapTransaction) {
    Transaction transaction = Transaction(
        id: mapTransaction["id"],
        value: mapTransaction["value"],
        transferency: Transferency(
            id: 0,
            name: mapTransaction["contact"]["name"],
            number: mapTransaction["contact"]["accountNumber"]));

    return transaction;
  }

  @override
  String toString() {
    return "id: $id, Value: $value, transferency: ${transferency.toString()}";
  }
}
