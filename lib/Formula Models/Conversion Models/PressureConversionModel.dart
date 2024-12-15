class PressureConversionModel {
  Map<String, double> fromPsi = {};
  Map<String, double> fromKpa = {};
  Map<String, double> fromMpa = {};
  Map<String, double> fromBar = {};
  Map<String, double> fromkgfcm2 = {};
  Map<String, double> fromMmhg = {};
  Map<String, double> fromMmh2O = {};
  Map<String, double> frominHg = {};
  Map<String, double> fromInh2O = {};

  processFromPsi(
    double input,
  ) {
    //all the calculation for psi as an input
    fromPsi.addAll({
      "Kpa": 6.895 * input,
      "Mpa": 0.0069 * input,
      "Bar": 0.068 * input,
      "kgf/cm2": 0.0703 * input,
      "mm/hg": 51.75 * input,
      "mm/h2O": 703.1 * input,
      "in/Hg": 2.036 * input,
      "In/h2O": 27.71 * input,
    });
  }

  processFromKPA(
    double input,
  ) {
    //all the calculation for psi as an input
    fromKpa.addAll({
      "PSI": input / 6.895,
      "Mpa": input / 1000,
      "Bar": input / 100,
      "kgf/cm2": input / 98.066,
      "mm/hg": 7.501 * input,
      "mm/h2O": 101.97442889221 * input,
      "in/Hg": input / 3.386,
      "In/h2O": 4.019 * input,
    });
  }

  processFromMpa(
    double input,
  ) {
    //all the calculation for psi as an input
    fromMpa.addAll({
      "PSI": input * 145,
      "Kpa": input * 1000,
      "Bar": input * 10,
      "kgf/cm2": input * 10.197,
      "mm/hg": 7501 * input,
      "mm/h2O": 101971.62 * input,
      "in/Hg": input * 295.3,
      "In/h2O": 4019 * input,
    });
  }

  processFromBar(
    double input,
  ) {
    //all the calculation for psi as an input
    fromBar.addAll({
      "PSI": input * 14.504,
      "Kpa": input * 100,
      "Mpa": input / 10,
      "kgf/cm2": input * 1.02,
      "mm/hg": 750.1 * input,
      "mm/h2O": 10197.16 * input,
      "in/Hg": input * 29.53,
      "In/h2O": 401.85980718766 * input,
    });
  }

  processFromkgfcm2(
    double input,
  ) {
    //all the calculation for psi as an input
    fromkgfcm2.addAll({
      "PSI": input * 14.223,
      "Kpa": input * 98.066,
      "Mpa": input / 10.197,
      "Bar": input * 0.980665,
      "mm/hg": 735.6 * input,
      "mm/h2O": 10000 * input,
      "in/Hg": input * 28.959,
      "In/h2O": 394.1 * input,
    });
  }

  processFromMmhg(
    double input,
  ) {
    //all the calculation for psi as an input
    fromMmhg.addAll({
      "PSI": input / 51.715,
      "Kpa": input / 7.501,
      "Mpa": input / 7501,
      "Bar": input / 750.1,
      "kgf/cm2": input / 735.6,
      "mm/h2O": 13.5951 * input,
      "in/Hg": input / 25.4,
      "In/h2O": input / 1.866,
    });
  }

  processFromMmh20(
    double input,
  ) {
    //all the calculation for psi as an input
    fromMmh2O.addAll({
      "PSI": input * 0.0014222951705162,
      "Kpa": input * 0.00980665,
      "Mpa": input * 0.00000980665,
      "Bar": input / 10197.162129779,
      "kgf/cm2": input * 0.0001,
      "mm/hg": 0.0735559 * input,
      "in/Hg": input * 0.0028959020848759,
      "In/h2O": input * 0.03937,
    });
  }

  processFrominHg(
    double input,
  ) {
    //all the calculation for psi as an input
    frominHg.addAll({
      "PSI": input / 2.036,
      "Kpa": input * 3.386,
      "Mpa": input / 295.3,
      "Bar": input / 29.53,
      "kgf/cm2": input / 28.959,
      "mm/h2O": 345.315454545455 * input,
      "mm/hg": input * 25.4,
      "In/h2O": input * 13.609,
    });
  }

  processFromInh2O(
    double input,
  ) {
    //all the calculation for psi as an input
    fromInh2O.addAll({
      "PSI": input / 27.708,
      "Kpa": input * 4.019,
      "Mpa": input / 4019,
      "Bar": input / 401.9,
      "kgf/cm2": input / 394.1,
      "mm/h2O": 25.375622808824 * input,
      "mm/hg": input * 1.866,
      "In/h2O": input / 13.609,
    });
  }
}
