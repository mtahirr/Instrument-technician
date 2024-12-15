class temperatureConverisonModel {
  Map<String, double> fromC = {};
  Map<String, double> fromF = {};
  Map<String, double> fromK = {};
  Map<String, double> fromRak = {};

  processFromC(
    double input,
  ) {
    fromC.addAll({
      "f": ((input * 9) / 5) + 32,
      "k": input + 273.15,
      "rak": ((input * 9) / 5) + 491.67,
    });
  }

  processFromF(
    double input,
  ) {
    fromF.addAll({
      "c": ((input - 32) * 5) / 9,
      "k": (((input - 32) * 5) / 9) + 273.15,
      "rak": input + 459.67,
    });
  }

  processFromk(
    double input,
  ) {
    fromK.addAll({
      "c": input - 273.15,
      "f": (((input - 273.15) * 9) / 5) + 32,
      "rak": input * 1.8,
    });
  }

  processFromRak(
    double input,
  ) {
    fromRak.addAll({
      "c": (input - 491.67) * 5 / 9,
      "f": input - 459.67,
      "k": (input * 5) / 9,
    });
  }
}
