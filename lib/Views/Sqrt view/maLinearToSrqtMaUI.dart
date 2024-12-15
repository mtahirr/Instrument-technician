import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/sqrt%20controllers/MaLinearToSqrtMa_Controller.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalAppBar.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalTextfield.dart';
import 'package:provider/provider.dart';

class maLinearToSrqtMaUI extends StatelessWidget {
  const maLinearToSrqtMaUI({super.key});

  @override
  Widget build(BuildContext context) {
    MaLinearToSqrtMa_controller dataController =
        Provider.of<MaLinearToSqrtMa_controller>(context);
    return Scaffold(
      appBar: GlobalAppBar("Ma Linear To Ma Sqrt", context, () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildTextField('LRV', dataController.entered_LRV,
                  (value) => dataController.ontextfieldchanged()),
              const SizedBox(
                height: 20,
              ),
              buildTextField('URV', dataController.entered_URV,
                  (value) => dataController.ontextfieldchanged()),
              const SizedBox(
                height: 20,
              ),
              buildTextField(
                  'linear Input Ma',
                  dataController.entered_linear_input_ma,
                  (value) => dataController.ontextfieldchanged()),
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
              if (dataController.isSpanComplied)
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Span : ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(dataController.model.current_calculated_span_value
                          .toStringAsFixed(3)),
                    ],
                  ),
                ),
              if (dataController.isOnlyLinearComplied &&
                  !dataController.areAllLinearwithSpanComplied)
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Linear Output % : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_linear_Output_Perc_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sqrt Output MA : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Sqrt_Output_MA_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sqrt Output % : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Sqrt_Output_Perc_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                  ],
                ),
              if (dataController.areAllLinearwithSpanComplied)
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Linear Output % : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_linear_Output_Perc_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Linear Pv : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Linear_PV_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sqrt Output MA : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Sqrt_Output_MA_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sqrt Output % : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Sqrt_Output_Perc_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sqrt Pv : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_sqrt_pv_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
