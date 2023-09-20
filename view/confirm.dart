import 'package:flutter/material.dart';
import 'package:hotel_reservation/model/personal.dart';
import 'package:provider/provider.dart';

class Confirmation extends StatefulWidget {
  Confirmation({
    super.key,
  });

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final email = TextEditingController();

  final name = TextEditingController();

  final phone = TextEditingController();

  final checkin = TextEditingController();

  final checkout = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    checkin.dispose();
    checkout.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final classInstancee = Provider.of<PersonalData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservation Confirmation'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Reservation Details',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Guest Details',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: name,
                decoration: const InputDecoration(
                  labelText: 'Guest Name',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: checkin,
                decoration: const InputDecoration(
                  labelText: 'Check In',
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: checkout,
                decoration: const InputDecoration(
                  labelText: 'Check Out',
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  classInstancee.addGuest(name.text, email.text, phone.text,
                      checkin.text, checkout.text);
                },
                child: const Text('Confirm Reservation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
