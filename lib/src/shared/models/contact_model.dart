class Contact {
  final String name;
  final int? number;

  Contact({required this.name, required this.number});

  @override
  String toString() {
    return "Name: $name, Number: $number";
  }
}
