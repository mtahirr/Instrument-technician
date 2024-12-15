import 'package:flutter/material.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalAppBar.dart';

class PvAndMaMainMenu extends StatelessWidget {
  const PvAndMaMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar("Select", context, () {}),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ErrorPercentage');
                // Perform calculation and display results
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Calibration',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/PvToMa');
                // Perform calculation and display results
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'PV to MA',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/MaErrorAndDeviation');
                // Perform calculation and display results
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'MA Error & Deviation',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/thermoCoupleCalculation');
                // Perform calculation and display results
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Thermocouple Calculation',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/icap');
                // Perform calculation and display results
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'ICAP',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/maLinearTosqrtMa');
                // Perform calculation and display results
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Ma Linear to Sqrt Ma',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sqrtMaToLinearMa');
                // Perform calculation and display results
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Sqrt Ma to Linear Ma ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Tanks',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Trajan Pro"),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: MediaQuery.of(context).size.height / 4,
              child: GridView(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    childAspectRatio: .39,
                    crossAxisCount: 2,
                  ),
                  children: [
                    'Open tank : level transmiter \nInstalled At Hp Tapping',
                    'Open tank : level transmiter \nZero Scale Above Hp Tapping',
                    'Open tank : level transmiter \nInstalled Bellow Hp Tapping',
                    'Closed tank : level transmiter \nClosed Installed At Hp Tapping',
                    'Closed tank : level transmiter \nClosed zero Scale Above Hp Tapping',
                    'Closed tank : level transmiter \nClosed Installed Bellow Hp Tapping'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: ElevatedButton(
                        onPressed: () {
                          if (value ==
                              "Open tank : level transmiter \nInstalled At Hp Tapping") {
                            Navigator.pushNamed(
                                context, '/installedAtHpTapping_view');
                          } else if (value ==
                              "Open tank : level transmiter \nZero Scale Above Hp Tapping") {
                            Navigator.pushNamed(
                                context, '/zeroScaleAboveHpTapping_View');
                          } else if (value ==
                              "Open tank : level transmiter \nInstalled Bellow Hp Tapping") {
                            Navigator.pushNamed(
                                context, '/installedBellowHpTapping_View');
                          } else if (value ==
                              "Closed tank : level transmiter \nClosed Installed At Hp Tapping") {
                            Navigator.pushNamed(
                                context, '/ClosedInstalledAtHpTapping_View');
                          } else if (value ==
                              'Closed tank : level transmiter \nClosed zero Scale Above Hp Tapping') {
                            Navigator.pushNamed(
                                context, '/closedzeroScaleAboveHpTapping');
                          } else if (value ==
                              "Closed tank : level transmiter \nClosed Installed Bellow Hp Tapping") {
                            Navigator.pushNamed(context,
                                '/closedInstalledBellowHpTapping_View');
                          }
                          // Perform calculation and display results
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 2.0),
                          child: Text(
                            value,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontFamily: "Trajan Pro"),
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
