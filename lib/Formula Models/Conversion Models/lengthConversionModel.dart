class lengthConversionModel {
  Map<String, double> fromInches = {};
  Map<String, double> fromMm = {};
  Map<String, double> fromCm = {};
  Map<String, double> fromFeet = {};
  Map<String, double> fromM = {};
  Map<String, double> fromYard = {};

  processFromInches(
    double input,
  ) {
    //all the calculation for psi as an input
    fromInches.addAll({
      "mm": 25.4 * input,
      "cm": 2.54 * input,
      "feet": input / 12,
      "m": input / 39.37,
      "yard": input / 36,
    });
  }

  processFromMm(
    double input,
  ) {
    //all the calculation for psi as an input
    fromMm.addAll({
      "inches": input / 25.4,
      "cm": input / 10,
      "feet": input / 304.8,
      "m": input / 1000,
      "yard": input / 914.4,
    });
  }

  processFromCm(
    double input,
  ) {
    //all the calculation for psi as an input
    fromCm.addAll({
      "inches": input / 2.54,
      "mm": input * 10,
      "feet": input / 30.48,
      "m": input / 100,
      "yard": input / 91.44,
    });
  }

  processFromFeet(
    double input,
  ) {
    //all the calculation for psi as an input
    fromFeet.addAll({
      "inches": input * 12,
      "mm": input * 304.8,
      "cm": input * 30.48,
      "m": input / 3.281,
      "yard": input / 3,
    });
  }

  processFromM(
    double input,
  ) {
    //all the calculation for psi as an input
    fromM.addAll({
      "inches": input * 39.37,
      "mm": input * 1000,
      "cm": input * 100,
      "feet": input * 3.281,
      "yard": input * 1.094,
    });
  }

  processFromYard(
    double input,
  ) {
    //all the calculation for psi as an input
    fromYard.addAll({
      "inches": input * 36,
      "mm": input * 914.4,
      "cm": input * 91.44,
      "feet": input * 3,
      "m": input / 1.094,
    });
  }
}
