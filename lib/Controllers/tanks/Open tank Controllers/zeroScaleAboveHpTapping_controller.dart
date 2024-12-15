import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/tanks/OpenTank%20Level%20transmitter%20Models/zeroScaleAboveHpTapping_model.dart';

class zeroScaleAboveHpTapping_controller extends ChangeNotifier {
  TextEditingController entered_Sg = TextEditingController();
  TextEditingController entered_head1 = TextEditingController();
  TextEditingController entered_head2 = TextEditingController();
  zeroScaleAboveHpTapping_model model = zeroScaleAboveHpTapping_model();
  bool isresultsComplied = false;
  bool get validateSG => _validateSgData();
  bool get validateHead1 => _validateHead1Data();
  bool get validateHead2 => _validateHead2Data();

  processresults() {
    if (validateHead1 && validateSG && validateHead2) {
      model.calculate_lrv(double.tryParse(entered_Sg.text)!,
          double.tryParse(entered_head1.text)!);

      model.calculate_urv(double.tryParse(entered_Sg.text)!,
          double.tryParse(entered_head2.text)!);
      isresultsComplied = true;
    } else {
      isresultsComplied = false;
    }
    notifyListeners();
  }

  // validations for input text editing controllers
  bool _validateSgData() {
    return entered_Sg.text.isNotEmpty &&
        double.tryParse(entered_Sg.text) != null;
  }

  bool _validateHead1Data() {
    return entered_head1.text.isNotEmpty &&
        double.tryParse(entered_head1.text) != null;
  }

  bool _validateHead2Data() {
    return entered_head2.text.isNotEmpty &&
        double.tryParse(entered_head2.text) != null;
  }
}
