// ignore_for_file: deprecated_member_use, camel_case_types

import 'package:flutter/material.dart';

class botones extends StatefulWidget{
    const botones({Key? key}) : super(key: key);

  @override
  _botonesState createState() => _botonesState();
}


class _botonesState extends State<botones> {
  String salida = "0";

  String _sal = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operacion = "";

  buttonPress(String buttonText){

    if(buttonText == "Reset"){
       _sal = "0";
       num1 = 0.0;
       num2 = 0.0;
       operacion = "";
    }else if(buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X" || buttonText == "%"){
      num1 = double.parse(salida);
      operacion = buttonText;
      _sal = "0";
    }else if(buttonText == "."){
      if(_sal.contains(".")){
        return;
      }else{
        _sal = _sal + buttonText;
      }
    }else if(buttonText == "="){
      num2 = double.parse(salida);

      if(operacion == "+"){
        _sal = (num1 + num2).toString();
      }
      if(operacion == "-"){
        _sal = (num1-num2).toString();

      }
      if(operacion == "X"){
        _sal = (num1*num2).toString();

      }
      if(operacion == "/"){
        _sal = (num1/num2).toString();

      }
      if(operacion == "%"){
        _sal = (num2*(num1/100)).toString();

      }
      num1 = 0.0;
      num2 = 0.0;
      operacion = "";
    }else{
      _sal = _sal + buttonText;
    }

    setState(() {
      salida = double.parse(_sal).toStringAsFixed(2);
    });

  }
  
Widget buildButton(String buttonText){
    return  Expanded(
      child:  OutlineButton(
        padding:const EdgeInsets.all(24.0),
        child:Text(
          buttonText,
          style:const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: (){
          buttonPress(buttonText);
        },
      ), 
      );
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(
            vertical: 24.0,
            horizontal: 12.0
          ),
          child: Text(
            salida,
            style: const TextStyle(
              fontSize: 48.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const Expanded(
          child: 
          Divider(),
        ),

        Column(
          children: [
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ],
            )
          ],
        ),
      
        Column(
          children: [
            Row(
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ],
            )
          ],
        ),

        Column(
          children: [
            Row(
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ],
            )
          ],
        ),

        Column(
          children: [
            Row(
              children: [
                buildButton("0"),
                buildButton("00"),
                buildButton("."),
                buildButton("+")
              ],
            )
          ],
        ),

        Column(
          children: [
            Row(
              children: [
                buildButton("Reset"),
                buildButton("="),
                buildButton("%")
              ],
            )
          ],
        ),

      ],
    );
  }

}

 
