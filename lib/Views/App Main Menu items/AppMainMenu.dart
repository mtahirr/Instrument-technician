import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instrumentationapp/Views/App%20Main%20Menu%20items/AppMainMenuController.dart';
import 'package:instrumentationapp/Views/App%20Main%20Menu%20items/AppMainMenuItems.dart';
import 'package:provider/provider.dart';

class AppMainMenu extends StatelessWidget {
  const AppMainMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    AppMainMenuController appMainMenuController = 
    Provider.of<AppMainMenuController>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height / 3.3,
              width: size.width,
              decoration: const BoxDecoration(color: Color.fromARGB(255, 6, 45, 39)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dashboardTextwithIcon(),
                  DashboardQuickOptions(context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Theme(
                  data: ThemeData(
                    // Set the border color to transparent
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    leading: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 6, 45, 39)),
                    ),
                    backgroundColor: Colors.transparent,
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    title: const Text(
                      'Temperature Conversions',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/CandOhmConversion_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'RTD Pt-100-0.385',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/thermoCoupleCalculation');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Themocouple Calculation',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/temperatureConverison_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          '°C, °F, °K, °R',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    const  SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Theme(
                  data: ThemeData(
                    // Set the border color to transparent
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    leading: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 6, 45, 39)),
                    ),
                    backgroundColor: Colors.transparent,
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    title: const Text(
                      'Pressure Conversions',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/PressureConverison_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Pressure Converison',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Theme(
                  data: ThemeData(
                    // Set the border color to transparent
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    leading: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 6, 45, 39)),
                    ),
                    backgroundColor: Colors.transparent,
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    title: const Text(
                      'Flow',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    children: [
                    const  SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/betaRatio_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Beta Ratio',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Theme(
                  data: ThemeData(
                    // Set the border color to transparent
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    leading: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 6, 45, 39)),
                    ),
                    backgroundColor: Colors.transparent,
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    title: const Text(
                      'Length Conversions',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    children: [
                    const  SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/lengthConverison_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Length Converison',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const  SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Theme(
                  data: ThemeData(
                    // Set the border color to transparent
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    leading: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 6, 45, 39)),
                    ),
                    backgroundColor: Colors.transparent,
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    title: const Text(
                      'Other Conversions',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    children: [
                     const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/MaErrorAndDeviation');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Ma Error and Deviation',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/sqrtMaToLinearMa');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          '√ma to linear',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/maLinearTosqrtMa');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'linear to √ma',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Level Measurement',
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Theme(
                  data: ThemeData(
                    // Set the border color to transparent
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    backgroundColor: Colors.transparent,
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    subtitle: const Text(
                      '3 types',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    title: const Text(
                      'Open Tanks',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/installedAtHpTapping_view');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Installed at Hp tapping point',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/zeroScaleAboveHpTapping_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Zero scale above Hp tapping point',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    const  SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/installedBellowHpTapping_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Installed bellow Hp tapping point',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(0),
                child: Theme(
                  data: ThemeData(
                    // Set the border color to transparent
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    backgroundColor: Colors.transparent,
                    childrenPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    subtitle: const Text(
                      '3 types',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    title: const Text(
                      'Closed Tanks',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/ClosedInstalledAtHpTapping_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Installed at Hp tapping point',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    const  SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/closedzeroScaleAboveHpTapping');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Zero scale above Hp tapping point',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    const  SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/closedInstalledBellowHpTapping_View');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        tileColor: Colors.grey.withOpacity(.3),
                        leading: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 6, 45, 39)),
                        ),
                        title: const Text(
                          'Installed bellow Hp tapping point',
                          style: TextStyle(
                              fontFamily: 'montserrat',
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//  if (appMainMenuController.filteredSuggestions.isNotEmpty)
//             Positioned(
//               top: size.height / 3,
//               right: 0,
//               left: 0,
//               child: Container(
//                 constraints: BoxConstraints(
//                   maxHeight: 350, // Set the maximum height here
//                 ),
//                 margin: EdgeInsets.symmetric(horizontal: 6),
//                 width: size.width,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.black.withOpacity(.9)),
//                 child: ListView(
//                   shrinkWrap: true,
//                   children: appMainMenuController.filteredSuggestions.map((e) {
//                     return ListTile(
//                       title: Text(
//                         e,
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       onTap: () {
//                         print(" here is the value of index");

//                         appMainMenuController.ontapToSuggested(e, context);
//                         //navigate to the other screen
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//             )