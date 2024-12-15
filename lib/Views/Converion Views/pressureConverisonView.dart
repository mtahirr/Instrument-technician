import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/Conversions/PressureConversionController.dart';
import 'package:multiselect/multiselect.dart';
import 'package:provider/provider.dart';

import '../../Global Wigets/GlobalAppBar.dart';
import '../../Global Wigets/GlobalTextfield.dart';

class PressureConversionView extends StatelessWidget {
  const PressureConversionView({super.key});

  @override
  Widget build(BuildContext context) {
    PressureConverisonController controller =
        Provider.of<PressureConverisonController>(context);

    return Scaffold(
      appBar: GlobalAppBar("Pressure converison", context, () {}),
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
              DropDownMultiSelect(whenEmpty:" Select Results for",
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
              if (controller.SelectedFrom == "PSI" &&
                  controller.model.fromPsi.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("Kpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Kpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromPsi["Kpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Mpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Mpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromPsi["Mpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Bar"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Bar : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromPsi["Bar"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("kgf/cm2"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of kgf/cm2 : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromPsi["kgf/cm2"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromPsi["mm/hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromPsi["mm/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("in/Hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of in/Hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromPsi["in/Hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("In/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of In/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromPsi["In/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "Kpa" &&
                  controller.model.fromKpa.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("PSI"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of PSI : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromKpa["PSI"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Mpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Mpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromKpa["Mpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Bar"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Bar : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromKpa["Bar"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("kgf/cm2"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of kgf/cm2 : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromKpa["kgf/cm2"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromKpa["mm/hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromKpa["mm/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("in/Hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of in/Hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromKpa["in/Hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("In/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of In/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromKpa["In/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "Mpa" &&
                  controller.model.fromMpa.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("PSI"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of PSI : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMpa["PSI"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Kpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Kpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMpa["Kpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Bar"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Bar : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMpa["Bar"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("kgf/cm2"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of kgf/cm2 : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMpa["kgf/cm2"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMpa["mm/hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMpa["mm/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("in/Hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of in/Hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMpa["in/Hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("In/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of In/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMpa["In/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "Bar" &&
                  controller.model.fromBar.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("PSI"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of PSI : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromBar["PSI"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Kpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Kpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromBar["Kpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Mpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Mpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromBar["Mpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("kgf/cm2"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of kgf/cm2 : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromBar["kgf/cm2"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromBar["mm/hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromBar["mm/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("in/Hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of in/Hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromBar["in/Hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("In/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of In/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromBar["In/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "kgf/cm2" &&
                  controller.model.fromkgfcm2.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("PSI"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of PSI : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromkgfcm2["PSI"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Kpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Kpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromkgfcm2["Kpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Mpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Mpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromkgfcm2["Mpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Bar"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Bar : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromkgfcm2["Bar"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromkgfcm2["mm/hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromkgfcm2["mm/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("in/Hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of in/Hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromkgfcm2["in/Hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("In/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of In/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromkgfcm2["In/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "mm/hg" &&
                  controller.model.fromMmhg.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("PSI"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of PSI : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmhg["PSI"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Kpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Kpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmhg["Kpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Mpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Mpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmhg["Mpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("kgf/cm2"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of kgf/cm2 : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmhg["kgf/cm2"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Bar"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Bar : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmhg["Bar"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmhg["mm/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("in/Hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of in/Hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmhg["in/Hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("In/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of In/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmhg["In/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "mm/h2O" &&
                  controller.model.fromMmh2O.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("PSI"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of PSI : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmh2O["PSI"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Kpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Kpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmh2O["Kpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Mpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Mpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmh2O["Mpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Bar : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmh2O["Bar"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("kgf/cm2"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of kgf/cm2 : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmh2O["kgf/cm2"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmh2O["mm/hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("in/Hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of in/Hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmh2O["in/Hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("In/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of In/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromMmh2O["In/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "in/Hg" &&
                  controller.model.frominHg.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("PSI"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of PSI : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.frominHg["PSI"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Kpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Kpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.frominHg["Kpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Mpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Mpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.frominHg["Mpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Bar"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Bar : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.frominHg["Bar"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("kgf/cm2"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of kgf/cm2 : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.frominHg["kgf/cm2"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.frominHg["mm/hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.frominHg["mm/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("In/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of In/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.frominHg["In/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                    ],
                  ),
                ),

              if (controller.SelectedFrom == "In/h2O" &&
                  controller.model.fromInh2O.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Column(
                    children: [
                      if (controller.processResultsFor.contains("PSI"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of PSI : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInh2O["PSI"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Kpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Kpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInh2O["Kpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Mpa"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Mpa : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInh2O["Mpa"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("Bar"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of Bar : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInh2O["Bar"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("kgf/cm2"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of kgf/cm2 : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInh2O["kgf/cm2"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInh2O["mm/hg"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("mm/h2O"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of mm/h2O : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInh2O["mm/h2O"]!
                                .toStringAsFixed(2)),
                          ],
                        ),
                      if (controller.processResultsFor.contains("in/Hg"))
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Value of in/Hg : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(controller.model.fromInh2O["In/h2O"]!
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
