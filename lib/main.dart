import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int? first, second;
  String? operation;
  String? result, text= '';


  void btnClicked(String btnText) {
    if (btnText == 'AC') {
      result = '';
      text = '';
      first = 0;
      second = 0;
    } else
    if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/') {
      first = int.parse(text!);
      result = '';
      operation = btnText;
    } else if (btnText == '=') {
      second = int.parse(text!);
      if (operation == '+') {
        result = (first! + second!).toString();
      } else if (operation == '-') {
        result = (first! - second!).toString();
      } else if (operation == 'x') {
        result = (first! * second!).toString();
      } else if (operation == '/') {
        result = (first! ~/ second!).toString();
      }
    } else {
      result = int.parse(text! + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }

      Widget calcButton(String value) {
        return Expanded(
          child: MaterialButton(
            color: Colors.black87,
            textColor: Colors.white,
            onPressed: () => btnClicked(value),
            padding: const EdgeInsets.all(25),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        );
      }
  Widget oppButton(String value) {
    return Expanded(
      child: MaterialButton(
        color: Colors.orange,
        textColor: Colors.white,
        onPressed: () => btnClicked(value),
        padding: const EdgeInsets.all(25),
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text(
              'calculator',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),

          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black87,
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.topCenter,
                  child:  Text(
                    text!,
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  calcButton('9'),
                  calcButton('8'),
                  calcButton('7'),
                  oppButton('+'),
                ],
              ),
              Row(
                children: [
                  calcButton('6'),
                  calcButton('5'),
                  calcButton('4'),
                  oppButton('-'),
                ],
              ),
              Row(
                children: [
                  calcButton('3'),
                  calcButton('2'),
                  calcButton('1'),
                  oppButton('x'),
                ],
              ),
              Row(
                children: [
                  calcButton('AC'),
                  calcButton('0'),
                  calcButton('='),
                  oppButton('/'),
                ],
              ),
            ],
          ),
        );
      }
}


