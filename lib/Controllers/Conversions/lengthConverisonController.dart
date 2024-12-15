import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/Conversion%20Models/lengthConversionModel.dart';

class lengthConverisonController extends ChangeNotifier {
  lengthConversionModel model = lengthConversionModel();
  TextEditingController enteredInput = TextEditingController();
  String SelectedFrom = "inches";
  List<String> customizedShowableListToSelect = [
    "mm",
    "cm",
    "feet",
    "m",
    "yard",
  ];
  List<String> processResultsFor = [];
  List<String> selectedFromCatagory = [
    "inches",
    "mm",
    "cm",
    "feet",
    "m",
    "yard",
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
      if (SelectedFrom == "inches") {
        model.processFromInches(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "mm") {
        model.processFromMm(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "cm") {
        model.processFromCm(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "feet") {
        model.processFromFeet(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "m") {
        model.processFromM(double.parse(enteredInput.text.toString()));
      } else if (SelectedFrom == "yard") {
        model.processFromYard(
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
