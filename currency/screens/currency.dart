import 'package:flutter/material.dart';
import 'package:flutter_application_1/currency/components/anyToAny.dart';
import 'package:flutter_application_1/currency/components/usdToAny.dart';
import 'package:flutter_application_1/currency/functions/fetchrates.dart';
import 'package:flutter_application_1/currency/models/ratesmodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Initial Variables

  late Future<RatesModel> result;
  final formkey = GlobalKey<FormState>();

  //Getting RatesModel
  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchrates();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text('Currency')),

        //Future Builder for Getting Exchange Rates
        body: Container(
          height: h,
          width: w,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/currency.jpeg'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: FutureBuilder<RatesModel>(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  RatesModel ratesModel = snapshot.data!;
                  Map<String, Datum> rates = ratesModel.data;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UsdToAny(
                        // currencies: rates.keys.toList(), // List of currency codes
                        rates: rates,
                      ),
                      AnyToAny(
                        currencies:
                            rates.keys.toList(), // List of currency codes
                        rates: rates,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ));
  }
}
