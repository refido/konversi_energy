import 'package:flutter/material.dart';
import 'input.dart';
import 'convert.dart';
import 'result.dart';
import 'history.dart';

const PrimaryColor = const Color(0xffFFFF00);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> listViewItem = [];
  String _value1 = "Joules";
  String _value2 = "Kilojoules";
  double _result = 0;

  TextEditingController data1 = new TextEditingController();
  TextEditingController data2 = new TextEditingController();

  double _input1 = 0;
  var listItem = ["Joules", "Kilojoules", "Electron Volts"];
  void _hitungEnergy() {
    setState(() {
      _input1 = double.parse(data1.text);
      if (_value1 == "Joules" && _value2 == "Kilojoules") //joules ke kilojoules
        _result = _input1 / 1000;
      else if (_value1 == "Kilojoules" &&
          _value2 == "Joules") //killojoules ke joules
        _result = _input1 * 1000;
      else
        _result = _input1 * 2;
      listViewItem.add("$_value1 -> $_value2 = $_result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konverter Energy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: Text("Konvert", style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(input: data1),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _value1,
                onChanged: (String changeValue) {
                  setState(() {
                    _value1 = changeValue;
                    _hitungEnergy();
                  });
                },
              ),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _value2,
                onChanged: (String changeValue) {
                  setState(() {
                    _value2 = changeValue;
                    _hitungEnergy();
                  });
                },
              ),
              Result(result: _result),
              Convert(konvertHandler: _hitungEnergy),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Konversi",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: History(listViewItem: listViewItem),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
