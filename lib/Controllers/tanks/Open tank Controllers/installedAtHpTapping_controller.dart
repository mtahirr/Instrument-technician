import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/tanks/OpenTank%20Level%20transmitter%20Models/installedAtHpTapping_Model.dart';

class installedAtHpTapping_controller extends ChangeNotifier {
  TextEditingController entered_Sg = TextEditingController();
  TextEditingController entered_head = TextEditingController();
  installedAtHpTapping_Model model = installedAtHpTapping_Model();
  bool isUrvComplied = false;
  bool get validateSG => _validateSgData();
  bool get validateHead => _validateHeadData();

  processresults() {
    if (validateHead && validateSG) {
      model.calculate_urv(double.tryParse(entered_Sg.text)!,
          double.tryParse(entered_head.text)!);
      isUrvComplied = true;
    } else {
      isUrvComplied = false;
    }
    notifyListeners();
  }

  // validations for input text editing controllers
  bool _validateSgData() {
    return entered_Sg.text.isNotEmpty &&
        double.tryParse(entered_Sg.text) != null;
  }

  bool _validateHeadData() {
    return entered_head.text.isNotEmpty &&
        double.tryParse(entered_head.text) != null;
  }
}
