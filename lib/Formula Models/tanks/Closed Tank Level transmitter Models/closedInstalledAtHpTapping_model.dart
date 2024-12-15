class closedInstalledAtHpTapping_model {
  double Current_Calculated_lrv = double.nan;
  double Current_Calculated_Urv = double.nan;

  double calculate_urv(
      double sgHead1, double sgHead2, double head1, double head2) {
    Current_Calculated_Urv = (sgHead2 * head2) - (sgHead1 * head1);
    return Current_Calculated_Urv;
  }

  double calculate_lrv(double Sghead1, double head1) {
    Current_Calculated_lrv = 0 - (Sghead1 * head1);
    return Current_Calculated_lrv;
  }
}
