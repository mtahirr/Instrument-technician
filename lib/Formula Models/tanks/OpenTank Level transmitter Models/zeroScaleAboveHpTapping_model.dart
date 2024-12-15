class zeroScaleAboveHpTapping_model {
  double Current_Calculated_lrv = double.nan;
  double Current_Calculated_Urv = double.nan;

  double calculate_urv(double sg, double head2) {
    Current_Calculated_Urv = sg * head2;
    return Current_Calculated_Urv;
  }

  double calculate_lrv(double sg, double head1) {
    Current_Calculated_lrv = sg * head1;
    return Current_Calculated_lrv;
  }
}
