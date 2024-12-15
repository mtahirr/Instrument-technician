import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/Beta%20ratio%20controllers/betaRatioController.dart';
import 'package:instrumentationapp/Controllers/Conversions/PressureConversionController.dart';
import 'package:instrumentationapp/Controllers/Conversions/lengthConverisonController.dart';
import 'package:instrumentationapp/Controllers/Conversions/temperatureConverisonController.dart';
import 'package:instrumentationapp/Controllers/Pv%20and%20MA%20controllers/MaErrorAndDeciationController.dart';
import 'package:instrumentationapp/Controllers/Pv%20and%20MA%20controllers/themocoupleController.dart';
import 'package:instrumentationapp/Controllers/error%20percentage%20controller/errorPercentageController.dart';
import 'package:instrumentationapp/Controllers/sqrt%20controllers/MaLinearToSqrtMa_Controller.dart';
import 'package:instrumentationapp/Controllers/sqrt%20controllers/maSqrtToLinearMa_Controller.dart';
import 'package:instrumentationapp/Controllers/tanks/Closed%20tank%20Controllers/ClosedInstalledAtHpTapping_controller.dart';
import 'package:instrumentationapp/Controllers/tanks/Closed%20tank%20Controllers/closedInstalledBellowHpTapping_controller.dart';
import 'package:instrumentationapp/Controllers/tanks/Closed%20tank%20Controllers/closedzeroScaleAboveHpTapping_controller.dart';
import 'package:instrumentationapp/Controllers/tanks/Open%20tank%20Controllers/installedAtHpTapping_controller.dart';
import 'package:instrumentationapp/Controllers/tanks/Open%20tank%20Controllers/installedBellowHpTapping_controller.dart';
import 'package:instrumentationapp/Controllers/tanks/Open%20tank%20Controllers/zeroScaleAboveHpTapping_controller.dart';
import 'package:instrumentationapp/Views/App%20Main%20Menu%20items/AppMainMenuController.dart';
import 'package:instrumentationapp/Views/Beta%20Ratio/betaRatioView.dart';
import 'package:instrumentationapp/Views/Closed%20tanks/ClosedInstalledAtHpTapping_view.dart';
import 'package:instrumentationapp/Views/Closed%20tanks/closedInstalledBellowHpTapping_view.dart';
import 'package:instrumentationapp/Views/Closed%20tanks/closedzeroScaleAboveHpTapping_view.dart';
import 'package:instrumentationapp/Views/Converion%20Views/lengthConverisonView.dart';
import 'package:instrumentationapp/Views/Converion%20Views/pressureConverisonView.dart';
import 'package:instrumentationapp/Views/Converion%20Views/temperatureConverison.dart';
import 'package:instrumentationapp/Views/Open%20tank%20views/installedAtHpTapping_view.dart';
import 'package:instrumentationapp/Views/Open%20tank%20views/installedBellowHpTapping_view.dart';
import 'package:instrumentationapp/Views/Open%20tank%20views/zeroScaleAboveHpTapping_view.dart';
import 'package:instrumentationapp/Views/Pv%20and%20Ma%20Views/Ma%20error%20and%20deviation/MaErrorAndDeviation.dart';
import 'package:instrumentationapp/Views/Pv%20and%20Ma%20Views/PvAndMaMainMenu.dart';
import 'package:instrumentationapp/Views/Pv%20and%20Ma%20Views/Pv%20to%20Ma/PvToMa.dart';
import 'package:instrumentationapp/Views/Pv%20and%20Ma%20Views/Thermo%20couple%20Calculation/thermoCoupleCalculation.dart';
import 'package:instrumentationapp/Views/Sqrt%20view/maLinearToSrqtMaUI.dart';
import 'package:instrumentationapp/Views/c%20and%20Ohm%20conversion%20view/CandOhmConversionvVew.dart';
import 'package:provider/provider.dart';
import 'Controllers/C and ohm controller/CandOhmConversionController.dart';
import 'Controllers/ICAP controller/icapController.dart';
import 'Controllers/Pv and MA controllers/PVtoMaController.dart';
import 'Views/App Main Menu items/AppMainMenu.dart';
import 'Views/Caibration Calulation VIews/errorpercentage.dart';
import 'Views/Icap views/icap.dart';
import 'Views/Sqrt view/maSqrtToLinearMaUI.dart';

