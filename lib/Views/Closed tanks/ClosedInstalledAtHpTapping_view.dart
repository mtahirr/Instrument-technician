import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/tanks/Closed%20tank%20Controllers/ClosedInstalledAtHpTapping_controller.dart';
import 'package:provider/provider.dart';

import '../../Global Wigets/GlobalAppBar.dart';
import '../../Global Wigets/GlobalTextfield.dart';

class ClosedInstalledAtHpTapping_view extends StatelessWidget {
  const ClosedInstalledAtHpTapping_view({super.key});

  @override
  Widget build(BuildContext context) {
    ClosedInstalledAtHpTapping_controller dataController =
        Provider.of<ClosedInstalledAtHpTapping_controller>(context);
    return Scaffold(
      appBar: GlobalAppBar(
          "Closed Tank Level Transmitter\n Installed at Hp Tapping Point",
          context, () {
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: buildTextField(
                        'S.G L1',
                        dataController.entered_Sghead1,
                        (value) => dataController.processresults()),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: buildTextField(
                        'S.G L2',
                        dataController.entered_Sghead2,
                        (value) => dataController.processresults()),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: buildTextField('L1', dataController.entered_head1,
                        (value) => dataController.processresults()),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: buildTextField('L2', dataController.entered_head2,
                        (value) => dataController.processresults()),
                  ),
                ],
              ),
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
              if (dataController.isresultsComplied &&
                  !dataController.model.Current_Calculated_Urv.isNaN &&
                  !dataController.model.Current_Calculated_lrv.isNaN)
                Column(
                  children: [
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Lrv : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(dataController.model.Current_Calculated_lrv
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                  ],
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
                            image: AssetImage("assets/1_4.png"))),
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
