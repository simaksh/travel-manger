class Ticket {
  int? seatCode;
  double? amountPaid;
  Ticket({required this.seatCode, required this.amountPaid});

  void displayTicket()
  {
    print(seatCode);
  }
}