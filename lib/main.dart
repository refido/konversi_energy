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
  String _newValue = "Joules";
  double _result = 0;

  TextEditingController suhu = new TextEditingController();

  double _inputSuhu = 0;
  var listItem = ["Joules", "Kilojoules", "Electron Volts"];
  void _hitungEnergy() {
    setState(() {
      _inputSuhu = double.parse(suhu.text);
      if (_newValue == "Joules")
        _result = _inputSuhu + 273;
      else if (_newValue == "Kilojoules")
        _result = (4 / 5) * _inputSuhu;
      else
        _result = (_inputSuhu * 9 / 5) + 32;
      listViewItem.add("$_newValue : $_result");
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
              Input(input: suhu),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
                    _hitungEnergy();
                  });
                },
              ),
              Result(result: _result),
              Input(input: suhu),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: (String changeValue) {
                  setState(() {
                    _newValue = changeValue;
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
