import 'package:flutter/material.dart';

class DataManagement extends ChangeNotifier {
  String? hotelName;
  double? roomCount;
  double? totalPrice;
  String? hotelImage;
  DataManagement(
      { this.hotelImage,
       this.hotelName,
       this.roomCount,
       this.totalPrice});
  List<DataManagement> reservationManage = [];
  add(String? hotelName, double? roomCount, double? totalPrice,
      String? hotelImage) {
    reservationManage.add(DataManagement(
        hotelImage: hotelImage,
        hotelName: hotelName,
        roomCount: roomCount,
        totalPrice: totalPrice));
    notifyListeners();
  }

  remove(int index) {
    reservationManage.removeAt(index);
    notifyListeners();
  }
}
