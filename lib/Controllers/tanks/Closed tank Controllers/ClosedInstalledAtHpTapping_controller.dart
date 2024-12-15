import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/tanks/Closed%20Tank%20Level%20transmitter%20Models/closedInstalledAtHpTapping_model.dart';

class ClosedInstalledAtHpTapping_controller extends ChangeNotifier {
  TextEditingController entered_Sghead1 = TextEditingController();
  TextEditingController entered_Sghead2 = TextEditingController();
  TextEditingController entered_head1 = TextEditingController();
  TextEditingController entered_head2 = TextEditingController();
  closedInstalledAtHpTapping_model model = closedInstalledAtHpTapping_model();
  bool isresultsComplied = false;
  bool get validateSGhead1 => _validateSghead1Data();
  bool get validateSGhead2 => _validateSghead2Data();
  bool get validateHead1 => _validateHead1Data();
  bool get validateHead2 => _validateHead2Data();

  processresults() {
    if (validateSGhead1 && validateSGhead2 && validateHead1 && validateHead2) {
      model.calculate_lrv(double.tryParse(entered_Sghead1.text)!,
          double.tryParse(entered_head1.text)!);
      //calculate urv
      model.calculate_urv(
        double.tryParse(entered_Sghead1.text)!,
        double.tryParse(entered_Sghead2.text)!,
        double.tryParse(entered_head1.text)!,
        double.tryParse(entered_head2.text)!,
      );
      isresultsComplied = true;
    } else {
      isresultsComplied = false;
    }
    notifyListeners();
  }

  // validations for input text editing controllers
  bool _validateSghead1Data() {
    return entered_Sghead1.text.isNotEmpty &&
        double.tryParse(entered_Sghead1.text) != null;
  }

  bool _validateSghead2Data() {
    return entered_Sghead2.text.isNotEmpty &&
        double.tryParse(entered_Sghead2.text) != null;
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
