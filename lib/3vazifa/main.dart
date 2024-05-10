import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0';
  double _result = 0;
  String _currentOperator = '0';
  bool _resetInput = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(16.0),
              color: Colors.grey,
              child: Text(
                _display,
                style: TextStyle(fontSize: 32.0),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('C', buttonColor: Colors.grey),
                    _buildButton('0'),
                    _buildButton('=', buttonColor: Colors.grey),
                    _buildButton('/'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {Color? buttonColor}) {
    buttonColor ??= text == 'C'
        ? Colors.red
        : text == '='
            ? Colors.blue
            : Colors.lightGreen;
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawMaterialButton(
            onPressed: () {
              if (text == '=') {
                _onEqualPress();
              } else {
                _onDigitPress(text);
              }
            },
            fillColor: buttonColor,
            elevation: 2.0,
            padding: EdgeInsets.all(20.0),
            shape: CircleBorder(),
            child: Text(
              text,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  void _onDigitPress(String digit) {
    setState(() {
      if (_resetInput) {
        _display = ' ';
        _resetInput = false;
      }
      if (_currentOperator == '0') {
        _display = digit;
      } else {
        _display += digit;
      }
    });
  }

  void _onEqualPress() {
    setState(() {
      _evaluate();
      _resetInput = true;
    });
  }

  void _evaluate() {
    double number = double.parse(_display);
    switch (_currentOperator) {
      case '+':
        _result += number;
        break;
      case '-':
        _result -= number;
        break;
      case '*':
        _result *= number;
        break;
      case '/':
        _result /= number;
        break;
      default:
        _result = number;
    }
    _display = _result.toString();
  }

  void _onClearPress() {
    setState(() {
      _display = '';
      _result = 0;
      _currentOperator = '';
      _resetInput = false;
    });
  }
}
