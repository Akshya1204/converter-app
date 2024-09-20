import 'package:flutter/material.dart';
import 'package:flutter_application_1/currency/models/ratesmodel.dart';

class AnyToAny extends StatefulWidget {
  final List<String> currencies;
  final Map<String, Datum> rates;

  AnyToAny({required this.currencies, required this.rates});

  @override
  _AnyToAnyState createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amountController = TextEditingController();
  String? _fromCurrency;
  String? _toCurrency;
  // double _amount = 0.0;
  double _result = 0.0;

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
              'Convert Any Currency',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 20),

            //TextFields for Entering USD
            TextFormField(
              key: ValueKey('amount'),
              controller: amountController,
              decoration: InputDecoration(hintText: 'Enter Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(children: [
              SizedBox(
                width: 100,
                child: DropdownButton(
                  value: _fromCurrency,
                  onChanged: (value) {
                    setState(() {
                      _fromCurrency = value as String;
                    });
                  },
                  items: widget.currencies.map((currency) {
                    Datum datum = widget.rates[currency]!;
                    return DropdownMenuItem(
                      child: Text('${datum.code}'),
                      value: currency,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 100),
              SizedBox(
                width: 100,
                child: DropdownButton(
                  value: _toCurrency,
                  onChanged: (value) {
                    setState(() {
                      _toCurrency = value as String;
                    });
                  },
                  items: widget.currencies.map((currency) {
                    Datum datum = widget.rates[currency]!;
                    return DropdownMenuItem(
                      child: Text('${datum.code}'),
                      value: currency,
                    );
                  }).toList(),
                ),
              ),
            ]),

            ElevatedButton(
              onPressed: () {
                if (amountController.text.isNotEmpty &&
                    _fromCurrency != null &&
                    _toCurrency != null) {
                  setState(() {
                    double amt = widget.rates[_toCurrency]!.value;
                    double fromAmt = widget.rates[_fromCurrency]!.value;
                    double convertedamount =
                        double.parse(amountController.text) * amt / fromAmt;
                    _result = convertedamount;
                  });
                }
              },
              child: Text('Convert'),
            ),
            Text('Result: $_result'),
          ],
        ),
      ),
    );
  }
}
