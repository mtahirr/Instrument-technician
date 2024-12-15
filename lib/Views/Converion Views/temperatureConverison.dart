import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/Conversions/temperatureConverisonController.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalAppBar.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalTextfield.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

class temperatureConverisonView extends StatelessWidget {
  const temperatureConverisonView({super.key});

  @override
  Widget build(BuildContext context) {
    temperatureConverisonController controller =
        Provider.of<temperatureConverisonController>(context);
    return Scaffold(
      appBar: GlobalAppBar("Temperture converison", context, () {}),
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
                whenEmpty: "Select Results for",
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
              if (controller.SelectedFrom == "c" &&
                  controller.model.fromC.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("f"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of f : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromC["f"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("k"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of k : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromC["k"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("rak"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of rak : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromC["rak"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "f" &&
                  controller.model.fromF.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("c"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of c : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromF["c"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("k"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of k : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromF["k"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("rak"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of rak : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromF["rak"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "k" &&
                  controller.model.fromK.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("c"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of c : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromK["c"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("f"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of f : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromK["f"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("rak"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of rak : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromK["rak"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),
              if (controller.SelectedFrom == "rak" &&
                  controller.model.fromRak.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("c"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of c : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromRak["c"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("f"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of f : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromRak["f"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("k"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of k : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromRak["k"]!
                                .toStringAsFixed(2)),
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
