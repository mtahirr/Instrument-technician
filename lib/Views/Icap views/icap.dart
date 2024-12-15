import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instrumentationapp/Controllers/ICAP%20controller/icapController.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalTextfield.dart';
import 'package:provider/provider.dart';

import '../../Global Wigets/GlobalAppBar.dart';
import '../../Global Wigets/Globalpopup.dart';

class IcapUI extends StatelessWidget {
  const IcapUI({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    icapController controller = Provider.of<icapController>(context);
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
            : GlobalAppBar("iCAP", context, () {
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
                      child: buildTextField('LRV', controller.entered_LRV,
                          (value) => controller.processTable()),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: buildTextField('URV', controller.entered_URV,
                          (value) => controller.processTable()),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                buildSymbolSpecialTextField(
                    'enter unit symbol',
                    controller.entered_unit,
                    (value) => controller.processTable()),
                SizedBox(height: 20.0),
                if (!controller.model.current_calculated_span_value.isNaN)
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
                            Text(controller.model.current_calculated_span_value
                                .toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 15,
                ),
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
                        height: 35,
                        width: 30,
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
                if (controller.istableComplied)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Center(
                      child: DataTable(
                        dataRowMinHeight: 50,
                        dataRowMaxHeight: 77,
                        columnSpacing: 18,
                        columns:
                            controller.model.standard_Data_Column_headings_List
                                .map((ColumnTitle) => DataColumn(
                                      label: Text(ColumnTitle,
                                          style: const TextStyle(
                                              fontFamily: 'montserrat',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ))
                                .toList(),
                        rows: controller.TableResults.map(
                            (compliedvaluesAgainstStandard) {
                          //  to calculate index value
                          int index = controller.TableResults.toList()
                              .indexOf(compliedvaluesAgainstStandard);
                          print(
                              "is standard Pv there is complied list ${compliedvaluesAgainstStandard.containsKey('Standard PV')}");
                          print(compliedvaluesAgainstStandard);
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Center(
                                    child: Text(compliedvaluesAgainstStandard[
                                            'Standard Pv']
                                        .toStringAsFixed(3))),
                              ),
                              DataCell(
                                Center(
                                  child: Text(compliedvaluesAgainstStandard[
                                          "Standard PV Unit"]
                                      .toString()),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(compliedvaluesAgainstStandard[
                                          "Standard Output Perc"]
                                      .toStringAsFixed(3)),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(compliedvaluesAgainstStandard[
                                          "Standard Ma"]
                                      .toStringAsFixed(3)),
                                ),
                              ),
                              DataCell(
                                  Center(
                                    child: buildTextField(
                                        'value',
                                        controller.forMa_AsFound[index],
                                        (value) => controller.processTable()),
                                  ),
                                  showEditIcon: true),
                              DataCell(
                                  Center(
                                    child: buildTextField(
                                        'value',
                                        controller.forPV_AsFound[index],
                                        (value) => controller.processTable()),
                                  ),
                                  showEditIcon: true),
                              DataCell(
                                  Center(
                                    child: buildTextField(
                                        'value',
                                        controller.forMa_AsLeft[index],
                                        (value) => controller.processTable()),
                                  ),
                                  showEditIcon: true),
                              DataCell(
                                  Center(
                                    child: buildTextField(
                                        'value',
                                        controller.forPV_AsLeft[index],
                                        (value) => controller.processTable()),
                                  ),
                                  showEditIcon: true),
                              DataCell(
                                Center(
                                  child: Text(compliedvaluesAgainstStandard[
                                          "Deviation PV"]
                                      .toStringAsFixed(3)),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(compliedvaluesAgainstStandard[
                                          "PV Error %"]
                                      .toStringAsFixed(3)),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(compliedvaluesAgainstStandard[
                                          "MA Error %"]
                                      .toStringAsFixed(3)),
                                ),
                              ),
                              DataCell(
                                Center(
                                  child: Text(compliedvaluesAgainstStandard[
                                          "Deviation MA"]
                                      .toStringAsFixed(3)),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                Divider(),
                SizedBox(
                  height: 40,
                ),
                if (controller.istableComplied)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext subcontext) {
                                return AlertDialog(
                                  title: Text('Enter File Name'),
                                  content: buildSymbolSpecialTextField(
                                    "enter name",
                                    controller.entered_nameOfXlsFileIcap,
                                    (lable) {},
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (controller.entered_nameOfXlsFileIcap
                                            .text.isNotEmpty) {
                                          controller.exportToExcel(
                                              controller
                                                  .entered_nameOfXlsFileIcap
                                                  .text
                                                  .toString(),
                                              context);
                                          //clear the controller for saving data
                                          controller.entered_nameOfXlsFileIcap
                                              .clear();

                                          Navigator.of(subcontext).pop();
                                        } else {
                                          PopupManager.showPopup(
                                              context,
                                              PopupType.snackbar,
                                              "Name is required to save the file");
                                        }
                                      },
                                      child: const Text('save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "Export in Excel Sheet",
                            style: TextStyle(color: Colors.black),
                          )),
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

Widget buildSymbolSpecialTextField(String labelText,
    TextEditingController controller, TextFieldChangeCallback callbackAction) {
  return TextField(
    controller: controller,
    onChanged: (_) => callbackAction(labelText),
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(fontSize: 13.3),
      border: OutlineInputBorder(),
    ),
  );
}
