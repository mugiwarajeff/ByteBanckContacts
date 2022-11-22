import 'package:equatable/equatable.dart';
import 'package:my_app/src/features/transferencies/models/transferency_model.dart';

class Transaction extends Equatable {
  late String id;
  late double value;
  late Transferency transferency;

  Transaction(
      {required this.id, required this.value, required this.transferency})
      : assert(value > 0);

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

  Transaction.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        value = json["value"],
        transferency = Transferency.fromJson(json["contact"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "value": value, "contact": transferency.toJson()};

  @override
  String toString() {
    return "id: $id, Value: $value, contact: ${transferency.toString()}";
  }

  @override
  List<Object?> get props => [value, transferency];
}
