import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/data.dart';

class ReserveSummary extends StatefulWidget {
  const ReserveSummary({super.key});

  @override
  State<ReserveSummary> createState() => _ReserveSummaryState();
}

class _ReserveSummaryState extends State<ReserveSummary> {
  @override
  
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<HotelData>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hotel: ${classInstancee.hotelName}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Rooms:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text('Single Rooms: ${classInstancee.singleRooms}'),
            Text('Double Rooms: ${classInstancee.doubleRooms}'),
            const SizedBox(height: 16.0),
            Text(
              'Total Price: \$${classInstancee.price}',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Booking Details:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text('bookingDetails'),
            
          ],
        ),
      ),
    );
  }
}