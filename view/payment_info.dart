import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hotel_reservation/widget/text_field.dart';

class PaymentInfo extends StatelessWidget {
  PaymentInfo({super.key});
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment'),backgroundColor: Colors.purple,),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DefaultTextField(
              controller: firstName,
              type: TextInputType.name,
              hinttext: 'First Name',
              prefix: Icons.person,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter Name Please';
                }
                return null;
              },
            ),
            DefaultTextField(
              controller: firstName,
              type: TextInputType.name,
              hinttext: 'Last Name',
              prefix: Icons.person,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter Name Please';
                }
                return null;
              },
            ),
            DefaultTextField(
              controller: firstName,
              type: TextInputType.name,
              hinttext: 'Email',
              prefix: Icons.person,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter Email Please';
                }
                return null;
              },
            ),
            DefaultTextField(
              controller: firstName,
              type: TextInputType.visiblePassword,
              hinttext: 'Phone',
              prefix: Icons.person,
              validate: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter phone';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: (){
              
            }, child: Container(
              width: double.infinity,
              height: 80,
              color: Colors.purple,
              child: const Text('Submit')))
          ],
        ),
      )),
    );
  }
}
