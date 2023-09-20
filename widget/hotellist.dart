import 'package:flutter/material.dart';

import 'package:hotel_reservation/model/data.dart';
import 'package:provider/provider.dart';

import 'details.dart';

// ignore: must_be_immutable
class HotelList extends StatefulWidget {
  HotelList({super.key, required this.index});
  int index;
  @override
  State<HotelList> createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> {
  HotelData hotelsData = HotelData();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.grey)),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(index: widget.index)));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.grey),
                          image: DecorationImage(
                              image: NetworkImage(
                                hotelsData.hotels[widget.index].hotelImage!,
                              ),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      hotelsData.hotels[widget.index].hotelName!,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      hotelsData.hotels[widget.index].hotelBrief!,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.favorite)),
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}
