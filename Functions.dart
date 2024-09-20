import 'package:flutter/material.dart';

//pages
Widget textf({required String text}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: text,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      contentPadding: EdgeInsets.all(10),
    ),
  );
}

Widget TextFieldWidget(
    {required String label,
    required TextEditingController controller,
    required String key}) {
  return TextField(
    key: ValueKey('key'),
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      hintText: 'Enter value',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    keyboardType: TextInputType.number,
  );
}

//drawers.dart
Widget myElevatedButton({
  required String iconAsset,
  required Widget page,
  required BuildContext context,
}) {
  return Padding(
    padding: MediaQuery.of(context).orientation == Orientation.portrait
        ? EdgeInsets.symmetric(vertical: 10, horizontal: 10)
        : EdgeInsets.symmetric(vertical: 10, horizontal: 50),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        minimumSize: Size(20, 20),
        padding: MediaQuery.of(context).orientation == Orientation.portrait
            ? EdgeInsets.all(30)
            : EdgeInsets.all(31),
      ),
      child: Image.asset(
        iconAsset,
        height: 50,
        width: 55,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
    ),
  );
}
