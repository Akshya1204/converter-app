import 'package:flutter/material.dart';
import 'package:flutter_application_1/Functions.dart';
import 'Time.dart';
import 'currency/screens/currency.dart';
import 'meter.dart';
import 'temperature.dart';
import 'weight.dart';

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                height: isLandscape ? 250 : 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/background1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: const Text(
                      "Conversions",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "unit Conversion",
                  style: TextStyle(
                    color: Color.fromARGB(255, 226, 230, 232),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Row(
                children: [
                  myElevatedButton(
                      page: meter_screen(),
                      context: context,
                      iconAsset: 'lib/assets/ruler.png'),
                  myElevatedButton(
                      page: temperature_screen(),
                      context: context,
                      iconAsset: 'lib/assets/temperature.png'),
                  myElevatedButton(
                      page: weight_screen(),
                      context: context,
                      iconAsset: 'lib/assets/weighing-machine.png')
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Time Conversion",
                  style: TextStyle(
                    color: Color.fromARGB(255, 226, 230, 232),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Row(
                children: [
                  myElevatedButton(
                      iconAsset: 'lib/assets/time.png',
                      page: time_screen(),
                      context: context),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Currency Conversion",
                  style: TextStyle(
                    color: Color.fromARGB(255, 226, 230, 232),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Row(
                children: [
                  myElevatedButton(
                      iconAsset: 'lib/assets/currency-conversion.png',
                      page: Home(),
                      context: context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
