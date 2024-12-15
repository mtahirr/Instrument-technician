import 'package:flutter/material.dart';

class AppMainMenuController extends ChangeNotifier {
  TextEditingController seacrhBarController = TextEditingController();
  List<String> filteredSuggestions = [];

  List<String> Suggestions = [
    "Themocouple Calculation",
    "Pv to Ma",
    "Ma Error and Deviation",
    "Closed Tank level transmiter installed at Hp tapping point",
    "Closed Tank level transmiter installed bellow Hp tapping point",
    "Closed Tank level transmiter zero scale above Hp tapping point",
    "Open Tank level transmiter zero scale above Hp tapping point",
    "Open Tank level transmiter installed at Hp tapping point",
    "Open Tank level transmiter installed bellow Hp tapping point",
    "Icap",
    "Calibration",
    "√ma to √linear",
    "√linear to √ma"
  ];
  ontapToSuggested(String selectedValue, BuildContext context) {
    print("method on tabbed suggested is called in controller class");
    seacrhBarController.clear();
    filteredSuggestions.clear();
    notifyListeners();
    if (selectedValue == "Calibration") {
      Navigator.pushNamed(context, '/ErrorPercentage');
    } else if (selectedValue == "Pv to Ma") {
      Navigator.pushNamed(context, '/PvToMa');
    } else if (selectedValue == "Ma Error and Deviation") {
      Navigator.pushNamed(context, '/MaErrorAndDeviation');
    } else if (selectedValue == "Themocouple Calculation") {
      Navigator.pushNamed(context, '/thermoCoupleCalculation');
    } else if (selectedValue == "Icap") {
      Navigator.pushNamed(context, '/icap');
    } else if (selectedValue == "√linear to √ma") {
      Navigator.pushNamed(context, '/maLinearTosqrtMa');
    } else if (selectedValue == "√ma to √linear") {
      Navigator.pushNamed(context, '/sqrtMaToLinearMa');
    } else if (selectedValue == "") {
      Navigator.pushNamed(context, '/maLinearTosqrtMa');
    } else if (selectedValue == "") {
      Navigator.pushNamed(context, '/maLinearTosqrtMa');
    } else if (selectedValue ==
        "Open Tank level transmiter installed at Hp tapping point") {
      Navigator.pushNamed(context, '/installedAtHpTapping_view');
    } else if (selectedValue ==
        "Open Tank level transmiter zero scale above Hp tapping point") {
      Navigator.pushNamed(context, '/zeroScaleAboveHpTapping_View');
    } else if (selectedValue ==
        "Open Tank level transmiter installed bellow Hp tapping point") {
      Navigator.pushNamed(context, '/installedBellowHpTapping_View');
    } else if (selectedValue ==
        "Closed Tank level transmiter installed at Hp tapping point") {
      Navigator.pushNamed(context, '/ClosedInstalledAtHpTapping_View');
    } else if (selectedValue ==
        "Closed Tank level transmiter zero scale above Hp tapping point") {
      Navigator.pushNamed(context, '/closedzeroScaleAboveHpTapping');
    } else if (selectedValue ==
        "Closed Tank level transmiter installed bellow Hp tapping point") {
      Navigator.pushNamed(context, '/closedInstalledBellowHpTapping_View');
    }
  }

  clearSearchBarControllerText() {
    seacrhBarController.clear();
    filteredSuggestions.clear();
    notifyListeners();
  }

  onSeacrhBarChanged(String value) {
    if (value.isNotEmpty) {
      filteredSuggestions = Suggestions.where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else if (value.isEmpty) {
      print("value is empty ");
      filteredSuggestions.clear();
    }

    notifyListeners();
  }
}
