class Travel {
  String? bus;
  late String origin;
  late String destination;
  late double price;
  List<int> reservedSeats = [];

  Travel(
      {required this.bus,
        required this.destination,
        required this.origin,
        required this.price});
}
