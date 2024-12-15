import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/tanks/Closed%20Tank%20Level%20transmitter%20Models/closedZeroScaleAboveTapping_model.dart';

class closedzeroScaleAboveHpTapping_controller extends ChangeNotifier {
  TextEditingController entered_SgWetLeg = TextEditingController();
  TextEditingController entered_Sgtank = TextEditingController();
  TextEditingController entered_head1 = TextEditingController();
  TextEditingController entered_head2 = TextEditingController();
  TextEditingController entered_head3 = TextEditingController();
  closedZeroScaleAboveTapping_model model = closedZeroScaleAboveTapping_model();
  bool isresultsComplied = false;
  bool get validateSgWetLeg => _validateSgWetLegData();
  bool get validateSgtank => _validateSgtankData();
  bool get validateHead1 => _validateHead1Data();
  bool get validateHead2 => _validateHead2Data();
  bool get validateHead3 => _validateHead3Data();

  processresults() {
    if (validateSgWetLeg &&
        validateSgtank &&
        validateHead1 &&
        validateHead2 &&
        validateHead3) {
      model.calculate_lrv(
        double.tryParse(entered_Sgtank.text)!,
        double.tryParse(entered_SgWetLeg.text)!,
        double.tryParse(entered_head1.text)!,
        double.tryParse(entered_head2.text)!,
      );
      //calculate urv
      model.calculate_urv(
        double.tryParse(entered_Sgtank.text)!,
        double.tryParse(entered_SgWetLeg.text)!,
        double.tryParse(entered_head1.text)!,
        double.tryParse(entered_head2.text)!,
        double.tryParse(entered_head3.text)!,
      );
      isresultsComplied = true;
    } else {
      isresultsComplied = false;
    }
    notifyListeners();
  }

  // validations for input text editing controllers
  bool _validateSgWetLegData() {
    return entered_SgWetLeg.text.isNotEmpty &&
        double.tryParse(entered_SgWetLeg.text) != null;
  }

  bool _validateSgtankData() {
    return entered_Sgtank.text.isNotEmpty &&
        double.tryParse(entered_Sgtank.text) != null;
  }

  bool _validateHead1Data() {
    return entered_head1.text.isNotEmpty &&
        double.tryParse(entered_head1.text) != null;
  }

  bool _validateHead2Data() {
    return entered_head2.text.isNotEmpty &&
        double.tryParse(entered_head2.text) != null;
  }

  bool _validateHead3Data() {
    return entered_head3.text.isNotEmpty &&
        double.tryParse(entered_head3.text) != null;
  }
}
