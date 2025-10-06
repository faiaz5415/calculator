import 'package:flutter/material.dart';
import 'customButton.dart';


class Modcalc extends StatefulWidget {
  const Modcalc({super.key});

  @override
  State<Modcalc> createState() => _ModcalcState();
}

class _ModcalcState extends State<Modcalc> {
  String _output = '0';
  String _input = '0';
  String operand = '0';
  double num1 = 0;
  double num2 = 0;

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _output = '0';
        _input = '0';
        num1 = 0;
        num2 = 0;
        operand = '';
      }
      else if (value == '+' || value == '-' || value == '×' || value == '÷') {
        num1 = double.tryParse(_input) ?? 0;
        operand = value;
        _input = '';
      }

      else if (value == '=') {
        num2 = double.tryParse(_input) ?? 0;

        double result = 0;
        if (operand == '+') result = num1 + num2;
        if (operand == '-') result = num1 - num2;
        if (operand == '×') result = num1 * num2;
        if (operand == '÷') {
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            _output = 'Error';
            _input = '';
            return;
          }
        }

        _output = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 2);
        _input = _output;
        operand = '';
      }
      // 4️⃣ Number pressed
      else {
        _input += value;
        _output = _input;
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(30),
              child: Text(_output,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
            ),
          ),
          Row(
            children: [
              Cusbu(onClick: () => _buttonPressed('7'), text: '7',),
              Cusbu(onClick: () => _buttonPressed('8'), text: '8',),
              Cusbu(onClick: () => _buttonPressed('9'), text: '9',),
              Cusbu(onClick: () => _buttonPressed('÷'), text: '÷', color: Colors.orange,)
            ],
          ),
          Row(
            children: [
              Cusbu(onClick: () => _buttonPressed('4'), text: '4',),
              Cusbu(onClick: () => _buttonPressed('5'), text: '5',),
              Cusbu(onClick: () => _buttonPressed('6'), text: '6',),
              Cusbu(onClick: () => _buttonPressed('×'), text: '×', color: Colors.orange,)
            ],
          ),
          Row(
            children: [
              Cusbu(onClick: () => _buttonPressed('1'), text: '1',),
              Cusbu(onClick: () => _buttonPressed('2'), text: '2',),
              Cusbu(onClick: () => _buttonPressed('3'), text: '3',),
              Cusbu(onClick: () => _buttonPressed('-'), text: '-', color: Colors.orange,)
            ],
          ),
          Row(
            children: [
              Cusbu(onClick: () => _buttonPressed('C'), text: 'C',),
              Cusbu(onClick: () => _buttonPressed('0'), text: '0',),
              Cusbu(onClick: () => _buttonPressed('='), text: '=',),
              Cusbu(onClick: () => _buttonPressed('+'), text: '+', color: Colors.orange,)
            ],
          ),
        ],
      ),
    );
  }
}


