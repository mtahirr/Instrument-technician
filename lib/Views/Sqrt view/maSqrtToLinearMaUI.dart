import 'package:flutter/material.dart';
import 'package:instrumentationapp/Controllers/sqrt%20controllers/maSqrtToLinearMa_Controller.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalAppBar.dart';
import 'package:instrumentationapp/Global%20Wigets/GlobalTextfield.dart';
import 'package:provider/provider.dart';

class maSqrtToMaLinear extends StatelessWidget {
  const maSqrtToMaLinear({super.key});

  @override
  Widget build(BuildContext context) {
    maSqrtToLinearMa_Controller dataController =
        Provider.of<maSqrtToLinearMa_Controller>(context);
    return Scaffold(
      appBar: GlobalAppBar("Ma Sqrt To Linear Ma ", context, () {}),
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
                  dataController.entered_Sqrt_input_ma,
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
              if (dataController.isOnlySqrtComplied &&
                  !dataController.areAllSqrtwithSpanComplied)
                Column(
                  children: [
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Linear MA : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Linear_MA_value
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
                            "Linear % : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Linear_Perc_value
                              .toStringAsFixed(3)),
                        ],
                      ),
                    ),
                  ],
                ),
              if (dataController.areAllSqrtwithSpanComplied)
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
                              .model.current_calculated_SqrtPV_value
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
                            "Linear MA : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Linear_MA_value
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
                            "Linear % : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(dataController
                              .model.current_calculated_Linear_Perc_value
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
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
