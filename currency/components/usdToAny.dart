// // import 'package:flutter_application_1/currency/functions/fetchrates.dart';
// // import 'package:flutter/material.dart';

// // class UsdToAny extends StatefulWidget {
// //   final rates;
// //   final Map currencies;
// //   const UsdToAny({Key? key, @required this.rates, required this.currencies})
// //       : super(key: key);

// //   @override
// //   _UsdToAnyState createState() => _UsdToAnyState();
// // }

// // class _UsdToAnyState extends State<UsdToAny> {
// //   TextEditingController usdController = TextEditingController();
// //   String dropdownValue = 'AUD';
// //   String answer = 'Converted Currency will be shown here :)';

// //   @override
// //   Widget build(BuildContext context) {
// //     var w = MediaQuery.of(context).size.width;
// //     return Card(
// //       child: Container(
// //           width: w / 3,
// //           padding: EdgeInsets.all(20),
// //           child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   'USD to Any Currency',
// //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
// //                 ),
// //                 SizedBox(height: 20),

// //                 //TextFields for Entering USD
// //                 TextFormField(
// //                   key: ValueKey('usd'),
// //                   controller: usdController,
// //                   decoration: InputDecoration(hintText: 'Enter USD'),
// //                   keyboardType: TextInputType.number,
// //                 ),
// //                 SizedBox(height: 10),
// //                 Row(
// //                   children: [
// //                     //Future Builder for getting all currencies for dropdown list
// //                     Expanded(
// //                       child: DropdownButton<String>(
// //                         value: dropdownValue,
// //                         icon: const Icon(Icons.arrow_drop_down_rounded),
// //                         iconSize: 24,
// //                         elevation: 16,
// //                         isExpanded: true,
// //                         underline: Container(
// //                           height: 2,
// //                           color: Colors.grey.shade400,
// //                         ),
// //                         onChanged: (String? newValue) {
// //                           setState(() {
// //                             dropdownValue = newValue!;
// //                           });
// //                         },
// //                         items: widget.currencies.keys
// //                             .toSet()
// //                             .toList()
// //                             .map<DropdownMenuItem<String>>((value) {
// //                           return DropdownMenuItem<String>(
// //                             value: value,
// //                             child: Text(value),
// //                           );
// //                         }).toList(),
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       width: 10,
// //                     ),

// //                     //Convert Button
// //                     Container(
// //                       child: ElevatedButton(
// //                         onPressed: () {
// //                           setState(() {
// //                             answer = usdController.text +
// //                                 ' USD = ' +
// //                                 convertusd(widget.rates, usdController.text,
// //                                     dropdownValue) +
// //                                 ' ' +
// //                                 dropdownValue;
// //                           });
// //                         },
// //                         child: Text('Convert'),
// //                         style: ButtonStyle(
// //                             backgroundColor: WidgetStateProperty.all(
// //                                 Theme.of(context).primaryColor)),
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       width: 10,
// //                     ),
// //                   ],
// //                 ),

// //                 //Final Output
// //                 SizedBox(height: 10),
// //                 Container(child: Text(answer))
// //               ])),
// //     );
// //   }
// // }

// // import 'package:flutter_application_1/currency/functions/fetchrates.dart';
// import 'package:flutter_application_1/currency/models/ratesmodel.dart';
// import 'package:flutter/material.dart';

// class UsdToAny extends StatefulWidget {
//   final rates;
//   final Map<String, Datum> currencies;
//   const UsdToAny({Key? key, @required this.rates, required this.currencies})
//       : super(key: key);

//   @override
//   _UsdToAnyState createState() => _UsdToAnyState();
// }

// class _UsdToAnyState extends State<UsdToAny> {
//   TextEditingController usdController = TextEditingController();
//   String dropdownValue = '';
//   String answer = 'Converted Currency will be shown here :)';

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       dropdownValue = widget.currencies.keys.first;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var w = MediaQuery.of(context).size.width;
//     return Card(
//       child: Container(
//           width: w / 3,
//           padding: EdgeInsets.all(20),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'USD to Any Currency',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//                 ),
//                 SizedBox(height: 20),

