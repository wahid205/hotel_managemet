import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hotel_reservation/model/data.dart';

import 'package:hotel_reservation/widget/hotellist.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HotelData hotelsData = HotelData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Reservation'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: hotelsData.hotels.length,
              itemBuilder: ((context, index) {
                return HotelList(index: index);
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.white10,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: "Heart"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "Person"),
        ],
        onTap: (value) {},
      ),
    );
  }
}
