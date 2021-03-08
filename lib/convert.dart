import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function konvertHandler;
  Convert({
    Key key,
    @required this.konvertHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: konvertHandler,
          child: const Text(
            'Konversi Suhu',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