//                 //TextFields for Entering USD
//                 TextFormField(
//                   key: ValueKey('usd'),
//                   controller: usdController,
//                   decoration: InputDecoration(hintText: 'Enter USD'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     //Future Builder for getting all currencies for dropdown list
//                     Expanded(
//                       child: DropdownButton<String>(
//                         value: dropdownValue,
//                         icon: const Icon(Icons.arrow_drop_down_rounded),
//                         iconSize: 24,
//                         elevation: 16,
//                         isExpanded: true,
//                         underline: Container(
//                           height: 2,
//                           color: Colors.grey.shade400,
//                         ),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             dropdownValue = newValue!;
//                           });
//                         },
//                         items: widget.currencies.keys
//                             .toSet()
//                             .toList()
//                             .map<DropdownMenuItem<String>>((value) {
//                           Datum datum = widget.currencies[value]!;
//                           return DropdownMenuItem<String>(
//                             value: value,
//                             child: Text('${datum.code} - ${datum.value}'),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),

//                     //Convert Button
//                     Container(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (usdController.text.isNotEmpty) {
//                             setState(() {
//                               Datum datum = widget.currencies[dropdownValue]!;
//                               double convertedAmount =
//                                   double.parse(usdController.text) *
//                                       datum.value;
//                               answer = usdController.text +
//                                   ' USD = ' +
//                                   convertedAmount.toStringAsFixed(2) +
//                                   ' ' +
//                                   dropdownValue;
//                             });
//                           }
//                         },
//                         child: Text('Convert'),
//                         style: ButtonStyle(
//                             backgroundColor: WidgetStateProperty.all(
//                                 Theme.of(context).primaryColor)),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                   ],
//                 ),

//                 //Final Output
//                 SizedBox(height: 10),
//                 Container(child: Text(answer))
//               ])),
//     );
//   }
// }

// import 'package:flutter_application_1/currency/functions/fetchrates.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// class UsdToAny extends StatefulWidget {
//   final Map<String, dynamic> rates;
//   const UsdToAny({Key? key, required this.rates}) : super(key: key);

//   @override
//   _UsdToAnyState createState() => _UsdToAnyState();
// }

// class _UsdToAnyState extends State<UsdToAny> {
//   TextEditingController usdController = TextEditingController();
//   String _selectedCurrency = '';
//   String _convertedAmount = '';

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _selectedCurrency = widget.rates.keys.first;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'USD to Any Currency',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//             SizedBox(height: 20),

//             //TextFields for Entering USD
//             TextFormField(
//               key: ValueKey('usd'),
//               controller: usdController,
//               decoration: InputDecoration(hintText: 'Enter USD'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 //DropdownButton for selecting currency
//                 DropdownButton(
//                   value: _selectedCurrency,
//                   icon: const Icon(Icons.arrow_downward),
//                   iconSize: 24,
//                   elevation: 16,
//                   style: TextStyle(color: Colors.deepPurple),
//                   underline: Container(
//                     height: 2,
//                     color: Colors.deepPurpleAccent,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedCurrency = newValue!;
//                     });
//                   },
//                   items: widget.rates.keys
//                       // .toSet()
//                       // .toList()
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),

//                 ElevatedButton(
//                   onPressed: () {
//                     if (usdController.text.isNotEmpty) {
//                       setState(() {
//                         double convertedAmount =
//                             double.parse(usdController.text) *
//                                 widget.rates[_selectedCurrency].value;
//                         _convertedAmount =
//                             '$convertedAmount ${_selectedCurrency.toUpperCase()}';
//                       });
//                     }
//                   },
//                   child: Text('Convert'),
//                   style: ButtonStyle(
//                       backgroundColor: WidgetStateProperty.all(
//                           Theme.of(context).primaryColor)),
//                 ),
//               ],
//             ),
//             SizedBox(width: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class UsdToAny extends StatefulWidget {
//   final Map<String, dynamic> rates;
//   const UsdToAny({Key? key, required this.rates}) : super(key: key);

//   @override
//   _UsdToAnyState createState() => _UsdToAnyState();
// }

// class _UsdToAnyState extends State<UsdToAny> {
//   TextEditingController usdController = TextEditingController();
//   String _selectedCurrency = '';
//   String _convertedAmount = '';

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _selectedCurrency = widget.rates.keys.first;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'USD to Any Currency',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//             SizedBox(height: 20),

