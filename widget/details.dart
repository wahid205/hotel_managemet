import 'package:flutter/material.dart';
import 'package:hotel_reservation/model/data.dart';
import 'package:hotel_reservation/view/roomselect.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  Details({super.key, required this.index});
  int index;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<HotelData> selectedRooms = [];
  HotelData hotelsData = HotelData();
  void toggleRoomSelection(HotelData room) {
    setState(() {
      if (selectedRooms.contains(room)) {
        selectedRooms.remove(room);
      } else {
        selectedRooms.add(room);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.redAccent),
        title: Text(
          hotelsData.hotels[widget.index].hotelName!,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            hotelsData.hotels[widget.index].hotelImage!),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                hotelsData.hotels[widget.index].hotelBrief!,
                style: TextStyle(
                    color: Colors.redAccent.shade200,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                hotelsData.hotels[widget.index].details!,
                style: TextStyle(
                    color: Colors.redAccent.shade200,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: hotelsData.rooms!.length,
                itemBuilder: (context, index) {
                  final isSelected =
                      selectedRooms.contains(hotelsData.rooms![index]);
                  return ListTile(
                      title: Text(hotelsData.rooms![index].name),
                      subtitle:
                          Text('Price: \$${hotelsData.rooms![index].price}'),
                      trailing: Icon(
                        isSelected
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                      onTap: () {
                        toggleRoomSelection(hotelsData.rooms![index]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RoomSelection(index: index)));
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
