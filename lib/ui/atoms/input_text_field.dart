import 'package:chat_flutter/config/app_radius.dart';
import 'package:flutter/material.dart';

import 'package:chat_flutter/config/app_space.dart';

class InputTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function onChanged;
  final TextEditingController controller;
  final int maxLines;

  InputTextField({
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        onChanged: onChanged,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.xsmall),
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.xsmall),
            borderSide: BorderSide(),
          ),
          contentPadding: EdgeInsets.all(AppSpace.small),
        ),
      ),
    );
  }
}
