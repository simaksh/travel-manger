import 'BusType.dart';
import 'Seat.dart';
import 'Ticket.dart';

class Bus {
  late String name;
  late BusType type;
  late double ticketPrice;
  List<Seat> seats = [];
  List<Ticket> tickets=[];

  Bus({required this.name, required this.type,required this.ticketPrice}) {
    for (int i = 1; i <= (type == BusType.normal ? 44 : 30); i++) {
      seats.add(Seat(seatCode: i, isReserved: false));
    }
  }

}
