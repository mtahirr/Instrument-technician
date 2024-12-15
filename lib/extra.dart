import 'package:flutter/material.dart';

Widget centerButton(context) {
  return Center(
    child: ElevatedButton(
      onPressed: () {
        // Perform calculation and display results
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          'Calculate',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    ),
  );
}
