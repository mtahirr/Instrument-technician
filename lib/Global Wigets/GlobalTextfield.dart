import 'package:flutter/material.dart';

Widget buildTextField(String labelText, TextEditingController controller,
    TextFieldChangeCallback callbackAction) {
  return TextField(
    controller: controller,
    onChanged: (_) => callbackAction(labelText),
    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(fontSize: 13.3),
      border: OutlineInputBorder(),
    ),
  );
}

typedef void TextFieldChangeCallback(String lable);
