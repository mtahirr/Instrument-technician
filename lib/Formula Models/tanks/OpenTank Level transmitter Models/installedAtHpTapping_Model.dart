class installedAtHpTapping_Model {
  double Current_Calculated_lrv = 0.0;
  double Current_Calculated_Urv = double.nan;

  double calculate_urv(double sg, double head) {
    Current_Calculated_Urv = sg * head;
    return Current_Calculated_Urv;
  }
}