//             //TextFields for Entering USD
//             TextFormField(
//               key: ValueKey('usd'),
//               controller: usdController,
//               decoration: InputDecoration(hintText: 'Enter USD'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 //DropdownButton for selecting currency
//                 DropdownButton(
//                   value: _selectedCurrency,
//                   icon: const Icon(Icons.arrow_downward),
//                   iconSize: 24,
//                   elevation: 16,
//                   style: TextStyle(color: Colors.deepPurple),
//                   underline: Container(
//                     height: 2,
//                     color: Colors.deepPurpleAccent,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedCurrency = newValue!;
//                     });
//                   },
//                   items: widget.rates.keys
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),

//                 ElevatedButton(
//                   onPressed: () {
//                     if (usdController.text.isNotEmpty) {
//                       setState(() {
//                         double convertedAmount =
//                             double.parse(usdController.text) *
//                                 widget.rates[_selectedCurrency]!.value;
//                         _convertedAmount =
//                             '$convertedAmount ${_selectedCurrency.toUpperCase()}';
//                       });
//                     }
//                   },
//                   child: Text('Convert'),
//                   style: ButtonStyle(
//                       backgroundColor: WidgetStateProperty.all(
//                           Theme.of(context).primaryColor)),
//                 ),
//               ],
//             ),
//             SizedBox(width: 10),
//             Text(
//               "converted amount is :${_convertedAmount}",
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class UsdToAny extends StatefulWidget {
//   final Map<String, dynamic> rates;
//   const UsdToAny({Key? key, required this.rates}) : super(key: key);

//   @override
//   _UsdToAnyState createState() => _UsdToAnyState();
// }

// class _UsdToAnyState extends State<UsdToAny> {
//   TextEditingController usdController = TextEditingController();
//   String _selectedCurrency = '';
//   String _convertedAmount = '';

//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _selectedCurrency = widget.rates.keys.first;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'USD to Any Currency',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//             SizedBox(height: 20),

//             //TextFields for Entering USD
//             TextFormField(
//               controller: usdController,
//               decoration: InputDecoration(hintText: 'Enter USD'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 //DropdownButton for selecting currency
//                 DropdownButton(
//                   value: _selectedCurrency,
//                   icon: const Icon(Icons.arrow_downward),
//                   iconSize: 24,
//                   elevation: 16,
//                   style: TextStyle(color: Colors.deepPurple),
//                   underline: Container(
//                     height: 2,
//                     color: Colors.deepPurpleAccent,
//                   ),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedCurrency = newValue!;
//                     });
//                   },
//                   items: widget.rates.keys
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),

//                 //Convert Button
//                 ElevatedButton(
//                   onPressed: () {
//                     if (usdController.text.isNotEmpty) {
//                       setState(() {
//                         double convertedAmount =
//                             double.parse(usdController.text) *
//                                 widget.rates[_selectedCurrency];
//                         _convertedAmount =
//                             '$convertedAmount ${_selectedCurrency.toUpperCase()}';
//                       });
//                     }
//                   },
//                   child: Text('Convert'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text("converted amount:${_convertedAmount}"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

class UsdToAny extends StatefulWidget {
  final Map<String, dynamic> rates;
  const UsdToAny({Key? key, required this.rates}) : super(key: key);

  @override
  _UsdToAnyState createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String _selectedCurrency = '';
  String _convertedAmount = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedCurrency = widget.rates.keys.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'USD to Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),

            //TextFields for Entering USD
            TextFormField(
              key: ValueKey('usd'),
              controller: usdController,
              decoration: InputDecoration(hintText: 'Enter USD'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                //DropdownButton for selecting currency
                DropdownButton(
                  value: _selectedCurrency,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCurrency = newValue!;
                    });
                  },
                  items: widget.rates.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  width: 10,
                ),

                ElevatedButton(
                  onPressed: () {
                    if (usdController.text.isNotEmpty) {
                      setState(() {
                        double convertedAmount =
                            double.parse(usdController.text) *
                                widget.rates[_selectedCurrency]!.value;
                        _convertedAmount =
                            '$convertedAmount ${_selectedCurrency.toUpperCase()}';
                      });
                    }
                  },
                  child: Text('Convert'),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).primaryColor)),
                ),
              ],
            ),
            SizedBox(width: 10),
            Text(
              "Converted amount is${_convertedAmount}",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
