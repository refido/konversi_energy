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

  TextEditingController data = new TextEditingController();

  double _input = 0;
  var listItem = [
    "Joules",
    "Kilojoules",
    "Gram calorie",
    "Kilo calorie",
    "Watt hour",
    "Kilowatt hour"
  ];
  void _hitungEnergy() {
    setState(() {
      _input = double.parse(data.text);
      //joules ke joules
      if (_value1 == "Joules" && _value2 == "Joules")
        _result = _input;
      //joules ke kilojoules
      else if (_value1 == "Joules" && _value2 == "Kilojoules")
        _result = _input / 1000;
      //joules ke gram calorie
      else if (_value1 == "Joules" && _value2 == "Gram calorie")
        _result = _input / 4.184;
      //joules ke kilo calorie
      else if (_value1 == "Joules" && _value2 == "Kilo calorie")
        _result = _input / 4184;
      //joules ke watt hour
      else if (_value1 == "Joules" && _value2 == "Watt hour")
        _result = _input / 3600;
      //joules ke kilowatt hour
      else if (_value1 == "Joules" && _value2 == "Kilowatt hour")
        _result = _input / 3600000;
      //kilojoules ke kilojoules
      else if (_value1 == "Kilojoules" && _value2 == "Kilojoules")
        _result = _input;
      //kilojoules ke joules
      else if (_value1 == "Kilojoules" && _value2 == "Joules")
        _result = _input * 1000;
      //kilojoules ke gram calorie
      else if (_value1 == "Kilojoules" && _value2 == "Gram calorie")
        _result = _input * 239;
      //kilojoules ke kilo calorie
      else if (_value1 == "Kilojoules" && _value2 == "Kilo calorie")
        _result = _input / 4.184;
      //kilojoules ke watt hour
      else if (_value1 == "Kilojoules" && _value2 == "Watt hour")
        _result = _input / 3.6;
      //kilojoules ke kilowatt hour
      else if (_value1 == "Kilojoules" && _value2 == "Kilowatt hour")
        _result = _input / 3600;
      //gram calorie ke gram calorie
      else if (_value1 == "Gram calorie" && _value2 == "Gram calorie")
        _result = _input;
      //gram calorie ke joules
      else if (_value1 == "Gram calorie" && _value2 == "Joules")
        _result = _input * 4.184;
      //gram calorie ke kilojoule
      else if (_value1 == "Gram calorie" && _value2 == "Kilojoules")
        _result = _input / 239;
      //gram calorie ke kilo calorie
      else if (_value1 == "Gram calorie" && _value2 == "Kilo calorie")
        _result = _input / 1000;
      //gram calorie ke watt hour
      else if (_value1 == "Gram calorie" && _value2 == "Watt hour")
        _result = _input / 860;
      //gram calorie ke kilowatt hour
      else if (_value1 == "Gram calorie" && _value2 == "Kilowatt hour")
        _result = _input / 860421;
      //kilo calorie ke kilo calorie
      else if (_value1 == "Kilo calorie" && _value2 == "Kilo calorie")
        _result = _input;
      //kilo calorie ke joules
      else if (_value1 == "Kilo calorie" && _value2 == "Joules")
        _result = _input * 4184;
      //kilo calorie ke kilo joule
      else if (_value1 == "Kilo calorie" && _value2 == "Kilojoules")
        _result = _input * 4.184;
      //kilo calorie ke gram calorie
      else if (_value1 == "Kilo calorie" && _value2 == "Gram calorie")
        _result = _input * 1000;
      //kilo calorie ke watt hour
      else if (_value1 == "Kilo calorie" && _value2 == "Watt hour")
        _result = _input * 1.162;
      //kilo calorie ke kilowatt hour
      else if (_value1 == "Kilo calorie" && _value2 == "Kilowatt hour")
        _result = _input / 860;
      //watt hour ke watt hour
      else if (_value1 == "Watt hour" && _value2 == "Watt hour")
        _result = _input;
      //watt hour ke joules
      else if (_value1 == "Watt hour" && _value2 == "Joules")
        _result = _input * 3600;
      //watt hour ke kilo joule
      else if (_value1 == "Watt hour" && _value2 == "Kilojoules")
        _result = _input * 3.6;
      //watt hour ke gram calorie
      else if (_value1 == "Watt hour" && _value2 == "Gram calorie")
        _result = _input * 860;
      //watt hour ke kilo calorie
      else if (_value1 == "Watt hour" && _value2 == "Kilo calorie")
        _result = _input / 1.162;
      //watt hour ke kilowatt hour
      else if (_value1 == "Watt hour" && _value2 == "Kilowatt hour")
        _result = _input / 1000;
      //kilowatt hour ke kilowatt hour
      else if (_value1 == "Kilowatt hour" && _value2 == "Kilowatt hour")
        _result = _input;
      //kilowatt hour ke joules
      else if (_value1 == "Kilowatt hour" && _value2 == "Joules")
        _result = _input * 3600000;
      //kilowatt hour ke kilo joule
      else if (_value1 == "Kilowatt hour" && _value2 == "Kilojoules")
        _result = _input * 3600;
      //kilowatt hour ke gram calorie
      else if (_value1 == "Kilowatt hour" && _value2 == "Gram calorie")
        _result = _input * 860421;
      //kilowatt hour ke kilo calorie
      else if (_value1 == "Kilowatt hour" && _value2 == "Kilo calorie")
        _result = _input * 860;
      //kilowatt hour ke watt hour
      else if (_value1 == "Kilowatt hour" && _value2 == "Watt hour")
        _result = _input * 1000;
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
            children: <Widget>[
              Input(input: data),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  Icon(
                    Icons.arrow_forward,
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
                ],
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
