import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instrumentationapp/Controllers/error%20percentage%20controller/errorPercentageController.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalAppBar.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalTextfield.dart';
import 'package:instrumentationapp/Global%20Wigets/Globalpopup.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class errorPercentage extends StatelessWidget {
  errorPercentage({super.key});
  final List<int> standardErrorValues = [0, 25, 50, 75, 100];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    errorPercentageController errorController =
        Provider.of<errorPercentageController>(context);
    Orientation o = MediaQuery.of(context).orientation;
    return PopScope(
      onPopInvoked: (pop) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      },
      child: Scaffold(
        extendBodyBehindAppBar:
            orientation == Orientation.landscape ? true : false,
        appBar: orientation == Orientation.landscape
            ? MyLandscapeAppBar(
                ArrowBackCallbackAction: () {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                    DeviceOrientation.landscapeRight,
                    DeviceOrientation.landscapeLeft,
                  ]);
                  Navigator.pop(context);
                },
              )
            : GlobalAppBar("Calibration", context, () {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft,
                ]);
                Navigator.pop(context);
              }),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  'Enter Input:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField('LRV', errorController.entered_LRV,
                          (value) => errorController.sequenceOutput()),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: _buildTextField('URV', errorController.entered_URV,
                          (value) => errorController.sequenceOutput()),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                if (!errorController.model.current_calculated_span_value.isNaN)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Value of Span : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(errorController
                                .model.current_calculated_span_value
                                .toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                          'Acceptable error %',
                          errorController.entered_acceptable_error_perc,
                          (value) => errorController.sequenceOutput()),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (errorController.isMAAccetpableComilped)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "MA Span Accetpable: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                            Text(
                                errorController.model
                                    .current_calculate_value_Ma_span_Acceptable
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                      ),
                    if (errorController.isPVAccetpableComilped)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.orange),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "PV Span Accetpable: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                            ),
                            Text(
                                errorController.model
                                    .current_calculate_value_Pv_Span_Acceptable
                                    .toStringAsFixed(2),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                          ],
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (o == Orientation.portrait) {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.landscapeRight,
                                DeviceOrientation.landscapeLeft,
                              ]);
                            } else {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                            }
                          },
                          child: Container(
                            height: 30,
                            width: 25,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/rotate_Phone_Icon.gif",
                                    ),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(2)),
                          ),
                        ),
                        Text(
                          'Results',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const Text(
                      'For Standard  % (0, 25, 50, 75, 100)',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                if (errorController.isTableValueResultsCompiled)
                  Screenshot(
                    controller: errorController.screenshotController,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Center(
                        child: DataTable(
                          dataRowMinHeight: 50,
                          dataRowMaxHeight: 77,
                          columnSpacing: 18,
                          columns: errorController
                              .model.standard_Data_Column_headings_List
                              .map((ColumnTitle) => DataColumn(
                                    label: Text(ColumnTitle,
                                        style: const TextStyle(
                                            fontFamily: 'montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ))
                              .toList(),
                          rows: errorController.StandardValueResults.map(
                              (CompliedvaluesAgainstStandard) {
                            //  to calculate index value
                            int index =
                                errorController.StandardValueResults.toList()
                                    .indexOf(CompliedvaluesAgainstStandard);

                            return DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(
                                      child: Text(CompliedvaluesAgainstStandard[
                                              'Standard Error']!
                                          .toStringAsFixed(0))),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(CompliedvaluesAgainstStandard[
                                            "Standard PV"]!
                                        .toStringAsFixed(2)),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(CompliedvaluesAgainstStandard[
                                            "Standard MA"]!
                                        .toStringAsFixed(2)),
                                  ),
                                ),
                                DataCell(
                                    Center(
                                      child: _buildTextField(
                                          'value',
                                          errorController.forActualPV[index],
                                          (value) =>
                                              errorController.updateActualPV_MA(
                                                  index, "Actual Pv")),
                                    ),
                                    showEditIcon: true),
                                DataCell(
                                    Center(
                                      child: _buildTextField(
                                          'value',
                                          errorController.forActualMA[index],
                                          (value) =>
                                              errorController.updateActualPV_MA(
                                                  index, "Actual Ma")),
                                    ),
                                    showEditIcon: true),
                                DataCell(
                                  Center(
                                    child: Text(CompliedvaluesAgainstStandard[
                                            "Deviation PV"]!
                                        .toStringAsFixed(2)),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text(CompliedvaluesAgainstStandard[
                                            "Deviation MA"]!
                                        .toStringAsFixed(2)),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: const EdgeInsets.all(3),
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: !errorController
                                                .isMAAccetpableComilped
                                            ? null
                                            : (double.tryParse(CompliedvaluesAgainstStandard["PV Error %"]!
                                                            .toStringAsFixed(
                                                                3))! >=
                                                        -double.tryParse(
                                                            errorController
                                                                .entered_acceptable_error_perc
                                                                .text)! &&
                                                    double.tryParse(
                                                            CompliedvaluesAgainstStandard["PV Error %"]!
                                                                .toStringAsFixed(
                                                                    3))! <=
                                                        double.tryParse(
                                                            errorController
                                                                .entered_acceptable_error_perc
                                                                .text)!)
                                                ? Colors.green
                                                : Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(CompliedvaluesAgainstStandard[
                                              "PV Error %"]!
                                          .toStringAsFixed(3)),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: const EdgeInsets.all(3),
                                    padding: const EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                        color: !errorController
                                                .isMAAccetpableComilped
                                            ? null
                                            : (double.tryParse(CompliedvaluesAgainstStandard["MA Error %"]!
                                                            .toStringAsFixed(
                                                                3))! >=
                                                        -double.tryParse(
                                                            errorController
                                                                .entered_acceptable_error_perc
                                                                .text)! &&
                                                    double.tryParse(
                                                            CompliedvaluesAgainstStandard["MA Error %"]!
                                                                .toStringAsFixed(
                                                                    3))! <=
                                                        double.tryParse(
                                                            errorController
                                                                .entered_acceptable_error_perc
                                                                .text)!)
                                                ? Colors.green
                                                : Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(CompliedvaluesAgainstStandard[
                                              "MA Error %"]!
                                          .toStringAsFixed(3)),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                if (errorController.isTableValueResultsCompiled)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext subcontext) {
                                  return AlertDialog(
                                    title: Text('Enter File Name'),
                                    content: _buildTextField(
                                        "enter name",
                                        errorController
                                            .entered_nameOfXlsFileCalibration,
                                        (lable) {}),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          if (errorController
                                              .entered_nameOfXlsFileCalibration
                                              .text
                                              .isNotEmpty) {
                                            errorController.exportToPDF(
                                                errorController
                                                    .entered_nameOfXlsFileCalibration
                                                    .text
                                                    .toString(),
                                                context);
                                            //clear the controller for saving data
                                            errorController
                                                .entered_nameOfXlsFileCalibration
                                                .clear();

                                            Navigator.of(subcontext).pop();
                                          } else {
                                            PopupManager.showPopup(
                                                context,
                                                PopupType.snackbar,
                                                "Name is required to ssave the file");
                                          }
                                        },
                                        child: const Text('save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "Export in Excel Sheet",
                                style: TextStyle(color: Colors.black),
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: ElevatedButton(
                              onPressed: () {
                                errorController.takeScreenshot(context);
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.screenshot,
                                      size: 16, color: Colors.black),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Save Screenshot",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,
      TextFieldChangeCallback callbackAction) {
    return TextField(
      controller: controller,
      onChanged: (_) => callbackAction(labelText),
      keyboardType: labelText != "enter name"
          ? TextInputType.numberWithOptions(
              signed: labelText == "Acceptable error %" ? false : true,
              decimal: true,
            )
          : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: labelText == "Acceptable error %" ? Prefix_Icon() : null,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 13.3),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  final String label;
  final String value;

  const ResultItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}

//  single value output display

// if (!errorController.useStandardError &&
//     errorController.singleValueResultsCompiled)
//   Column(
//     children: [
//       ResultItem(
//           label: 'PV Span Acceptable',
//           value: errorController
//               .model.current_calculate_value_Pv_Span_Acceptable
//               .toString()),
//       ResultItem(
//           label: 'MA Span Acceptable',
//           value: errorController
//               .model.current_calculate_value_Ma_span_Acceptable
//               .toString()),
//       ResultItem(
//           label: 'Standard PV',
//           value: errorController
//               .model.current_calculated_standard_pv_value
//               .toString()),
//       ResultItem(
//           label: 'Standard MA',
//           value: errorController
//               .model.current_calculate_standard_Ma_value
//               .toString()),
//       ResultItem(
//           label: 'PV Error Percentage',
//           value: errorController
//               .model.current_calculate_Pv_Eroor_perc
//               .toString()),
//       ResultItem(
//           label: 'MA Error Percentage',
//           value: errorController
//               .model.current_calculate_Ma_Eroor_perc
//               .toString()),
//       ResultItem(
//           label: 'Deviation MA',
//           value: errorController
//               .model.current_calculate_deviation_MA
//               .toString()),
//       ResultItem(
//           label: 'Deviation PV',
//           value: errorController
//               .model.current_calculate_deviation_PV
//               .toString()),
//     ],
//   )
// Add widgets to display results here

class Prefix_Icon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          size: 15,
        ),
        SizedBox(height: 5),
        Icon(
          Icons.remove,
          size: 15,
        ),
      ],
    );
  }
}
