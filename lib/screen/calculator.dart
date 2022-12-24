import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";
  String expression = "";

  List<String> buttonList = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Calculator',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.centerRight,
                child: Text(
                  userInput,
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 58, 90, 64),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.centerRight,
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 48,
                    color: Color.fromARGB(255, 58, 90, 64),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: buttonList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (BuildContext context, int index) {
              return CustomButton(buttonList[index]);
            },
          ),
        )),
      ],
    ));
  }

  Widget CustomButton(String text) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () {
        setState(() {
          handleButton(text);
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: getColor(text),
            ),
          ),
        ),
      ),
    );
  }

  getColor(String text) {
    if (text == '/' ||
        text == '*' ||
        text == '-' ||
        text == '+' ||
        text == '(' ||
        text == ')' ||
        text == 'C') {
      return Color.fromARGB(255, 58, 90, 64);
    }
    if (text == 'AC') {
      return Color.fromARGB(255, 213, 94, 45);
    }
  }

  handleButton(String text) {
    if (text == "AC") {
      userInput = "";
      result = "0";
      return;
    } else if (text == "C") {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
        return;
      } else {
        return null;
      }
    } else if (text == "=") {
      result = calculate();
      userInput = result;
    } else {
      if (userInput == "0") {
        userInput = text;
      }
      userInput = userInput + text;
    }
  }

  String calculate() {
    try {
      Parser p = new Parser();
      Expression exp = p.parse(userInput);

      ContextModel cm = ContextModel();
      result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      return result.toString();
    } catch (e) {
      return "error";
    }
  }
}
