import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[600],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Roll the Dice'),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  var leftvalue = 1;
  var rightvalue = 1;
  double rightWidth = 120;
  double leftWidth = 260;
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutQuint,
            width: rightWidth,
            child: FlatButton(
              onPressed: () {
                setState(() {
                  rightWidth = 260;
                  leftWidth = 120;
                  leftvalue = Random().nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$leftvalue.png'),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutQuint,
            width: leftWidth,
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    rightWidth = 120;
                    leftWidth = 260;
                    rightvalue = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset('images/dice$rightvalue.png')),
          ),
        ],
      ),
    );
  }
}
