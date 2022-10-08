class Transaction {
  late int id;
  late String name;
  late int value;

  Transaction({required this.id, required this.name, required this.value});

  @override
  String toString() {
    return "id: $id, Name: $name, Value: $value";
  }
}
