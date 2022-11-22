import 'package:equatable/equatable.dart';

class Transferency extends Equatable {
  final int id;
  final String name;
  final int? number;

  const Transferency(
      {required this.id, required this.name, required this.number});

  @override
  String toString() {
    return "Id: $id, Name: $name, Number: $number";
  }

  Transferency.fromJson(Map<String, dynamic> json)
      : id = 0,
        name = json['name'],
        number = json["accountNumber"];

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "accountNumber": number};

  @override
  List<Object?> get props => [name, number];
}
