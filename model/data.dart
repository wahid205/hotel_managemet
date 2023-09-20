import 'package:flutter/cupertino.dart';

class HotelData extends ChangeNotifier {
  String? hotelName;
  String? hotelImage;
  String? hotelBrief;
  String? details;
  String? roomName;
  int? price = 100;
  double singleRooms = 0;
  double doubleRooms = 0;
  double totalRooms = 0;
  double totalPrice = 0;
  List? rooms = [];
  HotelData({
    this.hotelBrief,
    this.hotelImage,
    this.hotelName,
    this.details,
    this.roomName,
    this.price,
    this.rooms,
  });
  List<HotelData> hotels = [
    HotelData(
      hotelBrief: 'hotelBrief',
      hotelImage:
          'https://th.bing.com/th/id/OIP.H7qwNGZKpE9awBmmBGKn-AHaEs?pid=ImgDet&rs=1',
      hotelName: 'hotelName',
      details: '',
      price: 77,
      roomName: '',
      rooms: [],
    ),
    HotelData(
      hotelBrief: 'hotelBrief',
      hotelImage:
          'https://th.bing.com/th/id/OIP.B-aNkpY6QYijy_-Fqqx_5wHaE-?pid=ImgDet&rs=1',
      hotelName: 'hotelName',
      details: '',
      price: 88,
      roomName: '',
      rooms: [],
    ),
  ];
  low() {
    price = price! - 100;
    notifyListeners();
  }

  high() {
    price = price! - 100;
    notifyListeners();
  }

  current() {}
}
