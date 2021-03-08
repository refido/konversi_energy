import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.input,
  }) : super(key: key);

  final TextEditingController input;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: input,
      decoration: new InputDecoration(labelText: "Masukkan Nilai"),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp(r'[0-9+\.]'),
        ),
      ],
    );
  }
}
