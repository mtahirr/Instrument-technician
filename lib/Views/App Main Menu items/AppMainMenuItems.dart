import 'package:flutter/material.dart';

Widget dashboardTextwithIcon() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.dashboard_rounded,
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Dashboard",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: "Trajan Pro"),
        )
      ],
    ),
  );
}

Widget DashboardQuickOptions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/icap');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[500]!.withOpacity(.5)),
          child: Text(
            "ICAP",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Trajan Pro"),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/ErrorPercentage');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[500]!.withOpacity(.5)),
          child: Text(
            "Calibration",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Trajan Pro"),
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/PvToMa');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[500]!.withOpacity(.5)),
          child: Text(
            "Process (Pv,%,Ma)",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Trajan Pro"),
          ),
        ),
      ),
    ],
  );
}

// fiveOptions(BuildContext context) {
//   return Column(
//     children: [
//       GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(context, '/thermoCoupleCalculation');
//         },
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
//             child: Row(
//               children: [
//                 Container(
//                   height: 30,
//                   padding: const EdgeInsets.all(9),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color.fromARGB(255, 6, 45, 39)),
//                   child: Container(
//                     height: 10,
//                     width: 10,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 const Text(
//                   'Themocouple Calculation',
//                   style: TextStyle(
//                       fontFamily: 'montserrat',
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(context, '/MaErrorAndDeviation');
//         },
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
//             child: Row(
//               children: [
//                 Container(
//                   height: 30,
//                   padding: const EdgeInsets.all(9),
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color.fromARGB(255, 6, 45, 39)),
//                   child: Container(
//                     height: 10,
//                     width: 10,
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 const Text(
//                   'Ma Error and Deviation',
//                   style: TextStyle(
//                       fontFamily: 'montserrat',
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(context, '/sqrtMaToLinearMa');
//         },
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
//             child: Row(
//               children: [
//                 Container(
//                   height: 30,
//                   padding: const EdgeInsets.all(9),
//                   decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color.fromARGB(255, 6, 45, 39)),
//                   child: Container(
//                     height: 10,
//                     width: 10,
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 const Text(
//                   '√ma To √linear',
//                   style: TextStyle(
//                       fontFamily: 'montserrat',
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(context, '/maLinearTosqrtMa');
//         },
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
//             child: Row(
//               children: [
//                 Container(
//                   height: 30,
//                   padding: const EdgeInsets.all(9),
//                   decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color.fromARGB(255, 6, 45, 39)),
//                   child: Container(
//                     height: 10,
//                     width: 10,
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 const Text(
//                   '√linear to √ma',
//                   style: TextStyle(
//                       fontFamily: 'montserrat',
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       GestureDetector(
//         onTap: () {
//           Navigator.pushNamed(context, '/betaRatio_View');
//         },
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
//             child: Row(
//               children: [
//                 Container(
//                   height: 30,
//                   padding: const EdgeInsets.all(9),
//                   decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Color.fromARGB(255, 6, 45, 39)),
//                   child: Container(
//                     height: 10,
//                     width: 10,
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 const Text(
//                   'Beta Ratio',
//                   style: TextStyle(
//                       fontFamily: 'montserrat',
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       )
//     ],
//   );
// }

//√ma to √linear
//√linear to √ma,