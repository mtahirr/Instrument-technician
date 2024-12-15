import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/Conversion%20Models/temperatureConverisonModel.dart';

class temperatureConverisonController extends ChangeNotifier {
  temperatureConverisonModel model = temperatureConverisonModel();
  TextEditingController enteredInput = TextEditingController();
  String SelectedFrom = "c";
  List<String> customizedShowableListToSelect = [
    "f",
    "k",
    "rak",
  ];
  List<String> processResultsFor = [];
  List<String> selectedFromCatagory = [
    "c",
    "f",
    "k",
    "rak",
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
      if (SelectedFrom == "c") {
        model.processFromC(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "f") {
        model.processFromF(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "k") {
        model.processFromk(
          double.parse(enteredInput.text.toString()),
        );
      } else if (SelectedFrom == "rak") {
        model.processFromRak(
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
