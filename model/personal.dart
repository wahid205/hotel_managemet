import 'package:flutter/material.dart';

class PersonalData extends ChangeNotifier {
  String? name;
  String? email;
  String? phone;
  String? checkin;
  String? checkout;
  PersonalData(
      {this.checkin, this.checkout, this.email, this.name, this.phone});
  List<PersonalData> guest = [];

  addGuest(
    String? name,
    String? email,
    String? phone,
    String? checkin,
    String? checkout,
  ) {
    guest.add(PersonalData(
        checkin: checkin,
        checkout: checkout,
        email: email,
        name: name,
        phone: phone));
    notifyListeners();
  }
}
