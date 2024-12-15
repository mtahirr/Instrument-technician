import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/Pv%20and%20MA%20controllers/MaErrorAndDeciationController.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalAppBar.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalTextfield.dart';
import 'package:provider/provider.dart';

class MaErrorAndDeviation extends StatefulWidget {
  const MaErrorAndDeviation({super.key});

  @override
  State<MaErrorAndDeviation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MaErrorAndDeviation> {
  @override
  Widget build(BuildContext context) {
    MaErrorAndDeciationController dataController =
        Provider.of<MaErrorAndDeciationController>(context);
    return Scaffold(
      appBar: GlobalAppBar("Ma error & deviation", context, () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildTextField('StandardMA', dataController.entered_StandardMa,
                  (value) => dataController.update_input_changed()),
              const SizedBox(
                height: 20,
              ),
              buildTextField('Ma As Found', dataController.entered_Ma_as_found,
                  (value) => dataController.update_input_changed()),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Results',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              if (dataController.isDeviationComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Deviation (Error in Ma) : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(dataController.model.current_calculated_deviation
                          .toStringAsFixed(3)),
                    ],
                  ),
                ),
              if (dataController.isErrorPercentageComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Error % : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(dataController.model.current_calculated_Error_perc
                          .toStringAsFixed(3)),
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
