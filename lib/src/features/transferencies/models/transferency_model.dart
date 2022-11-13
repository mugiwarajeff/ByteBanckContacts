class Transferency {
  final int id;
  final String name;
  final int? number;

  Transferency({required this.id, required this.name, required this.number});

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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transferency &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          number == other.number;

  @override
  int get hashCode => name.hashCode ^ number.hashCode;
}
