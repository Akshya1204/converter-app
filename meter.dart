import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions.dart';

class meter_screen extends StatefulWidget {
  const meter_screen({super.key});

  @override
  State<meter_screen> createState() => _MeterScreenState();
}

class _MeterScreenState extends State<meter_screen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController meterController = TextEditingController();
  var meter = ["meter", "centimeter", "foot", "inches", "kilometer"];
  String selectedValue = "meter"; // Initialize with the first option
  double _inputValue = 0;
  String _inputUnit = 'Meter';
  String _outputUnit = 'Centimeter';
  double _outputValue = 0;

  @override
  void initState() {
    super.initState();
    selectedValue = meter.first; // Set the selectedValue to the first option
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Length Conversion"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Card(
              child: Form(
                key: formKey,
                child: Column(children: [
                  // TextFormField(
                  //   key: ValueKey('hloo'),
                  //   controller: meterController,
                  //   decoration: InputDecoration(
                  //       labelText: 'Enter meter value',
                  //       hintText: 'Enter value',
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20))),
                  //   keyboardType: TextInputType.number,
                  // ),
                  TextFieldWidget(
                      label: "Enter meter value",
                      controller: meterController,
                      key: "hloo"),
                  SizedBox(height: 16), // add some space between fields
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        DropdownButton(
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          items: meter.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(width: w * 0.4),
                        DropdownButton(
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                            });
                          },
                          items: meter.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (meterController.text.isNotEmpty) {
                              setState(() {
                                _convert();
                              });
                            }
                          },
                          child: Text('Convert'),
                        ),
                        Text(
                          'Output: $_outputValue $_outputUnit',
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }

  void _convert() {
    switch (_inputUnit) {
      case 'Meter':
        switch (_outputUnit) {
          case 'Meter':
            _outputValue = _inputValue;
            break;
          case 'Centimeter':
            _outputValue = _inputValue * 100;
            break;
          case 'Millimeter':
            _outputValue = _inputValue * 1000;
            break;
          case 'Kilometer':
            _outputValue = _inputValue / 1000;
            break;
        }
        break;
      case 'Centimeter':
        switch (_outputUnit) {
          case 'Meter':
            _outputValue = _inputValue / 100;
            break;
          case 'Centimeter':
            _outputValue = _inputValue;
            break;
          case 'Millimeter':
            _outputValue = _inputValue * 10;
            break;
          case 'Kilometer':
            _outputValue = _inputValue / 100000;
            break;
        }
        break;
      case 'Millimeter':
        switch (_outputUnit) {
          case 'Meter':
            _outputValue = _inputValue / 1000;
            break;
          case 'Centimeter':
            _outputValue = _inputValue / 10;
            break;
          case 'Millimeter':
            _outputValue = _inputValue;
            break;
          case 'Kilometer':
            _outputValue = _inputValue / 1000000;
            break;
        }
        break;
      case 'Kilometer':
        switch (_outputUnit) {
          case 'Meter':
            _outputValue = _inputValue * 1000;
            break;
          case 'Centimeter':
            _outputValue = _inputValue * 100000;
            break;
          case 'Millimeter':
            _outputValue = _inputValue * 1000000;
            break;
          case 'Kilometer':
            _outputValue = _inputValue;
            break;
        }
        break;
    }
    setState(() {});
  }
}
