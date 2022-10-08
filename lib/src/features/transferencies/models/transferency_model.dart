class Transferency {
  final int id;
  final String name;
  final int? number;

  Transferency({required this.id, required this.name, required this.number});

  @override
  String toString() {
    return "Id: $id, Name: $name, Number: $number";
  }
}
