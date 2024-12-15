import 'package:flutter/material.dart';

import '../../Formula Models/Conversion Models/PressureConversionModel.dart';

class PressureConverisonController extends ChangeNotifier {
  PressureConversionModel model = PressureConversionModel();
  TextEditingController enteredInput = TextEditingController();

  String SelectedFrom = "PSI";
  List<String> customizedShowableListToSelect = [
    "Kpa",
    "Mpa",
    "Bar",
    "kgf/cm2",
    "mm/hg",
    "mm/h2O",
    "in/Hg",
    "In/h2O",
  ];
  List<String> processResultsFor = [];
  List<String> selectedFromCatagory = [
    "PSI",
    "Kpa",
    "Mpa",
    "Bar",
    "kgf/cm2",
    "mm/hg",
    "mm/h2O",
    "in/Hg",
    "In/h2O",
  ];

  bool get validateEnteredData => _validateEnteredData();
  finalizedList(List<String> value) {
    processResultsFor = value;
    notifyListeners();
  }

  Future updateSelectedinputCatagory(String newValue) async {
    processResultsFor.clear();
    SelectedFrom = newValue;
    List<String> templist = [];
    templist.addAll(selectedFromCatagory);
    int indexToRemove = templist.indexOf(newValue);
    templist.removeAt(indexToRemove);
    customizedShowableListToSelect = templist;
    print('selected default list : $selectedFromCatagory');
    print(
        'String removed successfully here is new list : $customizedShowableListToSelect');

    notifyListeners();
  }

  processreuslts() {
    if (processResultsFor.isNotEmpty && validateEnteredData) {
      if (SelectedFrom == "PSI") {
        model.processFromPsi(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "Kpa") {
        model.processFromKPA(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "Mpa") {
        model.processFromMpa(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "Bar") {
        model.processFromBar(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "kgf/cm2") {
        model.processFromkgfcm2(double.parse(enteredInput.text.toString()));
      } else if (SelectedFrom == "mm/hg") {
        model.processFromMmhg(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "mm/h2O") {
        model.processFromMmh20(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "in/Hg") {
        model.processFrominHg(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "In/h2O") {
        model.processFromInh2O(
          double.parse(enteredInput.text.toString()),
        );
      }
    }

    notifyListeners();
  }

  bool _validateEnteredData() {
    return enteredInput.text.isNotEmpty &&
        double.tryParse(enteredInput.text) != null;
  }
}
