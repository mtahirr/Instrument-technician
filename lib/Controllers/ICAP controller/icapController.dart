import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:instrumentationapp/Formula%20Models/Icap%20model/icapModel.dart';

class icapController extends ChangeNotifier {
  icapModel model = icapModel();
  TextEditingController entered_URV = TextEditingController();
  TextEditingController entered_LRV = TextEditingController();
  TextEditingController entered_unit = TextEditingController();
  TextEditingController entered_nameOfXlsFileIcap = TextEditingController();
  List<TextEditingController> forMa_AsFound = [];
  List<TextEditingController> forPV_AsFound = [];
  List<Map<String, dynamic>> TableResults = [];
  List<TextEditingController> forMa_AsLeft = [];
  List<TextEditingController> forPV_AsLeft = [];
  bool istableComplied = false;
  bool get validateLRV => _validateLrvData();
  bool get validateURV => _validateUrvData();
  //validate text form fields

  bool _validateLrvData() {
    return entered_LRV.text.isNotEmpty &&
        double.tryParse(entered_LRV.text) != null;
  }

  bool _validateUrvData() {
    return entered_URV.text.isNotEmpty &&
        double.tryParse(entered_URV.text) != null;
  }

  Future<void> exportToExcel(String fileName, BuildContext context) async {
    try {
      // Create an Excel workbook
      var excel = Excel.createExcel();
      var sheet = excel['Sheet1'];

      // Add column headers
      var headers = TableResults.first.keys.toList();
      print("values in headers : ${headers}");
      sheet.appendRow(headers);

      // Add data rows

      TableResults.forEach((TopElement) {
        List<dynamic> rowData = [];
        headers.forEach((element) {
          rowData.add(TopElement[element]!);
        });
        print("here is the value of row data in each loop : $rowData");
        sheet.appendRow(rowData);
      });

      print("printed data in sheet of excel : ${sheet.rows} ");

      // Save the Excel file
      var bytes = excel.encode();
      Directory dir = Directory('/storage/emulated/0/Download');
      var savePath = dir.path;

      String filePath = '$savePath/$fileName.xls';
      File file = File(filePath);

      // Write the bytes to the file
      await file.writeAsBytes(bytes!);

      print('File saved to: $filePath');

      // print("here is the directory path : $directory");
      // final path = '${directory!.path}/$fileName.xls';
      // await File(path).writeAsBytes(bytes!);

      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Export Successful'),
            content: Text(
                'The Excel file has been saved in downlaods as $fileName.xls '),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error exporting to Excel: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Export Failed'),
            content: Text('An error occurred while exporting to Excel.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  processTable() async {
    if (validateLRV && validateURV && entered_unit.text.isNotEmpty) {
      if (forMa_AsFound.isEmpty) {
        await creatingTextFieldsforMa_Asfound();
      }
      if (forMa_AsLeft.isEmpty) {
        await creatingTextFieldsfor_Ma_AsLeft();
      }

      if (forPV_AsFound.isEmpty) {
        await creatingTextFieldsFor_Pv_AsFound();
      }
      if (forPV_AsLeft.isEmpty) {
        await creatingTextFieldsfor_PV_AsLeft();
      }

      if (forMa_AsFound.isNotEmpty &&
          forMa_AsLeft.isNotEmpty &&
          forPV_AsFound.isNotEmpty &&
          forPV_AsLeft.isNotEmpty &&
          forPV_AsLeft.length == model.Standard_output_Perc_List.length) {
        TableResults.clear();
        await calculateResults();
        if (TableResults.isNotEmpty) {
          istableComplied = true;
        } else {
          print("table result json contains nothing even after being complied");
          istableComplied = false;
        }
      } else {
        istableComplied = false;
        print(
            "somthing wrong to the table text fields or length of text fields may not be equalls to model provided list.. causing unfit for json");
      }
    } else {
      istableComplied = false;
    }
    notifyListeners();
  }

// method will be executed only when once the process table is called
  calculateResults() async {
    for (int i = 0; i < model.Standard_output_Perc_List.length; i++) {
      await complieFormulas(i);

      if (model.allValuesSet()) {
        print(
            "for row/index $i here is the value of standard pV : ${model.current_calculated_Standard_PV_value}");
        TableResults.add({
          //calculate PV span acceptable
          "Standard Pv": model.current_calculated_Standard_PV_value,
          //calculate standard Pv and storing value to local variable
          "Standard PV Unit": entered_unit.text,
          // calculate standard Ma
          "Standard Output Perc": model.Standard_output_Perc_List[i],
          "Standard Ma": model.Standard_Ma_List[i],
          "Ma As found": double.tryParse(forMa_AsFound[i].text.toString())!,
          "PV As found": double.tryParse(forPV_AsFound[i].text.toString())!,
          "Ma As Left": double.tryParse(forMa_AsLeft[i].text.toString())!,
          "PV As Left": double.tryParse(forPV_AsLeft[i].text.toString())!,
          //calulate deviation pv
          "Deviation PV": model.current_calculated_PV_Deviation_value,
          // calulate pv error in percentage
          "PV Error %": model.current_calculated_PV_Error_in_Perce_value,
          // calulate MA error in percentage
          "MA Error %": model.current_calculated_Ma_Error_in_Perce_value,
          //calculate deviation ma
          "Deviation MA": model.current_calculated_Ma_Deviation_value,
        });
      }
      // submitting results to the json tableresults
    }
    print(TableResults);
  }

  Future complieFormulas(int i) async {
    //calculate span
    model.calculate_span(
        double.tryParse(entered_LRV.text)!, double.tryParse(entered_URV.text)!);
    //calculate standard PV
    model.calculate_standardPV(
        model.Standard_output_Perc_List[i],
        model.current_calculated_span_value,
        double.tryParse(entered_LRV.text)!);
    //calculate Deviation Pv
    model.calculate_PV_Deviation(
        double.tryParse(forPV_AsLeft[i].text.toString())!,
        model.current_calculated_Standard_PV_value);
    //calculate Pv in error Percentage
    model.calculate_Pv_In_Error_Percentage(
        model.current_calculated_PV_Deviation_value,
        model.current_calculated_span_value);
    //calculate Deviation MA
    model.calculate_Ma_Deviation(
        double.tryParse(forMa_AsLeft[i].text.toString())!,
        model.Standard_Ma_List[i]);
    // calulate MA error in percentage
    model.calculate_Ma_In_Error_Percentage(
        model.current_calculated_Ma_Deviation_value);
  }

  Future creatingTextFieldsforMa_Asfound() async {
    TextEditingController entered_forMa_Asfound_Row1 = TextEditingController();
    TextEditingController entered_forMa_Asfound_Row2 = TextEditingController();
    TextEditingController entered_forMa_Asfound_Row3 = TextEditingController();
    TextEditingController entered_forMa_Asfound_Row4 = TextEditingController();
    TextEditingController entered_forMa_Asfound_Row5 = TextEditingController();
    entered_forMa_Asfound_Row1.text = 0.0.toString();
    entered_forMa_Asfound_Row2.text = 0.0.toString();
    entered_forMa_Asfound_Row3.text = 0.0.toString();
    entered_forMa_Asfound_Row4.text = 0.0.toString();
    entered_forMa_Asfound_Row5.text = 0.0.toString();
    forMa_AsFound.clear();
    forMa_AsFound.add(entered_forMa_Asfound_Row1);
    forMa_AsFound.add(entered_forMa_Asfound_Row2);
    forMa_AsFound.add(entered_forMa_Asfound_Row3);
    forMa_AsFound.add(entered_forMa_Asfound_Row4);
    forMa_AsFound.add(entered_forMa_Asfound_Row5);
  }

  Future creatingTextFieldsFor_Pv_AsFound() async {
    TextEditingController entered_forPV_AsFound_Row1 = TextEditingController();
    TextEditingController entered_forPV_AsFound_Row2 = TextEditingController();
    TextEditingController entered_forPV_AsFound_Row3 = TextEditingController();
    TextEditingController entered_forPV_AsFound_Row4 = TextEditingController();
    TextEditingController entered_forPV_AsFound_Row5 = TextEditingController();
    entered_forPV_AsFound_Row1.text = 0.0.toString();
    entered_forPV_AsFound_Row2.text = 0.0.toString();
    entered_forPV_AsFound_Row3.text = 0.0.toString();
    entered_forPV_AsFound_Row4.text = 0.0.toString();
    entered_forPV_AsFound_Row5.text = 0.0.toString();
    forPV_AsFound.clear();
    forPV_AsFound.add(entered_forPV_AsFound_Row1);
    forPV_AsFound.add(entered_forPV_AsFound_Row2);
    forPV_AsFound.add(entered_forPV_AsFound_Row3);
    forPV_AsFound.add(entered_forPV_AsFound_Row4);
    forPV_AsFound.add(entered_forPV_AsFound_Row5);
  }

  Future creatingTextFieldsfor_Ma_AsLeft() async {
    TextEditingController entered_forMa_AsLeft_Row1 = TextEditingController();
    TextEditingController entered_forMa_AsLeft_Row2 = TextEditingController();
    TextEditingController entered_forMa_AsLeft_Row3 = TextEditingController();
    TextEditingController entered_forMa_AsLeft_Row4 = TextEditingController();
    TextEditingController entered_forMa_AsLeft_Row5 = TextEditingController();
    entered_forMa_AsLeft_Row1.text = 0.0.toString();
    entered_forMa_AsLeft_Row2.text = 0.0.toString();
    entered_forMa_AsLeft_Row3.text = 0.0.toString();
    entered_forMa_AsLeft_Row4.text = 0.0.toString();
    entered_forMa_AsLeft_Row5.text = 0.0.toString();
    forMa_AsLeft.clear();
    forMa_AsLeft.add(entered_forMa_AsLeft_Row1);
    forMa_AsLeft.add(entered_forMa_AsLeft_Row2);
    forMa_AsLeft.add(entered_forMa_AsLeft_Row3);
    forMa_AsLeft.add(entered_forMa_AsLeft_Row4);
    forMa_AsLeft.add(entered_forMa_AsLeft_Row5);
  }

  Future creatingTextFieldsfor_PV_AsLeft() async {
    TextEditingController entered_forPV_AsLeft_Row1 = TextEditingController();
    TextEditingController entered_forPV_AsLeft_Row2 = TextEditingController();
    TextEditingController entered_forPV_AsLeft_Row3 = TextEditingController();
    TextEditingController entered_forPV_AsLeft_Row4 = TextEditingController();
    TextEditingController entered_forPV_AsLeft_Row5 = TextEditingController();
    entered_forPV_AsLeft_Row1.text = 0.0.toString();
    entered_forPV_AsLeft_Row2.text = 0.0.toString();
    entered_forPV_AsLeft_Row3.text = 0.0.toString();
    entered_forPV_AsLeft_Row4.text = 0.0.toString();
    entered_forPV_AsLeft_Row5.text = 0.0.toString();
    forPV_AsLeft.clear();
    forPV_AsLeft.add(entered_forPV_AsLeft_Row1);
    forPV_AsLeft.add(entered_forPV_AsLeft_Row2);
    forPV_AsLeft.add(entered_forPV_AsLeft_Row3);
    forPV_AsLeft.add(entered_forPV_AsLeft_Row4);
    forPV_AsLeft.add(entered_forPV_AsLeft_Row5);
  }
}
