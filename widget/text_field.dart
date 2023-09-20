import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DefaultTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  late FormFieldValidator<String> validate;
  TextInputType? type;
  String? hinttext;
  IconData? prefix;
  bool isPassword = false;
  DefaultTextField(
      {super.key,
      required this.controller,
      required this.validate,
      this.hinttext,
      this.isPassword = false,
      this.prefix,
      this.type});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        validator: validate,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.grey),
          prefix: Icon(prefix),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ), // OutlineInputBorder
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade50),
          ),
// InputDecoration
        ));
  }
}
