import 'package:flutter/material.dart';
import 'components/calc_button.dart';

void main() {
  runApp(calculatorApp());
}

class calculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark(),
      home: calculatorScreen(),
    );
  }
}

class calculatorScreen extends StatefulWidget {
  const calculatorScreen({super.key});

  @override
  State<calculatorScreen> createState() => _calculatorScreenState();
}

class _calculatorScreenState extends State<calculatorScreen> {
  String _displayValue = "0";
  String _firstOperand = "";
  String _operation = "";
  bool _operationPressed = false;

  void _handleNumber(String number) {
    setState(() {
      if (_operationPressed) {
        _displayValue = number;
        _operationPressed = false;
      } else {
        if (_displayValue == "0") {
          _displayValue = number;
        } else {
          _displayValue += number;
        }
      }
    });
  }

  void _handleClear() {
    setState(() {
      _displayValue = "0";
      _firstOperand = "";
      _operation = "";
      _operationPressed = false;
    });
  }

  void _handleDecimal() {
    setState(() {
      if (!_displayValue.contains(",")) {
        _displayValue += ",";
      }
    });
  }

  void _handleOperation(String operation) {
    setState(() {
      _firstOperand = _displayValue;
      _operation = operation;
      _operationPressed = true;
    });
  }

  void _handleEqual() {
    if (_firstOperand.isNotEmpty && _operation.isNotEmpty) {
      setState(() {
        String firstNum = _firstOperand.replaceAll(',', '.');
        String secondNum = _displayValue.replaceAll(',', '.');

        double first = double.parse(firstNum);
        double second = double.parse(secondNum);
        double result = 0;

        switch (_operation) {
          case '+':
            result = first + second;
            break;
          case '—':
            result = first - second;
            break;
          case '×':
            result = first * second;
            break;
          case '÷':
            if (second != 0) {
              result = first / second;
            } else {
              _displayValue = "ERROR";
              _firstOperand = "";
              _operation = "";
              return;
            }
            break;
        }

        String resultStr = result.toString();
        if (resultStr.endsWith('.0')) {
          resultStr = resultStr.substring(0, resultStr.length - 2);
        }

        _displayValue = resultStr;
        _firstOperand = "";
        _operation = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayValue,
                style: TextStyle(
                  fontSize: 72.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
                maxLines: 1,
              ),
            ),
            Column(
              children: [
                /*
                  first row: AC, +/-, %
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: "AC",
                      backgroundColor: Color.fromARGB(255, 90, 88, 88),
                      onPressed: () => _handleClear(),
                    ),

                    CalcButton(
                      text: "+/-",
                      backgroundColor: Color.fromARGB(255, 90, 88, 88),
                      onPressed: () {},
                    ),

                    CalcButton(
                      text: "%",
                      backgroundColor: Color.fromARGB(255, 90, 88, 88),
                      onPressed: () {},
                    ),

                    CalcButton(
                      text: "÷",
                      backgroundColor: Colors.orange,
                      onPressed: () => _handleOperation("÷"),
                    ),
                  ],
                ),

                /*
                  second row: 7, 8, 9, x
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(text: "7", onPressed: () => _handleNumber("7")),

                    CalcButton(text: "8", onPressed: () => _handleNumber("8")),

                    CalcButton(text: "9", onPressed: () => _handleNumber("9")),

                    CalcButton(
                      text: "×",
                      backgroundColor: Colors.orange,
                      onPressed: () => _handleOperation("×"),
                    ),
                  ],
                ),

                /*
                  third row: 4, 5, 6, -
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(text: "4", onPressed: () => _handleNumber("4")),

                    CalcButton(text: "5", onPressed: () => _handleNumber("5")),

                    CalcButton(text: "6", onPressed: () => _handleNumber("6")),

                    CalcButton(
                      text: "—",
                      backgroundColor: Colors.orange,
                      onPressed: () => _handleOperation("—"),
                    ),
                  ],
                ),

                /*
                  fourth row: 1, 2, 3, +
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(text: "1", onPressed: () => _handleNumber("1")),

                    CalcButton(text: "2", onPressed: () => _handleNumber("2")),

                    CalcButton(text: "3", onPressed: () => _handleNumber("3")),

                    CalcButton(
                      text: "+",
                      backgroundColor: Colors.orange,
                      onPressed: () => _handleOperation("+"),
                    ),
                  ],
                ),

                /*
                  fifth row: empty, 0, ',', =
                */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(text: "", onPressed: () {}),

                    CalcButton(text: "0", onPressed: () => _handleNumber("0")),

                    CalcButton(text: ",", onPressed: () => _handleDecimal()),

                    CalcButton(
                      text: "=",
                      backgroundColor: Colors.orange,
                      onPressed: () => _handleEqual(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
