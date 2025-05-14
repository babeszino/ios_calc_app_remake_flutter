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
                "0",
                style: TextStyle(
                  fontSize: 72.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
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
                      onPressed: () {},
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
                      onPressed: () {},
                    ),
                  ],
                ),

                /*
                  second row: 7, 8, 9, x
                */

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(text: "7", onPressed: () {}),

                    CalcButton(text: "8", onPressed: () {}),

                    CalcButton(text: "9", onPressed: () {}),

                    CalcButton(
                      text: "×",
                      backgroundColor: Colors.orange,
                      onPressed: () {},
                    ),
                  ],
                ),

                /*
                  third row: 4, 5, 6, -
                */

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(text: "4", onPressed: () {}),

                    CalcButton(text: "5", onPressed: () {}),

                    CalcButton(text: "6", onPressed: () {}),

                    CalcButton(
                      text: "—",
                      backgroundColor: Colors.orange,
                      onPressed: () {},
                    ),
                  ],
                ),

                /*
                  fourth row: 1, 2, 3, +
                */

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(text: "1", onPressed: () {}),

                    CalcButton(text: "2", onPressed: () {}),

                    CalcButton(text: "3", onPressed: () {}),

                    CalcButton(
                      text: "+",
                      backgroundColor: Colors.orange,
                      onPressed: () {},
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

                    CalcButton(text: "0", onPressed: () {}),

                    CalcButton(text: ",", onPressed: () {}),

                    CalcButton(
                      text: "=",
                      backgroundColor: Colors.orange,
                      onPressed: () {},
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
