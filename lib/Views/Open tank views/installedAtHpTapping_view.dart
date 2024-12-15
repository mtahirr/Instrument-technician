import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/tanks/Open%20tank%20Controllers/installedAtHpTapping_controller.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalAppBar.dart';
import 'package:provider/provider.dart';

import '../../Global Wigets/GlobalTextfield.dart';

class installedAtHpTapping_view extends StatelessWidget {
  const installedAtHpTapping_view({super.key});

  @override
  Widget build(BuildContext context) {
    installedAtHpTapping_controller dataController =
        Provider.of<installedAtHpTapping_controller>(context);
    return Scaffold(
      appBar: GlobalAppBar(
          "Open Tank Level Transmitter\n installed at Hp Tapping Point",
          context,
          () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildTextField('S.G', dataController.entered_Sg,
                  (value) => dataController.processresults()),
              const SizedBox(
                height: 20,
              ),
              buildTextField('L', dataController.entered_head,
                  (value) => dataController.processresults()),
              const SizedBox(
                height: 20,
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
              if (dataController.isUrvComplied &&
                  !dataController.model.Current_Calculated_Urv.isNaN)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Urv : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(dataController.model.Current_Calculated_Urv
                          .toStringAsFixed(3)),
                    ],
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Divider(),
                  const Text(
                    "Work Flow",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/one.png"))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
