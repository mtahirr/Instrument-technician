import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instrumentationapp/Formula%20Models/Error%20Percentage/errorPercentage.dart';
import 'package:screenshot/screenshot.dart';

class errorPercentageController extends ChangeNotifier {
  final ScreenshotController screenshotController = ScreenshotController();

  TextEditingController entered_URV = TextEditingController();
  TextEditingController entered_LRV = TextEditingController();
  TextEditingController entered_error_value = TextEditingController();
  TextEditingController entered_acceptable_error_perc = TextEditingController();
  TextEditingController entered_nameOfXlsFileCalibration =
      TextEditingController();
  List<Map<String, double>> StandardValueResults = [];

  errorPercentage model = errorPercentage();

  bool isPVAccetpableComilped = false;
  bool isMAAccetpableComilped = false;
  bool isTableValueResultsCompiled = false;

  bool get validateLRV => _validateLrvData();
  bool get validateURV => _validateUrvData();
  bool get validateAcceptableErrorValue => validateEnteredAcceptableErrorData();
  List<TextEditingController> forActualPV = [];
  List<TextEditingController> forActualMA = [];

  resetscreen() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void takeScreenshot(BuildContext context) async {
    // Capture the screenshot
    // Uint8List? imageBytes = await screenshotController.capture();

    try {
      // Capture the screenshot
      Uint8List? image = await screenshotController.captureFromLongWidget(
          Container(
            color: Colors.white,
            child: DataTable(
              dataRowMinHeight: 50,
              dataRowMaxHeight: 77,
              columnSpacing: 18,
              columns: model.standard_Data_Column_headings_List
                  .map((ColumnTitle) => DataColumn(
                        label: Text(ColumnTitle,
                            style: const TextStyle(
                                fontFamily: 'montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ))
                  .toList(),
              rows: StandardValueResults.map((CompliedvaluesAgainstStandard) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Center(
                          child: Text(
                              CompliedvaluesAgainstStandard['Standard Error']!
                                  .toStringAsFixed(0))),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                            CompliedvaluesAgainstStandard["Standard PV"]!
                                .toStringAsFixed(2)),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                            CompliedvaluesAgainstStandard["Standard MA"]!
                                .toStringAsFixed(2)),
                      ),
                    ),
                    DataCell(
                        Center(
                          child: Text(
                              CompliedvaluesAgainstStandard["Actual Pv"]!
                                  .toStringAsFixed(2)),
                        ),
                        showEditIcon: true),
                    DataCell(
                        Center(
                          child: Text(
                              CompliedvaluesAgainstStandard["Actual Ma"]!
                                  .toStringAsFixed(2)),
                        ),
                        showEditIcon: true),
                    DataCell(
                      Center(
                        child: Text(
                            CompliedvaluesAgainstStandard["Deviation PV"]!
                                .toStringAsFixed(2)),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(
                            CompliedvaluesAgainstStandard["Deviation MA"]!
                                .toStringAsFixed(2)),
                      ),
                    ),
                    DataCell(
                      Center(
                        child: Text(CompliedvaluesAgainstStandard["PV Error %"]!
                            .toStringAsFixed(3)),
                      ),
                    ),
                    DataCell(
                      Container(
                        margin: const EdgeInsets.all(3),
                        padding: const EdgeInsets.all(7),
                        child: Center(
                          child: Text(
                              CompliedvaluesAgainstStandard["MA Error %"]!
                                  .toStringAsFixed(3)),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          pixelRatio: 1.9);
      if (image.isNotEmpty) {
        // Save the image to the gallery
        final result = await ImageGallerySaver.saveImage(image);
        print(" here is the value of reuslt in ${result["filePath"]}");
        // Check if the image was saved successfully
        if (result != null && result.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('File saved in Gallery')),
          );
        } else {
          throw ('Failed to save image to gallery.');
        }
      } else {
        throw ('Failed to capture screenshot');
      }
    } catch (e) {
      print('Error saving screenshot: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving screenshot')),
      );
    }
  }
  //     if (result!) {
  //       // Screenshot saved successfully
  //       PopupManager.showPopup(context, PopupType.snackbar,
  //           "Screenshot is successfully saved in the gallery");
  //     } else {
  //       // Saving failed
  //       PopupManager.showPopup(
  //           context, PopupType.snackbar, "Error saving screenshot");
  //     }
  //   } catch (e) {
  //     PopupManager.showPopup(
  //         context, PopupType.snackbar, "Error saving screenshot due to : $e");
  //   }
  // } else {
  //   // Screenshot capture failed
  //   PopupManager.showPopup(
  //       context, PopupType.snackbar, "Error saving screenshot");
  // }

  // Future<void> exportToExcel(String fileName, BuildContext context) async {
  //   try {
  //     // Create an Excel workbook
  //     var excel = Excel.createExcel();
  //     var sheet = excel['Sheet1'];

  //     // Add column headers
  //     var headers = StandardValueResults.first.keys.toList();
  //     print("values in headers : ${headers}");
  //     sheet.appendRow(headers);

  //     // Add data rows

  //     StandardValueResults.forEach((TopElement) {
  //       List<double> rowData = [];
  //       headers.forEach((element) {
  //         rowData.add(TopElement[element]!);
  //       });
  //       print("here is the value of row data in each loop : $rowData");
  //       sheet.appendRow(rowData);
  //     });

  //     print("printed data in sheet of excel : ${sheet.rows} ");

  //     // Save the Excel file
  //     var bytes = excel.encode();
  //     Directory dir = Directory('/storage/emulated/0/Download');
  //     var savePath = dir.path;

  //     String filePath = '$savePath/$fileName.xls';
  //     File file = File(filePath);

  //     // Write the bytes to the file
  //     await file.writeAsBytes(bytes!);

  //     print('File saved to: $filePath');

  //     // print("here is the directory path : $directory");
  //     // final path = '${directory!.path}/$fileName.xls';
  //     // await File(path).writeAsBytes(bytes!);

  //     // Show a confirmation dialog
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Export Successful'),
  //           content: Text(
  //               'The Excel file has been saved in downlaods as $fileName.xls '),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     print('Error exporting to Excel: $e');
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Export Failed'),
  //           content: Text('An error occurred while exporting to Excel.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  Future<bool> initializeNotifications() async {
    // Check if the app has permission to show notifications
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

    if (!isAllowed) {
      // Request permission if not granted
      await AwesomeNotifications().requestPermissionToSendNotifications();

      // After requesting permission, you can check again if it's allowed
      isAllowed = await AwesomeNotifications().isNotificationAllowed();
    }

    if (!isAllowed) {
      // Handle case where permission is denied
      print('Notifications are disabled or permission is denied.');
      // You can provide a UI indication or prompt the user to enable notifications manually.
      // For example, show a dialog or navigate to the device settings.
      return false;
    } else {
      // Permission granted, continue with creating notifications
      // Your notification creation logic goes here
      return true;
    }
  }

  Future<void> exportToPDF(String fileName, BuildContext context) async {
    try {
      await initializeNotifications();

      // Create a PDF document
      final pdf = pw.Document();

      // Add a page to the PDF
      pdf.addPage(
        pw.Page(
          build: (context) {
            return pw.TableHelper.fromTextArray(
              headers: StandardValueResults.first.keys.toList(),
              data: StandardValueResults.map((item) => item.values.toList())
                  .toList(),
              border: pw.TableBorder.all(),
              headerAlignment: pw.Alignment.center,
              cellAlignment: pw.Alignment.center,
            );
          },
        ),
      );

      // Save the PDF file
      Directory dir = Directory('/storage/emulated/0/Download');
      final filePath = '${dir.path}/$fileName.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Display completion notification
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 11,
          channelKey: 'export_channel',
          title: 'Export completed',
          body: 'PDF file has been saved in downloads',
        ),
        actionButtons: [
          NotificationActionButton(
            key: 'view',
            label: 'close',
          ),
        ],
      );

      OpenFilex.open(file.path);

      // Show a confirmation dialog
      //  showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('Export Successful'),
      //         content: Text(
      //             'The PDF file has been saved in downloads as $fileName.pdf'),
      //         actions: [
      //           TextButton(
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //             child: Text('OK'),
      //           ),
      //         ],
      //       );
      //     },
      //   );
    } catch (e) {
      print('Error exporting to PDF: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Export Failed'),
            content: Text('An error occurred while exporting to PDF.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  creatingTextFieldsForActualPV() {
    TextEditingController entered_actual_Pv_Row1 = TextEditingController();
    TextEditingController entered_actual_Pv_Row2 = TextEditingController();
    TextEditingController entered_actual_Pv_Row3 = TextEditingController();
    TextEditingController entered_actual_Pv_Row4 = TextEditingController();
    TextEditingController entered_actual_Pv_Row5 = TextEditingController();
    entered_actual_Pv_Row1.text = 0.0.toString();
    entered_actual_Pv_Row2.text = 0.0.toString();
    entered_actual_Pv_Row3.text = 0.0.toString();
    entered_actual_Pv_Row4.text = 0.0.toString();
    entered_actual_Pv_Row5.text = 0.0.toString();
    forActualPV.clear();
    forActualPV.add(entered_actual_Pv_Row1);
    forActualPV.add(entered_actual_Pv_Row2);
    forActualPV.add(entered_actual_Pv_Row3);
    forActualPV.add(entered_actual_Pv_Row4);
    forActualPV.add(entered_actual_Pv_Row5);
  }

  creatingTextFieldsForActualMA() {
    TextEditingController entered_actual_MA_Row1 = TextEditingController();
    TextEditingController entered_actual_MA_Row2 = TextEditingController();
    TextEditingController entered_actual_MA_Row3 = TextEditingController();
    TextEditingController entered_actual_MA_Row4 = TextEditingController();
    TextEditingController entered_actual_MA_Row5 = TextEditingController();
    entered_actual_MA_Row1.text = 0.0.toString();
    entered_actual_MA_Row2.text = 0.0.toString();
    entered_actual_MA_Row3.text = 0.0.toString();
    entered_actual_MA_Row4.text = 0.0.toString();
    entered_actual_MA_Row5.text = 0.0.toString();
    forActualMA.clear();
    forActualMA.add(entered_actual_MA_Row1);
    forActualMA.add(entered_actual_MA_Row2);
    forActualMA.add(entered_actual_MA_Row3);
    forActualMA.add(entered_actual_MA_Row4);
    forActualMA.add(entered_actual_MA_Row5);
  }

  updateAcceptables() {
    if (validateAcceptableErrorValue) {
      //calculate MV span acceptable
      model.calculate_Ma_span_Acceptable(
          double.tryParse(entered_acceptable_error_perc.text.toString())!);
      isMAAccetpableComilped = true;
    } else {
      isMAAccetpableComilped = false;
    }
    if (validateLRV && validateURV && validateAcceptableErrorValue) {
      //calculate PV span acceptable
      model.calculate_Pv_Span_Acceptable(
          double.tryParse(entered_acceptable_error_perc.text.toString())!,
          model.current_calculated_span_value);
      isPVAccetpableComilped = true;
    } else {
      isPVAccetpableComilped = false;
    }
    notifyListeners();
  }

  calculateSpan() {
    double valid_lrv = double.parse(entered_LRV.text);
    double valid_urv = double.parse(entered_URV.text);
    model.calculate_span(valid_lrv, valid_urv);
  }

  sequenceOutput() async {
    if (validateLRV && validateURV) {
      //calulate span
      calculateSpan();
      updateAcceptables();
      await processStandardErrorResults();
      isTableValueResultsCompiled = true;
      //proceed against standrd input values
    } else {
      print("values not enhough to display span");
      // update status to UI
      model.current_calculated_span_value = double.nan;
      isTableValueResultsCompiled = false;
      isPVAccetpableComilped = false;
    }
    notifyListeners();
  }

  // standard error calculations in Json in table
  processStandardErrorResults() async {
    StandardValueResults.clear();

    await creatingTextFieldsForActualMA();
    await creatingTextFieldsForActualPV();

    if (forActualMA.isNotEmpty) {
      print(" for actual MA the controllers is setteled ");
    } else {
      print(" for actual  MA the controllers is not  setteled ");
    }
    if (forActualPV.isNotEmpty) {
      print(" for actual PV the controllers is setteled ");
    } else {
      print(" for actual PV the controllers is not setteled ");
    }
    for (int i = 0; i < model.standardErrorValuePercentage_List.length; i++) {
      double tempStandardPV;
      double tempStandardMA;

      double tempspan = model.current_calculated_span_value;

      // calculate standard PV
      print(model.standardErrorValuePercentage_List[i].toString() +
          " value of standard percentage");
      print(tempspan.toString() + " value of span");

      print(entered_LRV.text + " value of LRV");

      tempStandardPV = model.calculate_Standard_Pv(
          double.tryParse(
              model.standardErrorValuePercentage_List[i].toString())!,
          tempspan,
          double.tryParse(entered_LRV.text)!);
      print(tempStandardPV.toString() + " value of standard PV");
      // calculate standard Ma
      tempStandardMA = model.calculate_Standard_Ma(double.tryParse(
          model.standardErrorValuePercentage_List[i].toString())!);

      StandardValueResults.add({
        //calculate PV span acceptable
        "Standard Error": double.tryParse(
            model.standardErrorValuePercentage_List[i].toString())!,

        //calculate standard Pv and storing value to local variable
        "Standard PV": tempStandardPV,
        // calculate standard Ma
        "Standard MA": tempStandardMA,
        "Actual Pv": double.tryParse(forActualPV[i].text.toString())!,
        "Actual Ma": double.tryParse(forActualMA[i].text.toString())!,
        // calulate pv error percentage
        "PV Error %": model.calculate_Pv_Error_Percentage(
            double.tryParse(forActualPV[i].text.toString())!,
            tempStandardPV,
            tempspan),
        // calulate MA error percentage
        "MA Error %": model.calculate_Ma_Error_Percentage(
            double.tryParse(forActualMA[i].text.toString())!, tempStandardMA),
        //calculate deviation ma
        "Deviation MA": model.calculate_Deviation_Ma(
            double.tryParse(forActualMA[i].text.toString())!, tempStandardMA),
        //calulate deviation pv
        "Deviation PV": model.calculate_Deviation_Pv(
            double.tryParse(forActualPV[i].text.toString())!, tempStandardPV)
      });
    }
  }

  // validations for input text editing controllers
  bool _validateLrvData() {
    return entered_LRV.text.isNotEmpty &&
        double.tryParse(entered_LRV.text) != null;
  }

  bool _validateUrvData() {
    return entered_URV.text.isNotEmpty &&
        double.tryParse(entered_URV.text) != null;
  }

  bool validateErrorData() {
    return entered_error_value.text.isNotEmpty &&
        double.tryParse(entered_error_value.text) != null;
  }

  bool validateEnteredAcceptableErrorData() {
    return entered_acceptable_error_perc.text.isNotEmpty &&
        double.tryParse(entered_acceptable_error_perc.text) != null;
  }

  updateActualPV_MA(int rowIndex, String lable) {
    if (lable == "Actual Pv" &&
        forActualPV[rowIndex].text.isNotEmpty &&
        double.tryParse(forActualPV[rowIndex].text) != null) {
      StandardValueResults[rowIndex].update("Actual Pv",
          (value) => double.tryParse(forActualPV[rowIndex].text.toString())!);
      // recalculate standard PV
      double tempStandardPV =
          StandardValueResults[rowIndex]["Standard PV"]!.toDouble();

      // re calculate PV percenatge
      double newcompliedPvPercentage = model.calculate_Pv_Error_Percentage(
          double.tryParse(forActualPV[rowIndex].text.toString())!,
          tempStandardPV,
          model.current_calculated_span_value);

      // re calculation devaition pV
      double tempdeviationPV = model.calculate_Deviation_Pv(
          double.tryParse(forActualPV[rowIndex].text.toString())!,
          tempStandardPV);

      if (StandardValueResults[rowIndex].containsKey("PV Error %") &&
          StandardValueResults[rowIndex].containsKey("Deviation PV")) {
        StandardValueResults[rowIndex]
            .update("PV Error %", (value) => newcompliedPvPercentage);
        StandardValueResults[rowIndex]
            .update("Deviation PV", (value) => tempdeviationPV);
      }
    } else if (lable == "Actual Ma" &&
        forActualMA[rowIndex].text.isNotEmpty &&
        double.tryParse(forActualMA[rowIndex].text) != null) {
      // updating the value of Actual Ma in the json Model object
      StandardValueResults[rowIndex].update("Actual Ma",
          (value) => double.tryParse(forActualMA[rowIndex].text.toString())!);

      //temperatory objects for calculations
      double tempStandardMA =
          StandardValueResults[rowIndex]["Standard MA"]!.toDouble();
      double updatedDeviationMA = model.calculate_Deviation_Ma(
          double.tryParse(forActualMA[rowIndex].text.toString())!,
          tempStandardMA);

      // calulate MA error percentage
      double updatedMaPercentage = model.calculate_Ma_Error_Percentage(
          double.tryParse(forActualMA[rowIndex].text.toString())!,
          tempStandardMA);
      if (StandardValueResults[rowIndex].containsKey("PV Error %") &&
          StandardValueResults[rowIndex].containsKey("Deviation PV")) {
        StandardValueResults[rowIndex]
            .update("Deviation MA", (value) => updatedDeviationMA);
        StandardValueResults[rowIndex]
            .update("MA Error %", (value) => updatedMaPercentage);
      }
    }
    notifyListeners();
  }
}
