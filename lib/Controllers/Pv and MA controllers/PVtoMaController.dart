import 'package:flutter/material.dart';

import '../../Formula Models/PV and Ma Models/PvToMaModel.dart';

class PvtoMaController extends ChangeNotifier {
  PvToMaModel model = PvToMaModel();
  String SelectedFiltrationOption = "Select";
  bool enforceVisibleSpan = false;
  TextEditingController entered_URV = TextEditingController();
  TextEditingController entered_LRV = TextEditingController();
  TextEditingController entered_MA = TextEditingController();
  TextEditingController entered_PV = TextEditingController();
  TextEditingController entered_Perc = TextEditingController();

  bool isMaToPvComplied = false;
  bool isPvToMaComplied = false;
  bool isSpanComplied = false;
  bool isPvToPercComplied = false;
  bool isPercToPvComplied = false;
  bool isMaToPercComplied = false;
  bool isPercToMaComplied = false;

  bool get validateLRV => _validateLrvData();
  bool get validateURV => _validateUrvData();
  bool get validateMA => _validateMAData();
  bool get validatePV => _validatePVData();
  bool get validatePerc => _validatePercData();

  updatefilterationOption(updatedfilter) {
    SelectedFiltrationOption = updatedfilter;
    enforceVisibleSpan = false;
    notifyListeners();
  }

  updateSpanVisibility() {
    enforceVisibleSpan = !enforceVisibleSpan;
    notifyListeners();
  }

  update_input_changed() {
    // update display for results everytime when input is changed

    if (validateLRV && validateURV) {
      model.calculate_span(double.tryParse(entered_LRV.text)!,
          double.tryParse(entered_URV.text)!);
      isSpanComplied = true;
    } else {
      isPvToMaComplied = false;
      isSpanComplied = false;
      isPvToPercComplied = false;
      isPercToPvComplied = false;
      isMaToPvComplied = false;
    }
    if (SelectedFiltrationOption == "Span") {
      //update the value of span Span usecase
      model.calculate_span(double.tryParse(entered_LRV.text)!,
          double.tryParse(entered_URV.text)!);
      isSpanComplied = true;
    } else if (SelectedFiltrationOption == "Ma to Pv") {
      //update the value of span for MA to PV usecase
      if (validateMA) {
        model.calculate_MaToPv(
            model.current_calculated_span_value,
            double.tryParse(entered_MA.text)!,
            double.tryParse(entered_LRV.text)!);

        isMaToPvComplied = true;
      } else {
        isMaToPvComplied = false;
      }
    } else if (SelectedFiltrationOption == "Pv to Ma") {
      //update the value of span for  PV to MA usecase
      if (validatePV) {
        //
        model.calculate_PvToMa(
            model.current_calculated_span_value,
            double.tryParse(entered_PV.text)!,
            double.tryParse(entered_LRV.text)!);

        model.calculate_PvToPercentage(
            model.current_calculated_span_value,
            double.tryParse(entered_PV.text)!,
            double.tryParse(entered_LRV.text)!);
        isPvToPercComplied = true;

        isPvToMaComplied = true;
      } else {
        isPvToMaComplied = false;
        isPvToPercComplied = false;
      }
    } else if (SelectedFiltrationOption == "Pv to %") {
      if (validatePV) {
        //update the value of  Pv to % usecase
        model.calculate_PvToPercentage(
            model.current_calculated_span_value,
            double.tryParse(entered_PV.text)!,
            double.tryParse(entered_LRV.text)!);

        //update the value of  Pv to Ma aswell to preload data

        model.calculate_PvToMa(
            model.current_calculated_span_value,
            double.tryParse(entered_PV.text)!,
            double.tryParse(entered_LRV.text)!);
        isPvToMaComplied = true;

        //update the value of span for  Pv to %usecase

        isPvToPercComplied = true;
      } else {
        isPvToMaComplied = false;
        isPvToPercComplied = false;
      }
    } else if (SelectedFiltrationOption == "% to Pv") {
      //update the value of span for  Pv to %usecase
      if (validatePerc) {
        model.calculate_PercentageToPv(
            model.current_calculated_span_value,
            double.tryParse(entered_Perc.text)!,
            double.tryParse(entered_LRV.text)!);
        isPercToPvComplied = true;
      } else {
        isPercToPvComplied = false;
      }
    } else if (SelectedFiltrationOption == "Ma to %") {
      if (validateMA) {
        model.calculate_MaToPercentage(
          double.tryParse(entered_MA.text)!,
        );
        isMaToPercComplied = true;
      } else {
        isMaToPercComplied = false;
      }
    } else if (SelectedFiltrationOption == "% to Ma") {
      if (validatePerc) {
        model.calculate_PercentageToMa(
          double.tryParse(entered_Perc.text)!,
        );
        isPercToMaComplied = true;
      } else {
        isPercToMaComplied = false;
      }
    } else {
      //set default select
      isPvToMaComplied = false;
      isSpanComplied = false;
      isPvToPercComplied = false;
      isPercToPvComplied = false;
      isMaToPvComplied = false;
      isMaToPercComplied = false;
      isPercToMaComplied = false;
      entered_LRV.clear();
      entered_URV.clear();
      entered_PV.clear();
      entered_Perc.clear();
      entered_MA.clear();
    }

    notifyListeners();
  }

  //validate text form fields

  bool _validateLrvData() {
    return entered_LRV.text.isNotEmpty &&
        double.tryParse(entered_LRV.text) != null;
  }

  bool _validateUrvData() {
    return entered_URV.text.isNotEmpty &&
        double.tryParse(entered_URV.text) != null;
  }

  bool _validateMAData() {
    return entered_MA.text.isNotEmpty &&
        double.tryParse(entered_MA.text) != null;
  }

  bool _validatePVData() {
    return entered_PV.text.isNotEmpty &&
        double.tryParse(entered_PV.text) != null;
  }

  bool _validatePercData() {
    return entered_Perc.text.isNotEmpty &&
        double.tryParse(entered_Perc.text) != null;
  }
}
