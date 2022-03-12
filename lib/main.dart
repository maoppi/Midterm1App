import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: homeWidget()
  ));
}

class homeWidget extends StatefulWidget {

  @override
  _homeWidgetState createState() => _homeWidgetState();
}

class _homeWidgetState extends State<homeWidget> {

  String result = "0.000";
  String _result = "0";
  double num1 = 0.0, num2 = 0;
  String oper = "";

  btnFunc (String value) {
    if(value == "C") {
      result = "0";
      _result = "0";
      num1 = 0;
      num2 = 0;
      oper = "";
    } else if (value == ".") {
      if(_result.contains(".")) {
        return;
      } else {
        _result += value;
      }

    } else if (value == "+/-") {
      if(double.parse(_result) > 0) {
          _result = "-" + _result;
      } else {
        _result = _result.substring(1);
      }
    } else if (value == "%") {
      _result = (double.parse(_result) / 100).toString();
    }

    else if (value == "+" || value == "-" || value == "*" || value == "/") {
      num1 = double.parse(result);
      oper = value;
      _result = "0";
      result += value;

    }
    else if (value == "=") {
      num2 = double.parse(result);
      if(oper == "+") {
        _result = (num1+num2).toString();
      }
      if(oper == "-") {
        _result = (num1-num2).toString();
      }
      if(oper == "*") {
        _result = (num1*num2).toString();
      }
      if(oper == "/") {
        _result = (num1/num2).toString();
      }

      num1 = 0;
      num2 = 0;
    } else {
      _result = _result+value;
    }

    setState(() {
      result = double.parse(_result).toStringAsFixed(3);
    });
  }

  //buttons
  Widget btn(String btnVal, Color btnColor) {
    return Expanded(
        child: Container(

          margin: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: btnColor,
          ),
          child: MaterialButton(
            padding: const EdgeInsets.all(24.0),
            onPressed: () { btnFunc(btnVal);},

            child: Text(btnVal, style: const TextStyle(

              fontSize: 40.0,
              color: Colors.white,
            ),
            ),
          ),
        )
    );
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black87,
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.all(30.0),
                  child:  Text(result, style: const TextStyle(
                    fontSize: 80.0,
                    color: Colors.white,
                  ), ),
                ),
                Expanded(
                    child: Divider()
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        btn("C", Colors.white10),
                        btn("+/-", Colors.white10),
                        btn("%", Colors.white10),
                        btn("/", Colors.orange),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        btn("7", Colors.grey),
                        btn("8", Colors.grey),
                        btn("9", Colors.grey),
                        btn("*", Colors.orange),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        btn("4", Colors.grey),
                        btn("5", Colors.grey),
                        btn("6", Colors.grey),
                        btn("-", Colors.orange),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        btn("1", Colors.grey),
                        btn("2", Colors.grey),
                        btn("3", Colors.grey),
                        btn("+", Colors.orange),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        btn("0", Colors.grey),
                        btn(".", Colors.grey),
                        btn("=", Colors.orange),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