void main() {
  AwesomeNotifications().initialize(
    'resource://drawable/ic_launcher',
    [
      NotificationChannel(
        channelKey: 'export_channel',
        channelName: 'Export Channel',
        channelDescription: 'Channel for export notifications',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
        ledOnMs: 1000,
        ledOffMs: 500,
        playSound: true,
        enableVibration: true,
        importance: NotificationImportance.High,
      )
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => errorPercentageController()),
        ChangeNotifierProvider(create: (context) => PvtoMaController()),
        ChangeNotifierProvider(
            create: (context) => MaErrorAndDeciationController()),
        ChangeNotifierProvider(create: (context) => themocouplecontroller()),
        ChangeNotifierProvider(create: (context) => icapController()),
        ChangeNotifierProvider(
            create: (context) => MaLinearToSqrtMa_controller()),
        ChangeNotifierProvider(
            create: (context) => maSqrtToLinearMa_Controller()),
        ChangeNotifierProvider(
            create: (context) => installedAtHpTapping_controller()),
        ChangeNotifierProvider(
            create: (context) => zeroScaleAboveHpTapping_controller()),
        ChangeNotifierProvider(
            create: (context) => installedBellowHpTapping_controller()),
        ChangeNotifierProvider(
            create: (context) => ClosedInstalledAtHpTapping_controller()),
        ChangeNotifierProvider(
            create: (context) => closedzeroScaleAboveHpTapping_controller()),
        ChangeNotifierProvider(
            create: (context) => closedInstalledBellowHpTapping_controller()),
        ChangeNotifierProvider(create: (context) => AppMainMenuController()),
        ChangeNotifierProvider(
            create: (context) => PressureConverisonController()),
        ChangeNotifierProvider(
            create: (context) => lengthConverisonController()),
        ChangeNotifierProvider(
            create: (context) => temperatureConverisonController()),
        ChangeNotifierProvider(create: (context) => betaRatioController()),
        ChangeNotifierProvider(
            create: (context) => CandOhmConversionController()),
      ],
      child: MaterialApp(
        routes: {
          '/AppMainMenu': (context) => AppMainMenu(),
          '/PvAndMaMainMenu': (context) => PvAndMaMainMenu(),
          '/ErrorPercentage': (context) => errorPercentage(),
          '/MaErrorAndDeviation': (context) => MaErrorAndDeviation(),
          '/PvToMa': (context) => PvToMA(),
          '/thermoCoupleCalculation': (context) => thermoCoupleCalculation(),
          '/icap': (context) => IcapUI(),
          '/maLinearTosqrtMa': (context) => maLinearToSrqtMaUI(),
          '/sqrtMaToLinearMa': (context) => maSqrtToMaLinear(),
          '/installedAtHpTapping_view': (context) =>
              installedAtHpTapping_view(),
          '/zeroScaleAboveHpTapping_View': (context) =>
              zeroScaleAboveHpTapping_View(),
          '/installedBellowHpTapping_View': (context) =>
              installedBellowHpTapping_view(),
          '/ClosedInstalledAtHpTapping_View': (context) =>
              ClosedInstalledAtHpTapping_view(),
          '/closedzeroScaleAboveHpTapping': (context) =>
              closedzeroScaleAboveHpTapping_view(),
          '/closedInstalledBellowHpTapping_View': (context) =>
              closedInstalledBellowHpTapping_view(),
          '/PressureConverison_View': (context) => PressureConversionView(),
          '/lengthConverison_View': (context) => lengthConverisonView(),
          '/temperatureConverison_View': (context) =>
              temperatureConverisonView(),
          '/betaRatio_View': (context) => betaRatioView(),
          '/CandOhmConversion_View': (context) => CandOhmConversionvVew(),

          // Add more routes as needed
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontFamily: 'montserrat',
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontFamily: 'Trajan Pro', fontSize: 16.0),
            bodyLarge: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20.0,
                fontWeight: FontWeight.w700),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AppMainMenu(),
      ),
    );
  }
}
