// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final controller;
  final validatorMessage;
  final hintText;
  final prefixIcon;
  final isPassword;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.validatorMessage,
      required this.hintText,
      this.prefixIcon,
      this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green[300], borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
          controller: controller,
          cursorColor: Colors.black,
          // obscureText: isPassword ?? false,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
          keyboardType: TextInputType.text,
          onChanged: (String name) {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.blueGrey[600], //color???
            ), //icon change
            border: InputBorder.none,
            fillColor: Colors.black,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.black54,
                letterSpacing: 0.6,
                fontWeight: FontWeight.w400),
            //counterText: 'gggg',
            contentPadding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
          )),
    );
  }
}
