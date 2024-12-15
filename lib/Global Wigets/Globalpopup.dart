import 'package:flutter/material.dart';

enum PopupType {
  dialog,
  bottomSheet,
  snackbar,
}

class PopupManager {
  static void showPopup(BuildContext context, PopupType type, String message) {
    switch (type) {
      case PopupType.dialog:
        _showDialog(context, message);
        break;
      case PopupType.bottomSheet:
        _showBottomSheet(context, message);
        break;
      case PopupType.snackbar:
        _showSnackbar(context, message);
        break;
    }
  }

  static void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dialog'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  static void _showBottomSheet(BuildContext context, String message) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(message),
          ),
        );
      },
    );
  }

  static void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}

// Usage:
// PopupManager.showPopup(context, PopupType.dialog, 'Dialog message');
// PopupManager.showPopup(context, PopupType.bottomSheet, 'Bottom sheet message');
// PopupManager.showPopup(context, PopupType.snackbar, 'Snackbar message');
