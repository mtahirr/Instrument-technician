import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/beta%20ratio%20Model/betaRatioModel.dart';

class betaRatioController extends ChangeNotifier {
  betaRatioModel model = betaRatioModel();
  TextEditingController entered_internalDiaOrficePlate =
      TextEditingController();
  TextEditingController entered_internalDiaOfPipe = TextEditingController();
  TextEditingController entered_BetaRation = TextEditingController();

  String SelectedFiltrationOption = "Select";
  bool isBetaRatioCompiled = false;
  bool isPipeInternalDiaCompiled = false;

  updatefilterationOption(updatedfilter) {
    SelectedFiltrationOption = updatedfilter;
    notifyListeners();
  }

  update_input_changed() {
    // update display for results everytime when input is changed

    if (SelectedFiltrationOption == "Beta ratio") {
      if (validateinternalDiaOfPip && validateinternalDiaOrficePlate) {
        model.calculatebetaRatio(
            double.tryParse(entered_internalDiaOrficePlate.text)!,
            double.tryParse(entered_internalDiaOfPipe.text)!);
        isBetaRatioCompiled = true;
      } else {
        isBetaRatioCompiled = false;
      }
    } else if (SelectedFiltrationOption == "Pipe internal dia") {
      if (validateinternalDiaOfPip && validateBetaRation) {
        model.calculatePipeInternalDia(
            double.tryParse(entered_internalDiaOfPipe.text)!,
            double.tryParse(entered_BetaRation.text)!);
        isPipeInternalDiaCompiled = true;
      } else {
        isPipeInternalDiaCompiled = false;
      }
    } else {
      isPipeInternalDiaCompiled = false;
      isBetaRatioCompiled = false;
    }
    notifyListeners();
  }

  bool get validateinternalDiaOrficePlate =>
      _validateinternalDiaOrficePlateData();
  bool get validateinternalDiaOfPip => _validateinternalDiaOfPipData();
  bool get validateBetaRation => _validateBetaRationData();

  bool _validateinternalDiaOrficePlateData() {
    return entered_internalDiaOrficePlate.text.isNotEmpty &&
        double.tryParse(entered_internalDiaOrficePlate.text) != null;
  }

  bool _validateinternalDiaOfPipData() {
    return entered_internalDiaOfPipe.text.isNotEmpty &&
        double.tryParse(entered_internalDiaOfPipe.text) != null;
  }

  bool _validateBetaRationData() {
    return entered_BetaRation.text.isNotEmpty &&
        double.tryParse(entered_BetaRation.text) != null;
  }
}
