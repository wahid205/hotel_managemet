import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hotel_reservation/model/datamanage.dart';
import 'package:provider/provider.dart';

class Reservations extends StatefulWidget {
  const Reservations({super.key});

  @override
  State<Reservations> createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<DataManagement>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reservations'),
          backgroundColor: Colors.purple,
        ),
        body: ListView.builder(
            itemCount: classInstancee.reservationManage.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.grey)),
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
                                        classInstancee.reservationManage[index]
                                            .hotelImage!,
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              classInstancee
                                  .reservationManage[index].hotelName!,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Total Rooms ${classInstancee.reservationManage[index].roomCount}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Total Price ${classInstancee.reservationManage[index].totalPrice}',
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
                                    onPressed: () {
                                      classInstancee.remove(index);
                                    },
                                    icon: const Icon(Icons.remove)),
                              ],
                            )
                          ]),
                    )),
              );
            })));
  }
}
