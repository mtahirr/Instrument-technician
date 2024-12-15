import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/Conversions/lengthConverisonController.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalTextfield.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

import '../../Global Wigets/GlobalAppBar.dart';

class lengthConverisonView extends StatelessWidget {
  const lengthConverisonView({super.key});

  @override
  Widget build(BuildContext context) {
    lengthConverisonController controller =
        Provider.of<lengthConverisonController>(context);
    return Scaffold(
      appBar: GlobalAppBar("length converison", context, () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // condition to display LRV input field

              Container(
                margin: EdgeInsets.only(top: 12),
                child: buildTextField(
                    'enter value for ${controller.SelectedFrom}',
                    controller.enteredInput, (value) {
                  controller.processreuslts();
                }),
              ),

              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                value: controller.SelectedFrom,
                onChanged: (String? newValue) {
                  controller.updateSelectedinputCatagory(newValue!);
                },
                items: controller.selectedFromCatagory
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 20,
              ),
              DropDownMultiSelect(
                whenEmpty:  "Select Results for",
                options: controller.customizedShowableListToSelect,
                selectedValues: controller.processResultsFor,
                onChanged: (value) {
                  controller.finalizedList(value);
                  controller.processreuslts();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Results:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              if (controller.SelectedFrom == "inches" &&
                  controller.model.fromInches.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("mm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInches["mm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("cm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of cm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInches["cm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("feet"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of feet : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInches["feet"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("m"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of m : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInches["m"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("yard"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of yard : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInches["yard"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "mm" &&
                  controller.model.fromMm.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("inches"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of inches : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMm["inches"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("cm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of cm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMm["cm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("feet"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of feet : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMm["feet"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("m"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of m : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMm["m"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("yard"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of yard : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMm["yard"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "cm" &&
                  controller.model.fromCm.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("inches"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of inches : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromCm["inches"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromCm["mm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("feet"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of feet : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromCm["feet"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("m"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of m : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromCm["m"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("yard"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of yard : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromCm["yard"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "feet" &&
                  controller.model.fromFeet.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("inches"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of inches : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromFeet["inches"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromFeet["mm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("cm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of cm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromFeet["cm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("m"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of m : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromFeet["m"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("yard"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of yard : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromFeet["yard"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "m" &&
                  controller.model.fromM.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("inches"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of inches : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromM["inches"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromM["mm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("cm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of cm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromM["cm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("feet"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of feet : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromM["feet"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("yard"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of yard : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromM["yard"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "yard" &&
                  controller.model.fromYard.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("inches"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of inches : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromYard["inches"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromYard["mm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("cm"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of cm : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromYard["cm"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("feet"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of feet : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromYard["feet"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("m"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of m : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromYard["m"]!
                                .toStringAsFixed(3)),
                          ],
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
