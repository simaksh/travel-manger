import 'dart:io';
import 'Models/Bus.dart';
import 'Models/BusType.dart';
import 'Models/Ticket.dart';
import 'Models/TravelManager.dart';

void main() {
  TravelManager travelManager = TravelManager();
  while (true) {
    print('Menu');
    print('0-enseraf');
    print('1-define Bus');
    print('2-define Travel');
    print('3-display available bus');
    print('4-display available travel');
    print('5-reserve ticket');
    print('6-buy ticket');
    print('7-cancel ticket');
    print('8-exited');
    print('enter number in between(1-8)');
    String? inputChoice = stdin.readLineSync();

    switch (inputChoice) {
      case '1':
        print(
            '----------------------------add new bus -----------------------');
        print('enter bus name:');
        String busName = stdin.readLineSync()!;
        print('please choice type of bus: 1. vip | 2. normal');
        String? busTypeChoice = stdin.readLineSync();
        if (busTypeChoice == "1" || busTypeChoice == "2") {
          BusType busType =
              (busTypeChoice == '1') ? BusType.vip : BusType.normal;
          print('enter ticket price:');
          double? ticketPrice = double.tryParse(stdin.readLineSync()??'');
          travelManager.addBus(busName,busType, ticketPrice!=null?ticketPrice:1000);
          print("bus" + busType.name + 'added successfully');
          travelManager.displayAllBus();
        } else {
          print('invalid bus type');
        }
        break;
      case '2':
        if (travelManager.buses.length > 0) {
          print('-------------all available buses-----');
          for (int i = 0; i < travelManager.buses.length; i++) {
            print(
                '$i.${travelManager.buses[i].name}(${travelManager.buses[i].type}');
          }
          print('choice a bus:');

          int? busIndex = int.tryParse(stdin.readLineSync() ?? '');
          if (busIndex != null &&
              busIndex >= 0 &&
              busIndex < travelManager.buses.length) {
            print('enter origin:');
            String origin = stdin.readLineSync()!;
            print('enter distination:');
            String destination = stdin.readLineSync()!;
            print('enter price');
            double? price = double.tryParse(stdin.readLineSync() ?? '');
            travelManager.addTravel(travelManager.buses[busIndex], origin,
                destination, price ?? 100);
            print('travel added successfully');
          } else {
            print('invalid bus choice');
          }
        } else {
          print('bus not found');
        }
        break;

      case '3':
        print('-------------all available buses-----');
        for (int i = 0; i < travelManager.buses.length; i++) {
          print(
              '$i.${travelManager.buses[i].name}(${travelManager.buses[i].type}');
        }
        break;

      case '4':
        travelManager.displayTravel();
        break;

      case '5':
        print('-------------all available buses-----');
        for (int i = 0; i < travelManager.buses.length; i++) {
          print(
              '$i.${travelManager.buses[i].name}(${travelManager.buses[i].type}');
        }
        print('enter bus index to reserve ticket:');
        int? busIndex = int.tryParse(stdin.readLineSync() ?? '');
        if (busIndex != null &&
            busIndex >= 0 &&
            busIndex < travelManager.buses.length) {
          travelManager.displayAllSeatOfBus(travelManager.buses[busIndex]);
          print('enter seat number to reserve:');
          int? seatCode = int.tryParse(stdin.readLineSync() ?? '');
          if (seatCode != null) {
            travelManager.seatReserve(travelManager.buses[busIndex], seatCode);
            print('ticket reserved successfully!Amount paid');
          } else {
            print('invalid seat number');
          }
        } else {
          print('invalid bud index');
        }

        break;
      case '6':
        if (travelManager.buses.length > 0) {
          travelManager.displayAllBus();
          print('enter bus index to buy ticket');
          int? busIndexBuy = int.tryParse(stdin.readLineSync() ?? '');
          if (busIndexBuy != null &&
              busIndexBuy >= 0 &&
              busIndexBuy < travelManager.buses.length) {
            print('enter seat number to buy');
            int? seatCodeBuy = int.tryParse(stdin.readLineSync() ?? '');
            if (seatCodeBuy != null) {
              travelManager.ticketBuy(
                  travelManager.buses[busIndexBuy], seatCodeBuy);
            } else {
              print('invalid seat number');
            }
          } else {
            print('invalid bus index');
          }
        } else {
          print("No buses have been registered");
        }
        break;
      case '7':
        print('enter bus index to cancel ticket');
        int? busIndexcancel = int.tryParse(stdin.readLineSync() ?? '');
        if (busIndexcancel != null &&
            busIndexcancel >= 0 &&
            busIndexcancel < travelManager.buses.length) {
          travelManager.displayAllBus();
          print('enter seat number to cancel');
          int? seatCodeBuy = int.tryParse(stdin.readLineSync() ?? '');
          if (seatCodeBuy != null) {
            travelManager.ticketCancel(
                travelManager.buses[busIndexcancel], seatCodeBuy);
          } else {
            print('invalid seat number');
          }
        } else {
          print('invalid bud index');
        }
        break;
      case '8':
        print('exiting');
        break;
      default:
        print('invalid chice .please enter a number 0-8');
    }
  }
}
