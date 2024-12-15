import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/tanks/OpenTank%20Level%20transmitter%20Models/installedBellowHpTapping_model.dart';

class installedBellowHpTapping_controller extends ChangeNotifier {
  TextEditingController entered_SgHead1 = TextEditingController();
  TextEditingController entered_Sghaed2 = TextEditingController();
  TextEditingController entered_head1 = TextEditingController();
  TextEditingController entered_head2 = TextEditingController();
  installedBellowHpTapping_model model = installedBellowHpTapping_model();
  bool isresultsComplied = false;
  bool get validateSGhead1 => _validateSghead1Data();
  bool get validateSGhead2 => _validateSghead2Data();
  bool get validateHead1 => _validateHead1Data();
  bool get validateHead2 => _validateHead2Data();

  processresults() {
    if (validateHead1 && validateSGhead1 && validateSGhead2 && validateHead2) {
      model.calculate_lrv(double.tryParse(entered_SgHead1.text)!,
          double.tryParse(entered_head1.text)!);
      model.calculate_urv(double.tryParse(entered_Sghaed2.text)!,
          double.tryParse(entered_head2.text)!, model.Current_Calculated_lrv);
      isresultsComplied = true;
    } else {
      isresultsComplied = false;
    }
    notifyListeners();
  }

  // validations for input text editing controllers
  bool _validateSghead1Data() {
    return entered_SgHead1.text.isNotEmpty &&
        double.tryParse(entered_SgHead1.text) != null;
  }

  bool _validateSghead2Data() {
    return entered_Sghaed2.text.isNotEmpty &&
        double.tryParse(entered_Sghaed2.text) != null;
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
