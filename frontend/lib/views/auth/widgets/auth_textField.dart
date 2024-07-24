import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaleela/res/colors.dart';

class AuthTextfield extends StatelessWidget {
  final String hint;
  const AuthTextfield({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.6,
      height: 45,
      child: TextField(
        cursorColor: black,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: cyan)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: cyan, width: 2.0),
          ),
        ),
      ),
    );
  }
}
