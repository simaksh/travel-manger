import 'dart:io';
import 'Bus.dart';
import 'BusType.dart';
import 'Reservation.dart';
import 'Ticket.dart';
import 'Travel.dart';

class TravelManager {
  List<Bus> buses = [];
  List<Travel> travel = [];
  List<Reservetion> reservation = [];

  void addTravel(Bus bus, String origin, String destination, double price) {
    Travel newTr = Travel(
        bus: bus.name, destination: destination, origin: origin, price: price);
    travel.add(newTr);
  }

  void addBus(String name, busType,double price) {
    Bus newBs = Bus(name: name, type: busType,ticketPrice:price);
    buses.add(newBs);
  }

  void displayAllBus() {
    for (Bus bus in buses) {
      print('information of bus');
      print('name:${bus.name}');
      print('type:${bus.type}');
    }
  }

  void displayAllSeatOfBus(Bus bus) {
    print('all seat of bus');
    for (var seat in bus.seats) {
      stdout.write('number:${seat.seatCode}'+' | ''reserved:${seat.isReserved}\n');
    }
  }

  void displayTravel() {
    print('-----------------------Available travels------------------');
    for (Travel travel in travel) {
      print(
          'Travel ${travel.origin} ta ${travel.destination} price:${travel.price}');
    }
  }

  seatReserve(Bus bus, int seatCode) {
    if (bus.seats.any((element) =>
        element.seatCode == seatCode && element.isReserved == false)) {
      var seat = bus.seats
              .where((element) => element.seatCode == seatCode)
              .first
              .seatCode == seatCode;
      double reserveAmount =
          (bus.type == BusType.normal) ? 0.3 * bus.ticketPrice : 1.3 * bus.ticketPrice;
    } else {
      print('invalid seat number or the seat is already reserved');
      return Ticket(seatCode: 2, amountPaid: 1);
    }
  }

  void ticketCancel(bus, int seatCode) {
    if (isValidSeat(bus, seatCode) && isSeatReserved(bus, seatCode)) {
      bus.seatStatus[seatCode - 1] = false;
      double refundAmount = (bus.type == BusType.normal)
          ? 0.2 * bus.price
          : 0.2 * 1.3 * bus.price;
      print('Refund Amount: $refundAmount Toman');
    } else {
      print('Invalid seat number or the seat is not reserved');
    }
  }

  bool isValidSeat(Bus bus, int seatCode) {
    return seatCode >= 1 &&
        (bus.type == BusType.vip ? seatCode <= 30 : seatCode <= 44);
  }

  bool isSeatReserved(Bus bus, int seatCode) {
    return bus.seats.any((element) =>
        element.seatCode == seatCode && element.isReserved == true);
  }

  ticketBuy(Bus bus, int seatCode) {
    if (!isSeatReserved(bus, seatCode)) {
      double refundAmount = 0.2 * bus.ticketPrice;
      print('Refund Amount:$refundAmount Toman');
      Ticket ticket = Ticket(seatCode: seatCode, amountPaid: refundAmount);
      seatReserve(bus, seatCode);
      bus.tickets.add(ticket);
    } else {
      print('The seat is not reserved.No refund available');
    }
  }
}
